# stat404_project

Shared workspace for the STAT 404 group project. This repository keeps raw inputs, scripts, and the outputs those scripts produce. A teammate should be able to clone it and rebuild every result from the raw files.

Published submissions and signed personal statements stay in OneDrive. Do not place submission prose or signed statements in this repository.

## Layout

| Path | Use |
| --- | --- |
| `docs/` | Progress, tasks, timeline, review feedback, analysis plan, decisions, sources, workflow |
| `data/raw/` | untouched measurement records |
| `data/clean/` | analysis-ready data rebuilt from raw files |
| `scripts/` | randomisation and analysis scripts |
| `outputs/tables/` | finished tables |
| `outputs/figures/` | finished figures |
| `logs/` | run logs from full rebuilds |
| `archive/` | superseded files, kept only when a current file depends on them |

## Responsibilities

One teammate owns each area. The current owner for each task is recorded in `docs/TASKS.md`. Edit your own area; comment on someone else's. An owner reads and accepts any change before it is treated as final.

Written work must read as if the team wrote it together. One person takes responsibility for each submitted document. The repository shows one steady voice across files.

## Rules

Keep raw data apart from cleaned data. Keep scripts in one folder and logs in another. Predictable paths matter more than clever names because every script points at them.

Do not commit credentials, tokens, editor settings, caches, temporary scripts, or scratch output. Old versions go to `archive/`, never beside the current file.

Resolve conflicts by reading the content, not by trusting a file name or a timestamp. Recover from a known commit when a merge goes wrong. Retired conclusions stay retired; do not restore an old number from an archived file.

Before a push, fetch first, rebuild the whole chain from raw inputs, read the logs, check the important numbers against the previous run, scan the text for private references, and compare the two copies that must agree.

See `docs/WORKFLOW.md` for the full checks and `docs/DECISIONS.md` for what is locked and what is retired.
