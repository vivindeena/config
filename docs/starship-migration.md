# Powerlevel10k to Starship migration

Powerlevel10k remains the active prompt until a Starship configuration passes
visual and behavioral parity checks. Do not remove the instant prompt, the
Zinit Powerlevel10k plugin, or `~/.p10k.zsh` during the preparation phase.

## Current prompt contract

- Insert one blank line before every prompt.
- Render a transparent first line with the macOS icon, blue folder icon and
  path, then Git icon, branch, and repository state.
- Preserve the current Git symbols and counts: divergence arrows, stash `*`,
  conflict `~`, staged `+`, modified `!`, and untracked `?`.
- Right-align conditional status, command duration, background jobs,
  environment, runtime, cloud, and tool context on the first line.
- Render a second-line `❯` that is green after success and red after failure.
- Preserve Nerd Font v3 glyphs, spacing, directory shortening, and the absence
  of segment backgrounds.

## Starship implementation

1. Add Starship to the cross-platform installers and add a tracked
   `starship.toml` under this XDG configuration directory.
2. Use the `fill` module for right-aligned content on the first line. Use native
   modules when their rendered output matches and narrow custom modules only
   for Powerlevel10k-specific path or Git formatting.
3. Render both prompts in a plain directory, clean repository, dirty repository,
   failed command, long-running command, background-job state, and each active
   development environment. Compare terminal captures before switching.
4. Cut over only when those fixtures match. Replace the Powerlevel10k blocks in
   `.zshrc` with `eval "$(starship init zsh)"`, but retain `~/.p10k.zsh` for one
   rollback window.

If parity regresses, restore the three Powerlevel10k initialization blocks and
restart Zsh.
