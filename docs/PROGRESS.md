# Research progress

Snapshot taken on 17 November 2026. All dates below are local course dates.

## Proposal

The team submitted a two-page proposal on 6 November. A marked copy of version 18 came back with five comments dated 14 November. The copy carries no grade and no request to resubmit. The grade and the resubmission status still need confirmation from the lab instructor.

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

## Open items

Confirm the proposal grade and whether any resubmission is required.

Run the pilot and classify every device by measured window draw.

Lock the eight-device list, confirm each device charges from the 20 W unit, and record the randomisation seed.

Collect 32 runs, rebuild the analysis from raw data, and check the model assumptions.

Address the five review comments in the presentation and in Q&A preparation.
