# Project plan: timeline, division, tasks, and workflow

This is the single planning document for the project. It replaces four earlier
files, `TASKS.md`, `TIMELINE.md`, `DIVISION_AND_CHECKLIST.md` and `WORKFLOW.md`;
their content is kept below so nothing is lost. Those four files were removed
after the merge.

## 1. Course timeline

Course deadlines come from the project overview. All times are local course
dates. Late work loses 10% of the marks for that step for each day late.

| Date | Event | Weight |
| --- | --- | --- |
| 6 Nov 2026 | Proposal submission, maximum two pages, one per team | 2% of course grade |
| 14 Nov 2026 | Marked proposal returned with five comments | no mark shown in the copy |
| 17 Nov 2026 | Proposal awarded full marks; no resubmission required | proposal closed |
| 18-19 Nov | Confirm grade, lock devices, run pilot | team milestone, done |
| 20-23 Nov | Collect 32 experimental runs | team milestone, done |
| 23-24 Nov | Full rebuild, tables, figures, model checks | team milestone, done |
| 24-25 Nov | Slide draft and Q&A notes | team milestone, done |
| 26 Nov | Team read-through of slides and statements | in progress |
| 27 Nov, 23:00 | Presentation upload: one slide document plus one contribution statement per member | 8% of course grade |
| 30 Nov - 4 Dec | Presentation (10 minutes) and Q&A (10 minutes) | part of the 8% |

The presentation mark covers five slides plus the Q&A. The five slides map to
formulation, design, analysis and conclusions. The statement of contributions
is required for any credit on the presentation upload and the Q&A.

A proposal grade of 5 out of 10 or less, or an incomplete grade, signals a
major rethink and may lead to a resubmission with a maximum of 8 out of 10.
Nothing in the marked copy applies to this team.

## 2. Team division

Four members: Hanzheng Lin, Sizhao Li, Xujia Gu and Zewen Jin. Each member
collects data on two devices, which is eight runs per member and 32 runs in
total. Each member submits an individual contribution statement and prepares
individually for the question period.

| Deliverable | Submission | Owner | Status |
| --- | --- | --- | --- |
| Proposal, maximum two pages | one per team, Canvas | Hanzheng Lin | complete |
| Team document: cover page and five slides | one per team, Canvas | see slide table below | in progress |
| Individual contribution statement | one per member, Canvas | each member | in progress |
| Presentation and Q&A | 10-minute presentation, 10-minute Q&A | each member | upcoming |

| Slide | Content | Owner |
| --- | --- | --- |
| 1, formulation | objectives, treatment factors, blocking choice, response measurement | Xujia Gu |
| 2-3, design | factor levels, randomized complete block, randomisation, run record | Sizhao Li |
| 4-5, analysis and conclusions | statistical model, model checking, important effects, conclusions | Zewen Jin |
| Cover and final integration | member names, overall flow, consistent figures and formatting | Hanzheng Lin |

Device ownership follows the locked eight-device list. The device ids D1 to D8
do not change once assigned.

## 3. Task list

An empty owner means the task is still unclaimed. A task is done only when its
output is saved where the row says. Work completed before 21 November is
credited to Hanzheng Lin and is not reassigned. This list tracks work, not
submitted prose.

| ID | Task | Output | Owner | Due | Status |
| --- | --- | --- | --- | --- | --- |
| T01 | Confirm proposal grade and any resubmission request | note in `PROGRESS.md` | Hanzheng Lin | 18 Nov | done |
| T02 | Confirm eight devices and that each charges from the 20 W unit | device list in `DATA_COLLECTION_TEMPLATE.md` | Hanzheng Lin | 19 Nov | done |
| T03 | Classify each device high or low by effective draw (60 W cable-cap threshold) | pilot sheet in the workbook | Hanzheng Lin | 19 Nov | done |
| T04 | Set the measurement schedule and SOC window, record seed and script | `scripts/randomise.R`, `data/raw/randomisation.txt` | Hanzheng Lin | 20 Nov | done |
| T05 | Run all 32 sessions and log every timing | `data/raw/known_runs.csv` | Hanzheng Lin | 23 Nov | done |
| T06 | Build clean data and full analysis, save tables and figures | `data/clean/runs.csv`, `scripts/analysis.R`, `outputs/` | Zewen Jin | 24 Nov | done |
| T07 | Check residual plots, Q-Q plots, and the per-device profile plot | `outputs/figures/` | Zewen Jin | 24 Nov | done |
| T08 | Prepare Q&A notes for the review comments and the three technical questions | shared Q&A notes | Hanzheng Lin and Zewen Jin | 25 Nov | done |
| T09 | Write the five slides as a team | team presentation document | all four | 25 Nov | done, pending integration |
| T10 | Write each personal contribution statement | one file per member | each member | 27 Nov, 23:00 | open |
| T11 | Upload one slide document and four statements on Canvas | Canvas receipt | any member for the team file, each member for the statement | 27 Nov, 23:00 | open |
| T12 | Book a slot and rehearse the 10-minute presentation and 10-minute Q&A | calendar entry | each member | 30 Nov - 4 Dec | open |
| T13 | Record course requirements and rubric weights for planning | section 1 above and `PROGRESS.md` | Hanzheng Lin | 21 Nov | done |
| T14 | Screen candidate devices and decide the eight-device roster | pilot sheet in the workbook | Hanzheng Lin | 21 Nov | done |
| T15 | Decide the remaining two device slots D7 and D8 | pilot sheet in the workbook | Sizhao Li | 22 Nov | done |
| T16 | Lock draw class for D7 HonorPower (low) and D8 MacBookAir_M5 (high) | pilot sheet in the workbook | Xujia Gu | 23 Nov | done |
| T17 | Draft the four contribution statements from confirmed percentages | one file per member | each member | 26 Nov | open |
| T18 | Peer-teach the three technical questions and five review comments to all four members | shared Q&A notes | Hanzheng Lin and Zewen Jin | 26 Nov | open |

The three technical questions for T08 and T18 are why device type cannot be
randomised, how the additive assumption and error term are justified, and how
the pooled interaction interval relates to a single high-draw block.

## 4. Working rules

Fetch before any push. Know whether the local copy is ahead, behind, or both.

Rebuild the whole chain from raw inputs when code changes. A change near the
start can alter files much later, and only a full run will show it.

Read the logs after a run. Look for errors, warnings, and commands that did
nothing. A run that finishes without stopping is not the same as a run that did
what was meant.

Check the important numbers against the previous run. If a change was meant to
be cosmetic, the numbers must not move. If they move, stop and find out why
before committing.

Scan the text for words that do not belong in a shared file. This includes
private references, student numbers, and any note about how a file was
produced.

Compare the two copies that must agree. Text files can be compared byte for
byte. For office files and other binaries, compare the content rather than the
bytes.

Resolve conflicts by reading the content. A same name and same size do not
prove the same text. Recover from a known commit when a merge goes wrong.
After any merge, run the checks again.

Write commit messages that say what changed and why it matters to the team.
Keep one steady voice across files and let different files keep slightly
different habits.

Old versions go to `archive/`, never beside the current file. Keep raw data
apart from cleaned data, and keep scripts in one folder and logs in another.
Predictable paths matter more than clever names because every script points at
them.
