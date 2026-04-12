# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

A personal dotfiles repository managing shell configuration, OS setup scripts, and application configs across Fedora (primary), Bazzite, macOS, and Ubuntu.

## Repository Structure

- `setup` — Main entry point: symlinks bash/git/ssh/vim configs to `$HOME`
- `fedora/setup` — Primary OS setup: packages, flatpaks, drivers, then optionally runs subscripts (brew, ente, keyd, proton, vscode, kde-restore, dotfiles)
- `bazzite/setup`, `macos/setup`, `ubuntu/*.sh` — Other OS setups
- `bash/` — Shell config (profile=bashrc, aliases, vimrc)
- `git/` — gitconfig, global gitignore, prepare-commit-msg hook (auto-prepends branch name)
- `kde/` — KDE Plasma panel backup/restore (`kde-panel backup|restore`)
- `keyd/` — macOS-style keyboard remapping config for Linux

## Script Conventions

**All scripts must use:**
- `set -euo pipefail` for strict error handling
- `SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"` for path resolution (never hardcode `~/dotfiles`)
- `REPO_DIR="$(dirname "$SCRIPT_DIR")"` to reach repo root from a subfolder
- `bash "$path"` to execute subscripts (not source)

**Interactive prompts:**
- `read -rp "prompt" answer` with `"${answer,,}"` for case-insensitive comparison
- Default to yes: `[Y/n]` pattern where only explicit "n" skips

**Naming:** Scripts have no `.sh` extension. Exception: legacy ubuntu scripts still use `.sh`.

## Key Relationships

- `fedora/setup` calls subscripts via a selection menu at the start, executes them at the end
- `kde-restore` and `dotfiles` in the optional scripts list are special-cased (different paths than `$SCRIPT_DIR`)
- `bash/profile` sources `~/.bash_aliases` and conditionally sources `ubuntu/aliases` on Debian-based systems
- Symlinks are created by the root `setup` script, referenced by `fedora/setup` as the `dotfiles` optional step

## OS-Specific Aliases

- Shared aliases go in `bash/aliases`
- OS-specific aliases go in their OS folder (e.g., `ubuntu/aliases` for apt commands)
- Detection uses `/etc/debian_version` in `bash/profile` to conditionally source
