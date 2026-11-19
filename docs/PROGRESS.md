# Research progress

Snapshot taken on 17 November 2026, with an equipment and randomisation update on 19 November. All dates below are local course dates.

## Proposal

The team submitted a two-page proposal on 6 November. A marked copy of version 18 came back with five comments dated 14 November. The user confirmed on 17 November that the proposal received full marks. No resubmission is required. The comments are refinement suggestions for the presentation and Q&A, not conditions on the grade.

Version check by content: version 16 to version 17 was the substantive revision. It removed the Windows exclusion sentence, changed the pilot to measure each device and classify it as high-draw or low-draw, and added two planned contrasts. Version 18 changed only two presentation details. The marked copy has the same text as version 18, so version 18 is the proposal source of record.

## Design locked in the proposal

The treatment structure is 2 x 2: charger power at a high-power and a low-power USB-C PD unit, crossed with cable type at a 5 A e-marked cable and a standard 3 A cable. Each power level keeps one physical charger throughout.

The physical device is a blocking factor with eight blocks. The experimental unit is one 40% to 60% SOC charging session. One run per block and treatment gives 32 runs in total.

The response is charging rate, computed as displayed SOC gained divided by elapsed minutes. Screen wakes follow the same schedule for every device and treatment. Within each block, the four treatments are assigned by a random permutation with the seed recorded.

The named model is an additive randomized complete block model with a 2 x 2 treatment structure. The two-way ANOVA F tests each have 1 df and the error term has 21 df.

## Evidence status

The pilot has not run. No device has a measured 40% to 60% window draw on record. The proposal states that the 14-inch MacBook Pro draws above 60 W in that window, but this is a claim in the text rather than a measurement.

The final list of eight devices is not locked. The randomisation seed, the run log, and the analysis script do not exist yet. The five presentation slides and the four personal contribution statements have not been drafted.

The proposal gives about 8 to 12 hours of total station time. That figure is in the submitted text, but no derivation is recorded. Treat it as a planning estimate until the pilot gives real timings.

## Equipment and randomisation update, 19 November

Two MacBook Pro units are now available. The first is a 14-inch M2 unit recorded as D1. The second is registered as D2 and has not been measured yet; its model and charger rating are unconfirmed. An iPhone 16 Pro is proposed as D3. Devices D4 to D8 are not yet identified. All eight must charge from both the 140 W and the 20 W unit.

The draw class is not decided by the seed. It comes only from the measured negotiated draw in the 40% to 60% window. The two laptops are candidate high-draw units and the phone is a candidate low-draw unit, but all three remain unmeasured. Two high-draw blocks are the minimum and three are preferable.

The treatment order was generated with seed 20261120 and saved in `data/raw/randomisation.csv`. Station 1 starts at 20 W and station 2 at 140 W, with the chargers swapped after run 16. The script was rerun under R 4.5.2 on 19 November and produced a byte-identical CSV. Analysis script `scripts/analysis.R` also ran end to end on synthetic data under R 4.5.2. R is installed at `D:\Program Files\R\R-4.5.2`, even though `Rscript` is not on PATH.

Three timing observations are now on record. The MacBook Pro 14 (M2) measurement of 10:46.98 used the 140 W charger with the 5 A cable and belongs to D1 slot 3, so it is R03. The second measurement from the same device, 1:23:40.93, used the 20 W charger with the 3 A cable and belongs to D1 slot 2, so it is R02. The user confirmed that the M2 is the 14-inch MacBook Pro already recorded as D1, not a second machine. The second MacBook Pro has not been measured. The iPhone 16 Pro measurement of 13:17.45 used the 20 W charger with the 3 A cable and belongs to D3 slot 1, so it is R09. The user confirmed that the two iPhone spellings refer to one observation, so it is entered once. Each row is saved in `data/raw/known_runs.csv` and in the collection workbook.

Each of the three rows has only an elapsed time. None has a measured window draw, so none determines a draw class. The 40 and 60 SOC endpoints are example values and must be checked against the screen. It is still unconfirmed whether the three runs followed the randomised order. If any was taken before randomisation, it is a pilot measurement and cannot count among the 32 formal runs.

The collection sheet uses English tokens that match the randomisation table. Device ids are D1 to D8, treatments are 140W_5A, 140W_3A, 20W_5A and 20W_3A, chargers are 140W and 20W, cables are 5A and 3A, and draw classes are high and low. `scripts/analysis.R` reads these tokens without label conversion, checks that every device has one run per treatment, and stops if any draw class is missing. It was rerun under R 4.5.2 with synthetic data using the English tokens and completed without error. The residual degrees of freedom were 21.

## Open items

Run the pilot and classify every device by measured window draw.

Lock the eight-device list and confirm each device charges from the 20 W unit.

Keep seed 20261120. Device names may change but the device to device_id mapping may not.

Collect 32 runs, rebuild the analysis from raw data, and check the model assumptions.

Address the five review comments in the presentation and in Q&A preparation.
