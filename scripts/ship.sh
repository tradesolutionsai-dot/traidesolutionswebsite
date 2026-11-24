#!/usr/bin/env bash
# Commit everything and push to main. Vercel deploys main to production automatically.
set -e
cd "$(dirname "$0")/.."

if [ -z "$(git status --porcelain)" ]; then
  echo "Nothing to ship. No changes since last commit."
  exit 0
fi

echo "Changes going live:"
git status -s
echo
read -r -p "Describe the change (commit message): " msg
[ -z "$msg" ] && { echo "Cancelled: no message given."; exit 1; }

git pull --rebase origin main
git add -A
git commit -m "$msg"
git push origin main
echo
echo "Pushed. Vercel will have it live in about 30 seconds:"
echo "https://traidesolutionswebsite.vercel.app"
