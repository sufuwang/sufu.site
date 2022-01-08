submodule_name=$1
branch=$2

git pull
git submodule init
git submodule update
cd ./$submodule_name 
git checkout origin $branch
git pull origin $branch
cd ..