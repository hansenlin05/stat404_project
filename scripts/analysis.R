# Load collected run data
runs <- read.csv("data/clean/runs.csv", stringsAsFactors = FALSE)
head(runs)
names(runs)

# The collection sheet uses readable labels. Normalise them for analysis.
# 140W+5A线 / 140W / 5A线 -> 140W / 5A, and 高功耗 -> high.
runs$charger <- factor(
  ifelse(grepl("140", as.character(runs$charger)), "140W", "20W"),
  levels = c("20W", "140W")
)
runs$cable <- factor(
  ifelse(grepl("5A", as.character(runs$cable)), "5A", "3A"),
  levels = c("3A", "5A")
)
runs$draw_class <- factor(
  ifelse(grepl("高", as.character(runs$draw_class)), "high", "low"),
  levels = c("high", "low")
)

# The draw class comes from the pilot measurement, not from the seed.
if (anyNA(runs$draw_class)) {
  stop("Some runs have no draw_class. Complete the pilot and fill the column before analysis.")
}
class_per_device <- tapply(runs$draw_class, runs$device_name, function(x) {
  length(unique(x[!is.na(x)]))
})
if (any(class_per_device > 1)) {
  stop("A device has conflicting draw_class values. Fix the collection sheet first.")
}

# Each device must contain each treatment exactly once.
runs$treatment <- factor(paste(runs$charger, runs$cable, sep = "_"))
check_design <- table(runs$device_name, runs$treatment)
if (nrow(check_design) != 8 || any(check_design != 1)) {
  stop("The design is not one run per device and treatment. Check the randomisation.")
}

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
