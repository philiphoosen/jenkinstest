#!/bin/sh
git diff-tree --no-commit-id --name-only -r $(git log --format="%H" -n 1) | sed -En 's|^(.+)/.+|\1|p' | uniq