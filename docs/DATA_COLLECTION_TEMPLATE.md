# STAT 404 data collection template

Copy the two data sheets below into the shared document. Use ASCII digits and letters. Leave empty cells empty, and do not type NA or a dash. Clock times are not recorded. Only `elapsed_min` is kept.

All labels are English tokens that match the codes in the randomisation table. Charger values are `140W` and `20W`. Cable values are `5A` and `3A`. Treatment values are `140W_5A`, `140W_3A`, `20W_5A` and `20W_3A`. Draw class values are `high` and `low`. These tokens can be read into R without any label conversion.

The response is `rate = delta_soc / elapsed_min` in percent per minute. `delta_soc` is the SOC gain shown on screen. The default window is 40 to 60, so `delta_soc` is 20. Use the real reading if it differs. `elapsed_min` is minutes, so 10:46.98 becomes 10 plus 46.98 divided by 60, which is 10.783.

---

## Table 1: pilot device classification (one row per device, eight rows)

This table decides whether each device is `high` or `low`. It is the direct answer to TA comment 1. The criterion is the power measured by a watt meter in the 40 to 60 percent window. Charger nameplate power and elapsed time are not valid criteria.

| device_id | device_name | device_type | both_chargers_ok | negotiated_draw_W_in_window | draw_class |
| --- | --- | --- | --- | --- | --- |
| D1 | MacBookPro14_M2 | laptop | yes/no | W | high/low |
| D2 | MBP2_unknown | laptop | | | |
| D3 | iPhone16Pro | phone | | | |
| D4 | | | | | |
| D5 | | | | | |
| D6 | | | | | |
| D7 | | | | | |
| D8 | | | | | |

Field notes:

- `both_chargers_ok` is `yes` when the device charges from both the 140 W and the 20 W charger. Enter `no` otherwise. A device that fails either charger cannot form a complete block.
- `negotiated_draw_W_in_window` is the power in watts shown by the watt meter in the 40 to 60 percent window.
- `draw_class` is `high` above 60 W and `low` at or below 60 W. Lock the class after the pilot.
- The number in `device_id` matches the randomisation table. Renaming a device does not change the randomisation.
- **The power measurement sets the class, not the random seed.** From common specifications the two MacBook Pro units are likely `high` and the iPhone 16 Pro is likely `low`. This is a prior guess only. At least two `high` devices are needed and three are preferable.

---

## Table 2: run records (32 rows, eight devices by four treatments)

Treatment codes: `140W_5A` is the 140 W charger with the 100 W (5 A e-marked) cable. `140W_3A` is the 140 W charger with a standard 3 A cable. `20W_5A` is the 20 W charger with the 5 A cable. `20W_3A` is the 20 W charger with a standard 3 A cable.

The order is fixed by seed `20261120` and is already filled in the workbook. Do not change it. Station 1 starts with 20 W, station 2 starts with 140 W, and the chargers swap after run 16. The table was reproduced with R 4.5.2 and matches `randomisation.csv` byte for byte.

