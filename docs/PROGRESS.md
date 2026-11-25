# Research progress

Snapshot taken on 17 November 2026, with equipment and randomisation updates on 19 November, 21 November and 22 November. All dates below are local course dates. The 22 November sections are the current state; earlier sections are kept as history.

## Proposal

The team submitted a two-page proposal on 6 November. A marked copy of version 18 came back with five comments dated 14 November. The proposal received full marks on 17 November. No resubmission is required. The comments are refinement suggestions for the presentation and Q&A, not conditions on the grade.

Version check by content: version 16 to version 17 was the substantive revision. It removed the Windows exclusion sentence, changed the pilot to measure each device and classify it as high-draw or low-draw, and added two planned contrasts. Version 18 changed only two presentation details. The marked copy has the same text as version 18, so version 18 is the proposal source of record.

## Design locked in the proposal

The treatment structure is 2 x 2: charger power at a high-power and a low-power USB-C PD unit, crossed with cable type at a 5 A e-marked cable and a standard 3 A cable. Each power level keeps one physical charger throughout.

The physical device is a blocking factor with eight blocks. The experimental unit is one 40% to 60% SOC charging session. One run per block and treatment gives 32 runs in total.

The response is charging rate, computed as displayed SOC gained divided by elapsed minutes. Screen wakes follow the same schedule for every device and treatment. Within each block, the four treatments are assigned by a random permutation with the seed recorded.

The named model is an additive randomized complete block model with a 2 x 2 treatment structure. The two-way ANOVA F tests each have 1 df and the error term has 21 df.

## Evidence status

At the 17 November snapshot, no timings were on record and the device list was still open. The sections below record how the design, device list and timings developed from that point. Twenty-nine run timings are now on record and all eight devices have an assigned draw class; the remaining timings are still being collected.

The proposal gives about 8 to 12 hours of total station time as a planning estimate.

## Equipment and randomisation update, 19 November

Two MacBook Pro units are now available. The first is a 2023 14-inch unit recorded as D1. The second is registered as D2 MacBookPro14_M1_2021; it is a 2021 14-inch MacBook Pro with the M1 family chip, rated at 96 W PD, so it is a high candidate. D2 has four timings recorded. An iPhone 16 Pro is recorded as D3. Two new Apple devices were added on 21 November as D4 iPhone 17 Pro and D5 iPad Pro 11-inch 4th generation, D4 now has four timings and D5 has three. iPhone 15 Pro Max was added as D6 on 22 November. Honor Power was fixed as D7 and MacBook Air M5 as D8 on 22 November, so all eight slots are now locked. All eight must charge from both the 140 W and the 20 W unit.

The draw class is not decided by the seed. It is set by effective draw under the two study chargers against the 60 W cable-cap threshold. D1, D2 and D8 are high and D3 to D7 are low. D7 Honor Power is rated 66 W only over private SCP with the original charger, and its measured ceiling with the study chargers is about 38 W, so it is low. D8 MacBook Air M5 is high because Apple specifies fast charge from a 70 W or higher USB PD source. Two high-draw blocks are the minimum and this design has three.

The treatment order was generated with seed 20261120 and saved in `data/raw/randomisation.csv`. Station 1 starts at 20 W and station 2 at 140 W, with the chargers swapped after run 16. The script was rerun under R 4.5.2 on 19 November and produced a byte-identical CSV. Analysis script `scripts/analysis.R` also ran end to end on synthetic data under R 4.5.2.

Twenty-nine timing observations are now on record. On D1 MacBook Pro 14 (2023), 15:19.51 used the 140 W charger with the 3 A cable and belongs to slot 1, so it is R01; this is the same D1 unit. 10:46.98 used the 140 W charger with the 5 A cable and belongs to slot 3, so it is R03; 1:23:40.93 used the 20 W charger with the 3 A cable and belongs to slot 2, so it is R02; 1:26:31.54 used the 20 W charger with the 5 A cable and belongs to slot 4, so it is R04. The 2023 MacBook Pro 14 is recorded as D1. On D2 MacBook Pro 14 (M1, 2021), 12:13.7 used the 140 W charger with the 5 A cable and belongs to slot 1, so it is R05. 1:20:06.90 used the 20 W charger with the 3 A cable and belongs to slot 2, so it is R06, which is 80.115 minutes. 11:35.03 used the 140 W charger with the 3 A cable and belongs to slot 3, so it is R07, which is 11.584 minutes. 1:19:20.53 used the 20 W charger with the 5 A cable and belongs to slot 4, so it is R08, which is 79.342 minutes. The second MacBook Pro is D2 MacBookPro14_M1_2021. On D3 iPhone 16 Pro, 13:17.45 used the 20 W charger with the 3 A cable and belongs to slot 1, so it is R09; 13:13.64 used the 140 W charger with the 3 A cable and belongs to slot 2, so it is R10; 13:26.82 used the 140 W charger with the 5 A cable and belongs to slot 3, so it is R11; 13:03.6 used the 20 W charger with the 5 A cable and belongs to slot 4, so it is R12. On D4 iPhone 17 Pro, 11:16.32 used the 140 W charger with the 5 A cable and belongs to slot 1, so it is R13, which is 11.272 minutes. 11:15.93 used the 20 W charger with the 5 A cable and belongs to slot 2, so it is R14, which is 11.266 minutes. 10:16.29 used the 140 W charger with the 3 A cable and belongs to slot 3, so it is R15, which is 10.272 minutes. 11:24.77 used the 20 W charger with the 3 A cable and belongs to slot 4, so it is R16, which is 11.413 minutes. On D5 iPad Pro 11-inch 4th, 24:51.18 used the 20 W charger with the 5 A cable and belongs to slot 1, so it is R17, which is 24.853 minutes. 24:44.79 used the 20 W charger with the 3 A cable and belongs to slot 2, so it is R18, which is 24.747 minutes. 18:32.48 used the 140 W charger with the 5 A cable and belongs to slot 3, so it is R19, which is 18.541 minutes. 18:36.30 used the 140 W charger with the 3 A cable and belongs to slot 4, so it is R20, which is 18.605 minutes. On D6 iPhone 15 Pro Max, 14:46.50 used the 140 W charger with the 3 A cable and belongs to slot 1, so it is R21, which is 14.775 minutes. 13:48.66 used the 20 W charger with the 5 A cable and belongs to slot 2, so it is R22, which is 13.811 minutes. 13:40.23 used the 20 W charger with the 3 A cable and belongs to slot 3, so it is R23, which is 13.671 minutes. 14:51.70 used the 140 W charger with the 5 A cable and belongs to slot 4, so it is R24, which is 14.862 minutes. On D7 Honor Power, 34:47.43 used the 20 W charger with the 3 A cable and belongs to slot 1, so it is R25, which is 34.791 minutes. 34:54.54 used the 20 W charger with the 5 A cable and belongs to slot 2, so it is R26, which is 34.909 minutes. On D8 MacBook Air M5, 18:12.08 used the 140 W charger with the 5 A cable and belongs to slot 1, so it is R29, which is 18.201 minutes. 01:01:16.32 used the 20 W charger with the 5 A cable and belongs to slot 2, so it is R30, which is 61.272 minutes. 01:14:43:44 used the 20 W charger with the 3 A cable and belongs to slot 3, so it is R31, which is 74.724 minutes. Each row is saved in `data/raw/known_runs.csv` and in the collection workbook.

