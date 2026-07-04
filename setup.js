#!/usr/bin/env node
// Idempotent zsh config setup. Safe to run repeatedly.
// Copies this repo's .zshrc to ~/.zshrc, which zsh reads on login.
// zsh is unix-only, so there is no per-platform branching.

'use strict';

const fs = require('fs');
const os = require('os');
const path = require('path');

const SRC = path.join(__dirname, '.zshrc');
const DEST = path.join(os.homedir(), '.zshrc');

function log(msg) {
  console.log(`[zshrc-config] ${msg}`);
}

fs.copyFileSync(SRC, DEST);
log(`Copied .zshrc -> ${DEST}`);
log('Done. Open a new shell or run `source ~/.zshrc` to apply.');
