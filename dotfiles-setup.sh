#!/bin/bash
set -e

REPO_URL="${1:-git@github.com:YOUR_GITHUB_USERNAME/dotfiles.git}"
DOTFILES_DIR="$HOME/.dotfiles"
TRACKED_FILES=(".zshrc" ".tmux.conf")

echo "Setting up dotfiles from $REPO_URL"
echo ""

# Check for conflicting files before doing anything
CONFLICTS=()
for f in "${TRACKED_FILES[@]}"; do
  if [ -f "$HOME/$f" ]; then
    CONFLICTS+=("$HOME/$f")
  fi
done

if [ ${#CONFLICTS[@]} -gt 0 ]; then
  echo "The following files already exist and must be deleted before setup can continue:"
  echo ""
  for f in "${CONFLICTS[@]}"; do
    echo "  $f"
  done
  echo ""
  echo "Back them up if needed, delete them, then re-run this script."
  exit 1
fi

# Clone the bare repo
echo "Cloning bare repo to $DOTFILES_DIR..."
git clone --bare "$REPO_URL" "$DOTFILES_DIR"

# Checkout files into home directory
echo "Checking out dotfiles..."
git --git-dir="$DOTFILES_DIR" --work-tree="$HOME" checkout

# Hide untracked files from status
git --git-dir="$DOTFILES_DIR" --work-tree="$HOME" config --local status.showUntrackedFiles no

echo ""
echo "Done! Reload your shell:"
echo "  source ~/.zshrc"