Each of the twenty-nine rows has only an elapsed time. The draw class comes from effective draw under the study chargers and is filled per device in the workbook and in known_runs.csv. Each elapsed time is the duration from the first 40 percent reading to the first 60 percent reading. The runs follow the order set by the randomisation table. Station is prefilled for all 32 rows from the same randomisation: runs 1 to 16 put the 20 W unit at station 1 and the 140 W unit at station 2, and runs 17 to 32 swap them.

The collection sheet uses English tokens that match the randomisation table. Device ids are D1 to D8, treatments are 140W_5A, 140W_3A, 20W_5A and 20W_3A, chargers are 140W and 20W, cables are 5A and 3A, and draw classes are high and low. `scripts/analysis.R` reads these tokens without label conversion, checks that every device has one run per treatment, and stops if any draw class is missing. It was rerun under R 4.5.2 with synthetic data using the English tokens and completed without error. The residual degrees of freedom were 21.

## Course requirements and team plan, 21 November

The course requirements set the 6 November proposal at 2%, the 27 November 11 pm team presentation and four contribution statements at 8%, and the 30 November to 4 December Q&A. Fifteen of the fifty presentation marks are individual Q&A marks, and the contribution statement is a prerequisite for any presentation credit.

The four-member division is recorded in `docs/DIVISION_AND_CHECKLIST.md`. Xujia Gu owns the formulation slide, Sizhao Li owns the two design slides, Zewen Jin owns the two analysis slides and the model rerun, and Hanzheng Lin owns the cover and final integration. Each member also collects data on two assigned devices.

Published charging specifications for four candidate Android devices were checked on 21 November. A Samsung Galaxy S25 Plus reaches 45 W over PPS and is below the 60 W cable cap. An Honor Magic5 reaches only 9 V by 2 A, that is 18 W, over standard USB PD even though its proprietary SCP charger is rated 66 W. An Oppo Pad 4 Pro reaches 18 W PD or 33 W PPS over standard chargers, and its 12140 mAh cell makes the 40 to 60 percent window the slowest of the candidates. The Honor Power is rated 8000 mAh typical and 66 W wired charging, but the maximum requires the original charger and cable over private SCP. The shop listing gives 20 V at 3.3 A as the maximum, with 10 V at 4 A and 5 V at 2 A as compatible modes. Its measured ceiling with the study chargers is about 38 W, so D7 is low. The 140 W unit is an Anker 140W 4-Port PD 3.1 charger with a power display, with 28 V at 5 A on C1 or C2 and 70 W plus 70 W or 100 W plus 40 W on two ports. USB PD 3.1 keeps 100 W at 20 V in SPR and adds 28, 36 and 48 V at 5 A in EPR; a cable without an e-marker is limited to 3 A and 60 W at 20 V. Effective draw under these chargers now sets each draw class.

The binding constraint is high-draw blocks, not the number of Android devices. D1, D2 and D8 are high, with D8 confirmed from the Apple 70 W PD fast-charge requirement. D3 to D7 are low. Three high devices are in the design, so the two-block minimum is met with margin.

Twenty-nine timing observations are on record, at R01, R02, R03, R04, R05, R06, R07, R08, R09, R10, R11, R12, R13, R14, R15, R16, R17, R18, R19, R20, R21, R22, R23, R24, R25, R26, R29, R30, and R31. All eight devices now have at least one timing.

## Open items

Collect the remaining 3 run timings. All eight draw classes are filled and station is prefilled for all 32 rows.

Lock the eight-device list and confirm each device charges from the 20 W unit.

Keep seed 20261120. Device names may change but the device to device_id mapping may not.

Collect 32 runs, rebuild the analysis from raw data, and check the model assumptions.

Address the five review comments in the presentation and in Q&A preparation.
