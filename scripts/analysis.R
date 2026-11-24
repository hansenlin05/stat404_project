# Load collected run data
# The collection workbook uses tokens that match randomisation.csv
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

# Residual and interaction diagnostics
plot(fitted(fit), residuals(fit))
qqnorm(residuals(fit))
qqline(residuals(fit))
interaction.plot(runs$charger, runs$cable, runs$charge_rate)
