# Creates a new PR to merge develop into master

# Stop on error
set -e

# Update develop and master branches
git checkout master
git pull
git checkout develop
git pull

# Diff develop and master
echo "The following changes will be deployed to prod:"
git --no-pager log --left-right --graph --cherry-pick --oneline develop...master | grep '<'

# Create pull request
if ! gh pr view --web ; then
  gh pr create --web
fi
