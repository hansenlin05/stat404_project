# Randomise treatment order for each device
set.seed(20261120)

device_names <- c("MacBook Pro 14", "D2", "D3", "D4", "D5", "D6", "D7", "D8")
treatments <- c("140W_5A", "20W_5A", "140W_3A", "20W_3A")
chargers <- c("140W", "20W", "140W", "20W")
cables <- c("5A", "5A", "3A", "3A")

randomisation_plan <- data.frame(
  device_id = integer(),
  device = character(),
  slot = integer(),
  treatment = character(),
  charger = character(),
  cable = character()
)

for (device_index in 1:8) {
  treatment_order <- sample(4)
  device_plan <- data.frame(
    device_id = device_index,
    device = device_names[device_index],
    slot = 1:4,
    treatment = treatments[treatment_order],
    charger = chargers[treatment_order],
    cable = cables[treatment_order]
  )
  randomisation_plan <- rbind(randomisation_plan, device_plan)
}

# Starting charger at each station
station_start <- sample(c("140W", "20W"))

write.csv(randomisation_plan, "data/raw/randomisation.csv", row.names = FALSE)
writeLines(c(
  paste("seed:", 20261120),
  paste("station1_start:", station_start[1]),
  paste("station2_start:", station_start[2]),
  "Swap chargers between stations after run 16."
), "data/raw/randomisation.txt")

head(randomisation_plan)
table(randomisation_plan$device, randomisation_plan$treatment)
station_start
