main=1
stable=2

read -p "checkout branch main/stable-4-0 -> (1/2)" branch 

if [ $branch == $main ] ; then
    currentBranch="main"
elif [ $branch == $stable ] ; then
    currentBranch="stable-4-0"
fi
echo $currentBranch

directories="$(ls -l | grep -i vr | awk {'print$9'})"

for directory in $directories; do
    cd $directory
    pwd -W
    git checkout $currentBranch > /dev/null
    git pull > /dev/null;

    cd ..
done