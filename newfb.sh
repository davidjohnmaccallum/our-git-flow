# Creates a new feature branch.

# Stop on error
set -e

# Print usage instructions
if [[ $# -ne 1 ]]; then
    echo "Usage: newfeature [branch-name]"
    exit 2
fi

# Get branch name from args
branchName=$1

# Refresh develop and create feature branch
git checkout develop
git pull
git branch $branchName
git checkout $branchName
git push -u origin $branchName
