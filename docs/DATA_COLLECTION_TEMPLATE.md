# STAT 404 data collection template

Copy the two data sheets below into the shared document. Use ASCII digits and letters. Leave empty cells empty, and do not type NA or a dash. A blank is the only marker for a missing value, so numeric columns read into R as numbers and label columns as tokens. Clock times are not recorded. Only `elapsed_min` is kept.

All labels are English tokens that match the codes in the randomisation table. Charger values are `140W` and `20W`. Cable values are `5A` and `3A`. Treatment values are `140W_5A`, `140W_3A`, `20W_5A` and `20W_3A`. Draw class values are `high` and `low`. These tokens can be read into R without any label conversion.

The response is `rate = delta_soc / elapsed_min` in % per minute. `delta_soc` is the SOC gain shown on screen. The default window is 40 to 60, so `delta_soc` is 20. Use the real reading if it differs. `elapsed_min` is minutes, so 10:46.98 becomes 10 + 46.98/60 = 10.783.

---

## Table 1: pilot device classification (one row per device, eight rows)

This table decides whether each device is `high` or `low`. The criterion is the effective draw with the standard USB-C PD chargers used in this study, not the elapsed time in the 40 to 60 percent window. Published specifications are the starting point; the measured ceiling on these chargers is used where a specification depends on a private protocol.

Published manufacturer specifications are recorded for reference. A 14-inch MacBook Pro (2021 or later), including both D1 2023 and D2 2021 M1 units, accepts up to about 96 W. The iPhone 16 Pro peaks near 30 W. The iPhone 17 Pro needs a 40 W adapter for fast charge. The 60 W quoted for its adapter is the adapter's dynamic ceiling, not the phone draw. The iPad Pro 11-inch 4th generation charges at 20 W PD. The iPhone 15 Pro Max peaks near 25 to 27 W. The Honor Power is rated 66 W only over private SCP with the original charger. Its measured ceiling with the study chargers is about 38 W, so it is low. The MacBook Air M5 supports fast charge with a 70 W or higher USB PD source and is high. The 140 W unit is an Anker 140W 4-Port PD 3.1 charger with a power display. It supplies up to 28 V at 5 A on C1 or C2, and the chargers need an e-marked cable above 100 W. A 3A cable caps 20 V PD at 60 W. A 5A e-marked cable allows up to 100 W. The cable effect appears mainly on high-draw devices. A 3A cable holds a 96 W device at 60 W, while a phone below 60 W is under the cap on either cable. These published facts are the basis for `draw_class`.

| device_id | device_name | device_type | both_chargers_ok | spec_max_W | spec_above_60W | draw_class |
| --- | --- | --- | --- | --- | --- | --- |
| D1 | MacBookPro14_M2Pro_2023 | laptop | yes | 96 | yes | high |
| D2 | MacBookPro14_M1_2021 | laptop | yes | 96 | yes | high |
| D3 | iPhone16Pro | phone | yes | 30 | no | low |
| D4 | iPhone17Pro | phone | yes | 40 | no | low |
| D5 | iPadPro11_4th | tablet | yes | 20 | no | low |
| D6 | iPhone15ProMax | phone | yes | 27 | no | low |
| D7 | HonorPower | phone | yes | 66 | yes | low |
| D8 | MacBookAir_M5 | laptop | yes | 70 | yes | high |

Field notes:

- `both_chargers_ok` is `yes` when the device charges from both the 140 W and the 20 W charger. Both are USB-C PD, so the devices are expected to work. A device that fails either charger cannot form a complete block.
- `spec_max_W` and `spec_above_60W` are published specifications, entered as reference facts on 21 Nov 2026. `draw_class` is the effective class under the study chargers. The Honor Power is the one exception: its 66 W rating needs a private protocol, so its class is low.
- `draw_class` is `high` when effective draw can exceed 60 W and `low` otherwise. D1, D2 and D8 are `high`. D3 to D7 are `low`.
- The number in `device_id` matches the randomisation table. Renaming a device does not change the randomisation.
- **Effective draw under the study chargers sets the class, not the random seed.** At least two `high` devices are needed and three are preferable. This design has three.

