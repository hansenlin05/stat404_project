# Workflow

Fetch before any push. Know whether the local copy is ahead, behind, or both.

Rebuild the whole chain from raw inputs when code changes. A change near the start can alter files much later, and only a full run will show it.

Read the logs after a run. Look for errors, warnings, and commands that did nothing. A run that finishes without stopping is not the same as a run that did what was meant.

Check the important numbers against the previous run. If a change was meant to be cosmetic, the numbers must not move. If they move, stop and find out why before committing.

Scan the text for words that do not belong in a shared file. This includes private references, student numbers, and any note about how a file was produced.

Compare the two copies that must agree. Text files can be compared byte for byte. For office files and other binaries, compare the content rather than the bytes.

Resolve conflicts by reading the content. A same name and same size do not prove the same text. Recover from a known commit when a merge goes wrong.

After any merge, run the checks again.

Write commit messages that say what changed and why it matters to the team. Keep one steady voice across files and let different files keep slightly different habits.
