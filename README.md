# Dotfiles

Personal dotfiles for zsh and tmux, managed with a [bare git repository](https://www.atlassian.com/git/tutorials/dotfiles).

## Files Tracked

- `~/.zshrc` — Zsh configuration
- `~/.tmux.conf` — Tmux configuration

## Setup on a New Machine

### Automated (recommended)

```bash
bash <(curl -s https://raw.githubusercontent.com/YOUR_GITHUB_USERNAME/dotfiles/main/dotfiles-setup.sh)
```

Or with a custom repo URL:

```bash
bash <(curl -s https://raw.githubusercontent.com/YOUR_GITHUB_USERNAME/dotfiles/main/dotfiles-setup.sh) git@github.com:YOUR_GITHUB_USERNAME/dotfiles.git
```

### Manual

1. Clone the bare repo:
   ```bash
   git clone --bare git@github.com:YOUR_GITHUB_USERNAME/dotfiles.git $HOME/.dotfiles
   ```

2. Define the alias temporarily:
   ```bash
   alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
   ```

3. Check for conflicting files. If `.zshrc` or `.tmux.conf` already exist, **delete or back them up first**:
   ```bash
   rm ~/.zshrc ~/.tmux.conf
   ```

4. Check out the files:
   ```bash
   dotfiles checkout
   ```

5. Hide untracked files from status output:
   ```bash
   dotfiles config --local status.showUntrackedFiles no
   ```

6. Reload your shell:
   ```bash
   source ~/.zshrc
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
