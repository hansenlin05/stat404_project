# Research progress

Current state as of 26 November 2026. Earlier dated snapshots were merged into
this single timeline; day-by-day readouts that duplicated `known_runs.csv` were
removed. Source facts stay in `DATA_COLLECTION_TEMPLATE.md`, locked decisions in
`DECISIONS.md`, and the deadline and task plan in `PROJECT_PLAN.md`.

## Proposal

The team submitted a two-page proposal on 6 November. A marked copy of version
18 came back with five comments dated 14 November. The proposal received full
marks on 17 November; no resubmission is required. The five comments are
refinement requests for the presentation and Q&A, not conditions on the grade.
See `TA_FEEDBACK.md` for each comment and the agreed response.

Version check by content: version 16 to version 17 was the substantive
revision. It removed the Windows exclusion sentence, changed the pilot to
measure each device and classify it as high-draw or low-draw, and added two
planned contrasts. Version 18 changed only two presentation details. The marked
copy matches version 18, so version 18 is the proposal source of record.

## Design locked in the proposal

The treatment structure is 2 x 2: charger power at a high-power (140 W) and a
low-power (20 W) USB-C PD unit, crossed with cable type at a 5 A e-marked cable
and a standard 3 A cable. Each power level keeps one physical charger
throughout.

The physical device is a blocking factor with eight blocks. The experimental
unit is one 40% to 60% SOC charging session. One run per block and treatment
gives 32 runs. The response is charging rate, displayed SOC gained divided by
elapsed minutes, in percent per minute. Screen wakes follow one schedule for
every device and treatment. Within each block, the four treatments are assigned
by a random permutation with the seed 20261120 recorded in
`data/raw/randomisation.txt`. Station 1 starts at 20 W and station 2 at 140 W;
the chargers swap after run 16.

The named model is an additive randomized complete block model with a 2 x 2
treatment structure. Two-way F tests each have 1 df and the error term has 21
df. See `ANALYSIS_PLAN.md` for the contrast definitions and diagnostics and
`DECISIONS.md` for what is locked and what is retired.

## Devices and draw class

The eight locked devices are D1 MacBook Pro 14 (2023), D2 MacBook Pro 14 M1
(2021), D3 iPhone 16 Pro, D4 iPhone 17 Pro, D5 iPad Pro 11-inch 4th generation,
D6 iPhone 15 Pro Max, D7 Honor Power and D8 MacBook Air M5. D1, D2 and D8 are
high draw; D3 to D7 are low draw. Three high-draw blocks exceed the minimum of
two required for the interaction comparison.

Draw class is set by effective draw under the two study chargers against the
60 W cable-cap threshold, with published specification as the starting point.
D7 Honor Power is rated 66 W only over private SCP with the original charger;
its measured ceiling on the study chargers is about 38 W, so it is low. D8
MacBook Air M5 is high because Apple specifies fast charge from a 70 W or higher
USB PD source. Published specification facts for all eight devices are recorded
in `DATA_COLLECTION_TEMPLATE.md`.

## Data and analysis status

All 32 timings are on record in `data/raw/known_runs.csv`, one elapsed time per
run. Each elapsed time is the duration from the first 40 percent reading to the
first 60 percent reading. `data/clean/runs.csv` is rebuilt from the raw file with
`delta_soc = 20` and `rate_pct_per_min = 20 / elapsed_min`. `scripts/analysis.R`
runs end to end under R 4.5.2 and writes the ANOVA table, planned contrasts, and
the residual, Q-Q and profile plots to `outputs/`. The residual degrees of
freedom are 21. Diagnostics and the interpretation of the contrasts are the
subject of the analysis slides.

The treatment conclusions apply to these eight devices under these two chargers
and these two cables. Device type is not randomised and the devices are a
convenience sample, so the conclusions do not extend to a random sample of
phones, tablets, or laptops.

## Requirements planning

The 6 November proposal is 2% of the course grade. The 27 November 23:00 team
presentation and four contribution statements are 8%. The 30 November to 4
December session is a 10-minute presentation plus a 10-minute Q&A. Fifteen of
the fifty presentation marks are individual Q&A marks, and the contribution
statement is a prerequisite for any presentation credit. The full deadline and
task tables are in `PROJECT_PLAN.md`; the rubric text and translation are in the
local `PROJECT_REQUIREMENTS_BILINGUAL.md`.
