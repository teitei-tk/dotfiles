# Repository Guidelines

## Project Structure & Module Organization
- Root contains the actual dotfiles (`.zshrc`, `.bashrc`, `.tmux.conf`, `.vim/`, `.alacritty.toml`) plus helper scripts such as `setup.sh`.
- `brewfiles/` holds Homebrew bundle definitions split by category (`Brewfile`, `Brewfile.cask`, `Brewfile.mas`, `Brewfile.vscode`, `Brewfile.taps`).
- `vscode/` stores editor configuration (`settings.json`, `keybindings.json`) and `sync.sh` to push/pull settings.
- `Makefile` orchestrates setup tasks; refer to it before adding new workflows.

## Build, Test, and Development Commands
- `make init` — full bootstrap for a fresh macOS machine: taps, base/cask/mas installs, symlinks, VS Code sync, and Powerline fonts.
- `make ci` — lighter bootstrap for CI or minimal environments (skips VS Code sync).
- `make setup` — refresh symlinks and VS Code settings on an existing machine.
- `make setup-dotfiles` — only recreate dotfile symlinks via `./setup.sh`.
- `make setup-vscode` — install VS Code-related brews and run `vscode/sync.sh`.
- `make shellcheck` — lint shell scripts and login shells; run before sending changes.

## Coding Style & Naming Conventions
- Shell: keep scripts POSIX-friendly where possible; prefer lowercase file names and functions; use spaces for indentation (2 spaces typical in existing files).
- Dotfiles: favor explicit, minimal configuration; avoid machine-specific paths—use `$HOME` and env vars.
- Homebrew bundles: maintain alphabetical order per file; keep package names one per line.
- VS Code settings: follow existing JSON structure; keep keybindings descriptive and consistent.

## Testing Guidelines
- Primary check is `make shellcheck`; ensure it passes after edits to shell profiles or `setup.sh`.
- When adjusting Homebrew bundles, validate with `brew bundle --file=brewfiles/<file>` using `--dry-run` locally if possible.
- For VS Code changes, run `./vscode/sync.sh` to confirm export/import still works (avoid committing generated backups).

## Commit & Pull Request Guidelines
- Commit messages are currently short and imperative (e.g., `update`, `add vscode command`); keep them concise and action-led.
- One logical change per commit; include context in the PR description (what changed, why, and manual steps run).
- Link related issues when available; attach screenshots only for editor/UI setting changes that benefit from visual proof.
- Note any non-default commands executed (e.g., partial `brew bundle` runs) and any manual post-merge steps.

## Security & Configuration Tips
- Never commit secrets or machine-specific tokens; prefer environment variables and `.gitignore` for local-only files.
- Review third-party install scripts referenced in `setup.sh` and `brewfiles/` when adding new ones; use pinned versions where feasible.
- When running `make init` on a new host, ensure SSH keys and Git identity are configured first to avoid partial setup.