| run_id | device_id | device_name | draw_class | slot | treatment | station | charger | cable | soc_start_pct | soc_end_pct | delta_soc | elapsed_min | rate_pct_per_min | screen_wake_ok | notes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| R01 | D1 | MacBookPro14_M2 | | 1 | 140W_3A | | 140W | 3A | | | auto | | auto | yes | |
| R02 | D1 | MacBookPro14_M2 | | 2 | 20W_3A | | 20W | 3A | 40 | 60 | auto | 83.682 | auto | yes | Elapsed 1:23:40.93; M2 is this MacBook Pro 14, not a second unit; SOC is an example |
| R03 | D1 | MacBookPro14_M2 | | 3 | 140W_5A | | 140W | 5A | 40 | 60 | auto | 10.783 | auto | yes | Elapsed 10:46.98; SOC is an example |
| R04 | D1 | MacBookPro14_M2 | | 4 | 20W_5A | | 20W | 5A | | | auto | | auto | yes | |
| R05 | D2 | MBP2_unknown | | 1 | 140W_5A | | 140W | 5A | | | auto | | auto | yes | |
| R06 | D2 | MBP2_unknown | | 2 | 20W_3A | | 20W | 3A | | | auto | | auto | yes | Not tested yet |
| R07 | D2 | MBP2_unknown | | 3 | 140W_3A | | 140W | 3A | | | auto | | auto | yes | |
| R08 | D2 | MBP2_unknown | | 4 | 20W_5A | | 20W | 5A | | | auto | | auto | yes | |
| R09 | D3 | iPhone16Pro | | 1 | 20W_3A | | 20W | 3A | 40 | 60 | auto | 13.291 | auto | yes | Elapsed 13:17.45; two spellings are one record |
| R10 | D3 | iPhone16Pro | | 2 | 140W_3A | | 140W | 3A | | | auto | | auto | yes | |
| R11 | D3 | iPhone16Pro | | 3 | 140W_5A | | 140W | 5A | | | auto | | auto | yes | |
| R12 | D3 | iPhone16Pro | | 4 | 20W_5A | | 20W | 5A | | | auto | | auto | yes | |
| R13 | D4 | | | 1 | 140W_5A | | 140W | 5A | | | auto | | auto | yes | |
| R14 | D4 | | | 2 | 20W_5A | | 20W | 5A | | | auto | | auto | yes | |
| R15 | D4 | | | 3 | 140W_3A | | 140W | 3A | | | auto | | auto | yes | |
| R16 | D4 | | | 4 | 20W_3A | | 20W | 3A | | | auto | | auto | yes | |
| R17 | D5 | | | 1 | 20W_5A | | 20W | 5A | | | auto | | auto | yes | |
| R18 | D5 | | | 2 | 20W_3A | | 20W | 3A | | | auto | | auto | yes | |
| R19 | D5 | | | 3 | 140W_5A | | 140W | 5A | | | auto | | auto | yes | |
| R20 | D5 | | | 4 | 140W_3A | | 140W | 3A | | | auto | | auto | yes | |
| R21 | D6 | | | 1 | 140W_3A | | 140W | 3A | | | auto | | auto | yes | |
| R22 | D6 | | | 2 | 20W_5A | | 20W | 5A | | | auto | | auto | yes | |
| R23 | D6 | | | 3 | 20W_3A | | 20W | 3A | | | auto | | auto | yes | |
| R24 | D6 | | | 4 | 140W_5A | | 140W | 5A | | | auto | | auto | yes | |
| R25 | D7 | | | 1 | 20W_3A | | 20W | 3A | | | auto | | auto | yes | |
| R26 | D7 | | | 2 | 20W_5A | | 20W | 5A | | | auto | | auto | yes | |
| R27 | D7 | | | 3 | 140W_5A | | 140W | 5A | | | auto | | auto | yes | |
| R28 | D7 | | | 4 | 140W_3A | | 140W | 3A | | | auto | | auto | yes | |
| R29 | D8 | | | 1 | 140W_5A | | 140W | 5A | | | auto | | auto | yes | |
| R30 | D8 | | | 2 | 20W_5A | | 20W | 5A | | | auto | | auto | yes | |
| R31 | D8 | | | 3 | 20W_3A | | 20W | 3A | | | auto | | auto | yes | |
| R32 | D8 | | | 4 | 140W_3A | | 140W | 3A | | | auto | | auto | yes | |

Field notes:

- `slot` is the run number within a device, from 1 to 4, set by the randomisation table.
- `station` is 1 or 2. Both stations run at once with one charger each. The chargers swap after run 16.
- `soc_start_pct` and `soc_end_pct` are screen readings with 40 and 60 as defaults.
- `delta_soc` is `soc_end_pct - soc_start_pct`, calculated automatically.
- `elapsed_min` runs from the first 40 percent reading to the first 60 percent reading, with three decimals. Clock times are not needed.
- `rate_pct_per_min` is `delta_soc / elapsed_min`, calculated automatically.
- `draw_class` is filled after the pilot with `high` or `low`. It must be complete before analysis.
- `screen_wake_ok` is `yes` when wakes were about two minutes apart. Enter `no` and explain in `notes` otherwise.

Three observed timings:

- MacBookPro14_M2: 10:46.98 is 10.783 minutes with `140W_5A` at R03.
- The same MacBookPro14_M2: 1:23:40.93 is 83.682 minutes with `20W_3A` at R02. The M2 is this MacBook Pro 14, not the second unit. The second MBP has not been tested.
- iPhone16Pro: 13:17.45 is 13.291 minutes with `20W_3A` at R09. The two iPhone spellings are one record.

Each timing has no measured window power, so none sets a draw class. SOC 40 and 60 are example values and need checking against the screen. Confirm whether the runs followed the randomised order. A run taken before randomisation is a pilot measurement and cannot count among the 32 formal runs.

---

## Collection order

1. Fill Table 1 first and lock the eight devices and their draw classes. If fewer than two devices are `high`, borrow more equipment.
2. After the device list is locked, check that the device numbers match the randomisation table. Do not rerun the seed.
3. Fill Table 2 row by row during collection. Enter each run on the same day and convert the stopwatch reading into minutes.
4. When all 32 rows and all draw classes are filled, save Table 2 as `runs.csv` under `data/raw/` and run `analysis.R`.