---

## Table 2: run records (32 rows, eight devices by four treatments)

Treatment codes: `140W_5A` is the 140 W charger with the 100 W (5 A e-marked) cable. `140W_3A` is the 140 W charger with a standard 3 A cable. `20W_5A` is the 20 W charger with the 5 A cable. `20W_3A` is the 20 W charger with a standard 3 A cable.

The order is fixed by seed `20261120` and is already filled in the workbook. Do not change it. Station 1 starts with 20 W, station 2 starts with 140 W, and the chargers swap after run 16. The table was reproduced with R 4.5.2 and matches `randomisation.csv` byte for byte.

| run_id | device_id | device_name | draw_class | slot | treatment | station | charger | cable | soc_start_pct | soc_end_pct | delta_soc | elapsed_min | rate_pct_per_min | screen_wake_ok | notes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| R01 | D1 | MacBookPro14_M2Pro_2023 | high | 1 | 140W_3A | 2 | 140W | 3A | 40 | 60 | auto | 15.325 | auto | yes | 15:19.51 |
| R02 | D1 | MacBookPro14_M2Pro_2023 | high | 2 | 20W_3A | 1 | 20W | 3A | 40 | 60 | auto | 83.682 | auto | yes | 1:23:40.93 |
| R03 | D1 | MacBookPro14_M2Pro_2023 | high | 3 | 140W_5A | 2 | 140W | 5A | 40 | 60 | auto | 10.783 | auto | yes | 10:46.98 |
| R04 | D1 | MacBookPro14_M2Pro_2023 | high | 4 | 20W_5A | 1 | 20W | 5A | 40 | 60 | auto | 86.526 | auto | yes | 1:26:31.54 |
| R06 | D2 | MacBookPro14_M1_2021 | high | 2 | 20W_3A | 1 | 20W | 3A | 40 | 60 | auto | 80.685 | auto | yes | 1:20:41.10 |
| R07 | D2 | MacBookPro14_M1_2021 | high | 3 | 140W_3A | 2 | 140W | 3A | 40 | 60 | auto | 11.584 | auto | yes | 11:35.03 |
| R08 | D2 | MacBookPro14_M1_2021 | high | 4 | 20W_5A | 1 | 20W | 5A | 40 | 60 | auto | 79.342 | auto | yes | 1:19:20.53 |
| R05 | D2 | MacBookPro14_M1_2021 | high | 1 | 140W_5A | 2 | 140W | 5A | 40 | 60 | auto | 12.228 | auto | yes | 12:13.7 |
| R09 | D3 | iPhone16Pro | low | 1 | 20W_3A | 1 | 20W | 3A | 40 | 60 | auto | 13.291 | auto | yes | 13:17.45 |
| R10 | D3 | iPhone16Pro | low | 2 | 140W_3A | 2 | 140W | 3A | 40 | 60 | auto | 13.227 | auto | yes | 13:13.64 |
| R11 | D3 | iPhone16Pro | low | 3 | 140W_5A | 2 | 140W | 5A | 40 | 60 | auto | 13.447 | auto | yes | 13:26.82 |
| R12 | D3 | iPhone16Pro | low | 4 | 20W_5A | 1 | 20W | 5A | 40 | 60 | auto | 13.06 | auto | yes | 13:03.6 |
| R13 | D4 | iPhone17Pro | low | 1 | 140W_5A | 2 | 140W | 5A | 40 | 60 | auto |  | auto | yes |  |
| R14 | D4 | iPhone17Pro | low | 2 | 20W_5A | 1 | 20W | 5A | 40 | 60 | auto |  | auto | yes |  |
| R15 | D4 | iPhone17Pro | low | 3 | 140W_3A | 2 | 140W | 3A | 40 | 60 | auto |  | auto | yes |  |
| R16 | D4 | iPhone17Pro | low | 4 | 20W_3A | 1 | 20W | 3A | 40 | 60 | auto | 11.413 | auto | yes | 11:24.77 |
| R18 | D5 | iPadPro11_4th | low | 2 | 20W_3A | 2 | 20W | 3A | 40 | 60 | auto | 24.747 | auto | yes | 24:44.79 |
| R23 | D6 | iPhone15ProMax | low | 3 | 20W_3A | 2 | 20W | 3A | 40 | 60 | auto | 13.671 | auto | yes | 13:40.23 |
| R17 | D5 | iPadPro11_4th | low | 1 | 20W_5A | 2 | 20W | 5A | 40 | 60 | auto |  | auto | yes |  |
| R19 | D5 | iPadPro11_4th | low | 3 | 140W_5A | 1 | 140W | 5A | 40 | 60 | auto |  | auto | yes |  |
| R20 | D5 | iPadPro11_4th | low | 4 | 140W_3A | 1 | 140W | 3A | 40 | 60 | auto |  | auto | yes |  |
| R21 | D6 | iPhone15ProMax | low | 1 | 140W_3A | 1 | 140W | 3A | 40 | 60 | auto |  | auto | yes |  |
| R22 | D6 | iPhone15ProMax | low | 2 | 20W_5A | 2 | 20W | 5A | 40 | 60 | auto |  | auto | yes |  |
| R24 | D6 | iPhone15ProMax | low | 4 | 140W_5A | 1 | 140W | 5A | 40 | 60 | auto |  | auto | yes |  |
| R25 | D7 | HonorPower | low | 1 | 20W_3A | 2 | 20W | 3A | 40 | 60 | auto | 34.791 | auto | yes | 34:47.43 |
| R26 | D7 | HonorPower | low | 2 | 20W_5A | 2 | 20W | 5A | 40 | 60 | auto |  | auto | yes |  |
| R27 | D7 | HonorPower | low | 3 | 140W_5A | 1 | 140W | 5A | 40 | 60 | auto |  | auto | yes |  |
| R28 | D7 | HonorPower | low | 4 | 140W_3A | 1 | 140W | 3A | 40 | 60 | auto |  | auto | yes |  |
| R29 | D8 | MacBookAir_M5 | high | 1 | 140W_5A | 1 | 140W | 5A | 40 | 60 | auto |  | auto | yes |  |
| R30 | D8 | MacBookAir_M5 | high | 2 | 20W_5A | 2 | 20W | 5A | 40 | 60 | auto | 61.272 | auto | yes | 01:01:16.32 |
| R31 | D8 | MacBookAir_M5 | high | 3 | 20W_3A | 2 | 20W | 3A | 40 | 60 | auto |  | auto | yes |  |
| R32 | D8 | MacBookAir_M5 | high | 4 | 140W_3A | 1 | 140W | 3A | 40 | 60 | auto |  | auto | yes |  |

