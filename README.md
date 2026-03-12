# Dotfiles

Personal dotfiles for zsh and tmux, managed with a [bare git repository](https://www.atlassian.com/git/tutorials/dotfiles).

## Files Tracked

- `~/.zshrc` — Zsh configuration
- `~/.tmux.conf` — Tmux configuration
- `~/CLAUDE.md` — Claude Code instructions for this repo

## Setup on a New Machine

### Automated (recommended)

```bash
curl -s https://raw.githubusercontent.com/brett-fisher-research/dotfiles/main/dotfiles-setup.sh | bash
```

### Manual

1. Clone the bare repo:
   ```bash
   git clone --bare git@github.com:brett-fisher-research/dotfiles.git $HOME/.dotfiles
   ```

2. Define the alias temporarily:
   ```bash
   alias cfg='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
   ```

3. Check for conflicting files. If any tracked files already exist, **delete or back them up first**:
   ```bash
   rm ~/.zshrc ~/.tmux.conf ~/CLAUDE.md
   ```

4. Check out the files:
   ```bash
   cfg checkout
   ```

5. Hide untracked files from status output:
   ```bash
   cfg config --local status.showUntrackedFiles no
   ```

6. Reload your shell:
   ```bash
   source ~/.zshrc
   ```

## Machine-Specific Overrides

Create `~/.zshrc.local` on any machine for local customizations (not tracked in dotfiles). It is sourced automatically at the end of `.zshrc`. Useful for setting a custom prompt on a remote machine, for example:

```sh
# ~/.zshrc.local
PROMPT='%n@%m:%~|⇒ '
```

## Daily Usage

`cfg` is an alias for `git` pointed at the bare repo, so all git commands work:

```bash
cfg status
cfg add ~/.zshrc
cfg commit -m "Update zshrc"
cfg push
cfg pull
cfg log
```
