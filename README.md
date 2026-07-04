# zshrc-config

My [zsh](https://www.zsh.org/) configuration, kept in its own repo so it's easy to set up on any
machine. Split out of my dotfiles for a clean, per-tool setup.

## What's in the config

- [Oh My Zsh](https://ohmyz.sh/) (`robbyrussell` theme, `git` plugin)
- Git aliases (`gs`, `gch`, `gcm`, `gpsh`, ...) and shortcuts (`c`, `cl`)
- [zoxide](https://github.com/ajeetdsouza/zoxide) smart `cd` and [fzf](https://github.com/junegunn/fzf)
  key bindings, with an idempotent dependency bootstrap
- `wt` — a git worktree helper (add / remove / list / merge / home / go) with completions
- `serve` (quick HTTP server) and `tmux-kill` helpers
- nvm, bun, and `~/.local/bin` on `PATH`
- Machine-specific overrides sourced from `~/.zshrc.local` (untracked)

## Setup on a new machine

### 1. Install prerequisites

- zsh + [Oh My Zsh](https://ohmyz.sh/#install)
- [Node.js](https://nodejs.org/) — only used to run the setup script

### 2. Clone and run setup

```sh
git clone https://github.com/brett-fisher-research/zshrc-config.git
cd zshrc-config
npm run setup
```

The setup script is **idempotent** — run it as many times as you like (e.g. after pulling config
changes). It copies `.zshrc` to `~/.zshrc`. Open a new shell or run `source ~/.zshrc` to apply.

## Making changes

Edit `.zshrc` in this repo, then re-run `npm run setup` to apply it. This keeps the repo as the
single source of truth instead of editing `~/.zshrc` directly.