Field notes:

- `slot` is the run number within a device, from 1 to 4, set by the randomisation table.
- `station` is 1 or 2 and is prefilled for all 32 rows. Both stations run at once with one charger each. The chargers swap after run 16.
- `soc_start_pct` and `soc_end_pct` are screen readings, prefilled at 40 and 60. Change them if the real reading differs.
- `delta_soc` is `soc_end_pct - soc_start_pct`, calculated automatically.
- `elapsed_min` runs from the first 40 percent reading to the first 60 percent reading, with three decimals. Clock times are not needed.
- `rate_pct_per_min` is `delta_soc / elapsed_min`, calculated automatically.
- `draw_class` is prefilled per device for all eight devices.
- `screen_wake_ok` is `yes` when wakes were about two minutes apart. Enter `no` and explain in `notes` otherwise.


---

## Collection order

1. Confirm the Table 1 draw classes before filling Table 2. D1, D2 and D8 are `high` and D3 to D7 are `low`. The high group has three devices, so the interaction contrast has support without borrowed equipment.
2. After the device list is locked, check that the device numbers match the randomisation table. Do not rerun the seed.
3. Fill Table 2 row by row during collection. Enter each run on the same day and convert the stopwatch reading into minutes.
4. When all 32 rows and all draw classes are filled, save Table 2 as `runs.csv` under `data/raw/` and run `analysis.R`.
