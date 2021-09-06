# Cleans up a feature branch once the PR has been merged.

# Stop on error
set -e

# Get branch name
branch=`git branch --show-current`

# Check that this is a feature branch
if [ "$branch" = "master" ] || [ "$branch" = "develop" ]; then
    echo "Cannot close feature. Not on a feature branch."
    exit 2
fi

# Update develop and remove feature branch
git checkout develop
git fetch -p
git pull
git branch -D $branch
