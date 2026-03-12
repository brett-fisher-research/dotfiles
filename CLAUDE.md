# Dotfiles

This home directory is managed as a bare git repository at `~/.dotfiles/`.

Use the `cfg` alias instead of `git` for all dotfile version control operations:

```sh
cfg status
cfg add ~/.zshrc
cfg commit -m "message"
cfg push
```

`cfg` is defined in `~/.zshrc` as:

```sh
alias cfg='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

The remote is `git@github.com:brett-fisher-research/dotfiles.git` (SSH).
