# Task list

Owners use the four member names from `DIVISION_AND_CHECKLIST.md`: Hanzheng Lin, Sizhao Li, Xujia Gu and Zewen Jin. An empty owner means the task is still unclaimed. Status changes from open to done only when the output is saved where the task says it belongs. Work completed before 21 November is credited to Hanzheng Lin and is not reassigned.

Do not draft submitted prose here. This list tracks work, not final text.

| ID | Task | Output | Owner | Due | Status |
| --- | --- | --- | --- | --- | --- |
| T01 | Confirm proposal grade and any resubmission request | note in `docs/PROGRESS.md` | Hanzheng Lin | 18 Nov | done |
| T02 | Borrow or confirm eight devices, check each charges from the 20 W unit | device list in `data/raw/devices.csv` | unclaimed | 19 Nov | open |
| T03 | Classify each device high or low by effective draw under the study chargers (60 W cable-cap threshold), using published specification as the starting point | pilot sheet in the workbook | Hanzheng Lin | 19 Nov | done |
| T04 | Set the measurement schedule and SOC window, record the randomisation seed and script | `scripts/randomise.R` and `data/raw/randomisation.txt` | Hanzheng Lin | 20 Nov | done |
| T05 | Run all 32 sessions and log every timing | `data/raw/runs.csv` | unclaimed | 23 Nov | open |
| T06 | Build cleaned data and full analysis, save tables and figures | `scripts/analysis.R`, `outputs/` | unclaimed | 24 Nov | open |
| T07 | Check residual plots, Q-Q plots, and the per-device profile plot | log entry in `logs/` | unclaimed | 24 Nov | open |
| T08 | Prepare Q&A notes for the review comments and the three technical questions | individual notes | unclaimed | 25 Nov | open |
| T09 | Write the five slides as a team | team presentation document | unclaimed | 25 Nov | open |
| T10 | Write each personal contribution statement | one file per member | each member | 27 Nov, 11 pm | open |
| T11 | Upload one slide document and four statements on Canvas | Canvas receipt | unclaimed | 27 Nov, 11 pm | open |
| T12 | Book a Q&A slot and practise the explanations | calendar entry | unclaimed | 30 Nov - 4 Dec | open |
| T13 | Record course requirements and rubric weights for planning | `docs/TIMELINE.md` | Hanzheng Lin | 21 Nov | done |
| T14 | Screen candidate devices and decide the eight-device roster | pilot sheet in the workbook | Hanzheng Lin | 21 Nov | done |
| T15 | Decide the remaining two device slots D7 and D8 | entry in `data/raw/devices.csv` | Sizhao Li | 22 Nov | done |
| T16 | Lock draw class for D7 HonorPower (low, about 38 W measured on study chargers) and D8 MacBookAir_M5 (high, 70 W USB PD fast charge); D1 to D6 already set | pilot sheet in the workbook | Xujia Gu | 23 Nov | done |
| T17 | Draft the four contribution statements from confirmed percentages | one file per member | each member | 26 Nov | open |
| T18 | Peer-teach the three technical questions and five review comments to all four members | checklist entry | Hanzheng Lin and Zewen Jin | 26 Nov | open |

The three technical questions for T08 are why device type cannot be randomised, how the additive assumption and error term are justified, and how the pooled interaction interval relates to a single high-draw block.

A task moves to done only when its output is saved at the stated path.
