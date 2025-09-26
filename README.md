# .config file

My basic config for tmux, nvim, and my terminal of choice alacritty

## Installation

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/vivindeena/config/refs/heads/main/run)"
```

## Refactoring Plan

This project is being refactored to use a modular, script-based setup inspired by ThePrimeagen's developer productivity course.

The plan is as follows:

1.  **Create the Directory Structure:**
    *   Create a `runs/` directory to store individual installation scripts.

2.  **Create the `run` Script:**
    *   Create the main `run` script that will act as the orchestrator.
    *   **It will detect if it's being run on a new machine. If so, it will first clone your dotfiles repository from GitHub and then proceed with the setup.** This will allow you to use a single `curl` command to bootstrap a new system.
    *   This script will include the `--dry-run` and filtering functionality.
    *   It will also contain the `log` and `execute` helper functions.

3.  **Create the `dev-env` Script:**
    *   Create a `dev-env` script to handle the deployment of dotfiles.
    *   This script will contain the `copy_dir` and `copy_file` functions.

4.  **OS-Aware Package Management:**
    *   Create a helper script or function that detects the operating system (macOS or Arch Linux).
    *   Based on the detected OS, it will define an `install` function that uses the appropriate package manager (`brew` for macOS, `pacman` for Arch).

5.  **Modularize Your Existing `setup.sh`:**
    *   Analyze the current `setup.sh` file.
    *   Break it down into smaller, single-purpose scripts and place them in the `runs/` directory.
    *   Modify these new scripts to use the `install` function for package management.

TODO's
- [ ] Move Keybindings from old config to nvChad
- [ ] Copy over missing plugins, like harpoon, and notify(notify has nvchad support check what to do with that )
- [ ] move to nvchad2.0 or move out of nvchad
- [ ] Move to Ghosty, and chose a font that supports ligatures
- [ ] Add zoxide, and put a shell promt to tell to zoxide when using ls
- [ ] Add caropasse, pgcli
- [ ] Investigate starship, or oh-my-posh

