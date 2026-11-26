# Load collected run data
# The collection workbook uses tokens that match randomisation.csv
# Figures and tables are written to outputs/ so a fresh clone can rebuild every
# artefact by running this script from the repository root.
dir.create("outputs/tables", recursive = TRUE, showWarnings = FALSE)
dir.create("outputs/figures", recursive = TRUE, showWarnings = FALSE)
dir.create("logs", recursive = TRUE, showWarnings = FALSE)

runs <- read.csv("data/clean/runs.csv", stringsAsFactors = FALSE)
head(runs)
names(runs)

runs$charger <- factor(runs$charger, levels = c("20W", "140W"))
runs$cable <- factor(runs$cable, levels = c("3A", "5A"))

# Draw class reflects effective draw under the study chargers
runs$draw_class <- factor(runs$draw_class, levels = c("high", "low"))

# Treatment code from charger and cable
runs$treatment <- factor(paste(runs$charger, runs$cable, sep = "_"))

runs$device <- factor(runs$device_name)
runs$charge_rate <- runs$delta_soc / runs$elapsed_min
table(runs$device, runs$treatment)

# Main ANOVA with device blocking
fit <- aov(charge_rate ~ device + charger * cable, data = runs)
summary(fit)

mean_square_error <- deviance(fit) / df.residual(fit)
error_degrees_freedom <- df.residual(fit)
mean_square_error
error_degrees_freedom

# Treatment cell means and standard errors
cells <- expand.grid(charger = c("20W", "140W"), cable = c("3A", "5A"))
cells$treatment <- paste(cells$charger, cells$cable, sep = "_")
cells$mean_rate <- tapply(runs$charge_rate, runs$treatment, mean)[cells$treatment]
cells$standard_error <- sqrt(mean_square_error / 8)
cells

# All pairwise treatment comparisons
fit_treatment <- aov(charge_rate ~ device + treatment, data = runs)
TukeyHSD(fit_treatment, "treatment")

# Per-device treatment means
device_means <- tapply(runs$charge_rate, list(runs$device, runs$treatment), mean)
head(device_means)

# Interaction contrast within each device
device_contrast <- device_means[, "140W_5A"] - device_means[, "140W_3A"] -
  device_means[, "20W_5A"] + device_means[, "20W_3A"]
device_contrast

device_class <- runs$draw_class[match(rownames(device_means), runs$device_name)]
device_class

high_count <- sum(device_class == "high")
low_count <- sum(device_class == "low")
high_count
low_count

high_contrast <- mean(device_contrast[device_class == "high"])
low_contrast <- mean(device_contrast[device_class == "low"])

high_standard_error <- 2 * sqrt(mean_square_error / high_count)
low_standard_error <- 2 * sqrt(mean_square_error / low_count)
difference_standard_error <- 2 * sqrt(mean_square_error * (1 / high_count + 1 / low_count))
t_critical <- qt(0.975, error_degrees_freedom)

interval <- function(estimate, standard_error) {
  c(estimate = estimate,
    low = estimate - t_critical * standard_error,
    high = estimate + t_critical * standard_error)
}
results <- rbind(
  high = interval(high_contrast, high_standard_error),
  low = interval(low_contrast, low_standard_error),
  high_minus_low = interval(high_contrast - low_contrast, difference_standard_error)
)
results

# Write the ANOVA table, cell means and planned-contrast intervals
capture.output(summary(fit), file = "outputs/tables/anova.txt")
write.csv(cells, "outputs/tables/cell_means.csv", row.names = FALSE)
write.csv(as.data.frame(t(results)), "outputs/tables/planned_contrasts.csv")

# Residual, normality and interaction diagnostics, saved as figures
png("outputs/figures/residuals_vs_fitted.png", width = 1200, height = 900, res = 150)
plot(fitted(fit), residuals(fit),
     xlab = "Fitted rate (% per min)", ylab = "Residual (% per min)",
     main = "Residuals versus fitted")
abline(h = 0, lty = 2, col = "grey")
dev.off()

png("outputs/figures/qq_plot.png", width = 1200, height = 900, res = 150)
qqnorm(residuals(fit), main = "Normal Q-Q plot of residuals")
qqline(residuals(fit))
dev.off()

png("outputs/figures/interaction_plot.png", width = 1200, height = 900, res = 150)
interaction.plot(runs$charger, runs$cable, runs$charge_rate,
                 xlab = "Charger", trace.label = "Cable",
                 ylab = "Mean rate (% per min)", main = "Charger by cable interaction")
dev.off()
