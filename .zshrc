# Dotfiles bare git repo
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# cfg: dotfiles shorthand
cfg() {
  case "$1" in
    update)
      git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME add -u
      git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME commit -m "${2:-update dotfiles}"
      git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME push
      ;;
    pull)
      git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME pull
      ;;
    *)
      git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME "$@"
      ;;
  esac
}

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Auto-attach to tmux on terminal open.
# Attaches to "main" if it exists and is unoccupied, otherwise tries
# "main-2", "main-3", etc. Creates the session if none are found.
if [ -z "$TMUX" ]; then
  _tmux_attach_main() {
    local n=1
    while true; do
      local name
      [[ $n -eq 1 ]] && name="main" || name="main-$n"

      if ! tmux has-session -t "=$name" 2>/dev/null; then
        echo "tmux: creating session '$name'"
        tmux new-session -s "$name"
        return
      fi

      local clients
      clients=$(tmux list-clients -t "=$name" 2>/dev/null | wc -l)
      if [[ $clients -eq 0 ]]; then
        echo "tmux: attaching to '$name'"
        tmux attach -t "=$name"
        return
      fi

      echo "tmux: '$name' is occupied, trying next..."
      (( n++ ))
    done
  }
  _tmux_attach_main
  unset -f _tmux_attach_main
fi

. "$HOME/.local/bin/env"

export NVIM_APPNAME=nvim-dev

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Git aliases
alias gs="git status"
alias gch="git checkout"
alias gc="git commit"
alias gcm="git commit -m"
alias gm="git merge"
alias ga="git add"
alias ga.="git add ."
alias gl="git log"
alias gb="git branch"
alias gd="git diff"
alias gpsh="git push"
alias gpl="git pull"
alias grb="git rebase"
alias gpfwl="git push --force-with-lease"
alias gf="git fetch"


# Other aliases
alias c="clear"


# bun completions
[ -s "/home/brett/.bun/_bun" ] && source "/home/brett/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

wt() {
  local worktree_dir="$HOME/.worktrees"
  mkdir -p "$worktree_dir"

  case "$1" in
    add)
      if [[ -z "$2" ]]; then
        echo "Usage: wt add <branch-name>"
        return 1
      fi
      git worktree add -b "$2" "$worktree_dir/$2"
      cd "$worktree_dir/$2"
      ;;
    remove)
      local branch="" force=0

      # Parse args: `wt remove [--force]` or `wt remove <branch> [--force]`
      if [[ "$2" == "--force" ]]; then
        force=1
      elif [[ -n "$2" ]]; then
        branch="$2"
        [[ "$3" == "--force" ]] && force=1
      fi

      # Infer branch from current directory if not specified
      if [[ -z "$branch" ]]; then
        if [[ "$PWD" == "$worktree_dir/"* ]]; then
          branch="${PWD#$worktree_dir/}"
          branch="${branch%%/*}"
        else
          echo "Usage: wt remove <branch-name> [--force]"
          echo "       (or run from within a worktree to remove the current one)"
          return 1
        fi
      fi

      local target="$worktree_dir/$branch"
      if [[ ! -d "$target" ]]; then
        echo "wt remove: no worktree found for branch '$branch' at $target"
        return 1
      fi

      # If we're inside the worktree being removed, cd out first
      if [[ "$PWD" == "$target"* ]]; then
        local main_worktree
        main_worktree=$(git worktree list | head -1 | awk '{print $1}')
        echo "Leaving worktree '$branch'..."
        cd "$main_worktree" || return 1
      fi

      if (( force )); then
        git worktree remove --force "$target" && git branch -D "$branch"
      else
        git worktree remove "$target" && git branch -d "$branch"
      fi
      ;;
    list)
      git worktree list
      ;;
    merge)
      local branch="${2:-$(git branch --show-current)}"

      if [[ -z "$branch" ]]; then
        echo "Could not determine branch. Run from a worktree or use: wt merge <branch-name>"
        return 1
      fi

      # Find the primary (main) worktree path — always listed first
      local main_worktree
      main_worktree=$(git worktree list | head -1 | awk '{print $1}')

      # Guard: uncommitted changes
      if ! git -C "$worktree_dir/$branch" diff --quiet 2>/dev/null || \
         ! git -C "$worktree_dir/$branch" diff --cached --quiet 2>/dev/null; then
        echo "Worktree '$branch' has uncommitted changes. Commit or stash them first."
        return 1
      fi

      # Switch to main worktree and merge
      cd "$main_worktree" || return 1
      git checkout main || return 1
      git merge "$branch" || { echo "Merge failed. Resolve conflicts, then run: wt merge $branch"; return 1; }

      # Clean up worktree and branch
      git worktree remove "$worktree_dir/$branch"
      git branch -d "$branch"

      echo "Merged '$branch' into main, worktree removed. Now in: $main_worktree"
      ;;
    home)
      local main_worktree
      main_worktree=$(git worktree list 2>/dev/null | grep -E '\[main\]' | awk '{print $1}')
      if [[ -z "$main_worktree" ]]; then
        echo "Could not find a worktree with branch 'main'."
        return 1
      fi
      cd "$main_worktree"
      ;;
    go)
      if [[ -z "$2" ]]; then
        echo "Usage: wt go <branch-name>"
        return 1
      fi
      local target="$worktree_dir/$2"
      if [[ ! -d "$target" ]]; then
        echo "No worktree found for branch '$2' at $target"
        return 1
      fi
      cd "$target"
      ;;
    *)
      echo "Usage: wt <command> [branch-name]"
      echo ""
      echo "Commands:"
      echo "  add <branch>          Create a new worktree with a new branch"
      echo "  remove <branch>       Remove a worktree (use --force to skip checks)"
      echo "  list                  List all worktrees"
      echo "  merge [branch]        Merge worktree branch into main and clean up"
      echo "  home                  cd to the main worktree"
      echo "  go <branch>           cd to a worktree by branch name"
      return 1
      ;;
  esac
}

