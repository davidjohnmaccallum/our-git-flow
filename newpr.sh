# Creates a PR once feature is ready for review.

# Stop on error
set -e

# Make sure all changes are committed
if [[ ! -z $(git status --short --untracked-files=no) ]]; then
    echo "Git working directory not clean."
    git status --short --untracked-files=no
    exit 2
fi

# Checkout develop
git checkout develop
# Refresh develop
git pull
oldVer=`cat ./version`
# Checkout feature branch
git checkout -
# Merge develop into feature branch
git merge develop
# Manually resolve conflicts
# Bump version
newVer=`echo $oldVer | awk -F. '{$NF = $NF + 1;} 1' | sed 's/ /./g'`
echo $newVer > ./version
echo Bumped version from $oldVer to $newVer
git commit -am "Bumped version from $oldVer to $newVer"
# Push feature branch
git push
# Create pull request
if ! gh pr view --web ; then
  gh pr create --web
fi
echo "Waiting to go to prod:"
git --no-pager log --left-right --graph --cherry-pick --oneline develop...master