_wt() {
  local state
  local worktree_dir="$HOME/.worktrees"

  _arguments \
    '1: :->subcommand' \
    '2: :->branch' && return

  case $state in
    subcommand)
      local subcommands=(
        'add:Create a new worktree with a new branch'
        'remove:Remove a worktree'
        'list:List all worktrees'
        'merge:Merge worktree branch into main and clean up'
        'home:cd to the main worktree'
        'go:cd to a worktree by branch name'
      )
      _describe 'subcommand' subcommands
      ;;
    branch)
      case $words[2] in
        remove|merge|go)
          local branches
          branches=("${(@f)$(ls "$worktree_dir" 2>/dev/null)}")
          _describe 'branch' branches
          ;;
      esac
      ;;
  esac
}

compdef _wt wt

# Serve current directory over HTTP
serve() {
  local port="${1:-8000}"
  python3 -m http.server "$port"
}

# Workaround for tmux bug where kill-session crashes the server.
# Kills pane processes directly so the session dies naturally.
tmux-kill() {
  local session="$1"

  if [[ -z "$session" ]]; then
    echo "Usage: tmux-kill <session-name>"
    return 1
  fi

  if ! tmux has-session -t "$session" 2>/dev/null; then
    echo "tmux-kill: session '$session' not found"
    return 1
  fi

  local pids
  pids=($(tmux list-panes -s -t "$session" -F '#{pane_pid}' 2>/dev/null))

  if [[ ${#pids[@]} -eq 0 ]]; then
    echo "tmux-kill: no panes found in session '$session'"
    return 1
  fi

  echo "tmux-kill: sending SIGTERM to ${#pids[@]} pane process(es) in '$session'..."
  for pid in "${pids[@]}"; do
    echo "  kill $pid"
    kill "$pid" 2>/dev/null
  done

  # Give panes a moment to exit cleanly
  sleep 0.5

  if tmux has-session -t "$session" 2>/dev/null; then
    echo "tmux-kill: session still alive, escalating to SIGKILL..."
    for pid in "${pids[@]}"; do
      kill -9 "$pid" 2>/dev/null
    done
    sleep 0.3
  fi

  if tmux has-session -t "$session" 2>/dev/null; then
    echo "tmux-kill: session '$session' still exists — may need manual intervention"
    return 1
  else
    echo "tmux-kill: session '$session' is gone"
  fi
}
