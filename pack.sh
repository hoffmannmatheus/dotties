#/bin/bash

# Run this from the Dots repository root.
echo 'packing dotties...'

source=$(pwd)
pushd . > /dev/null
cd ~

# vim
echo ' packing vim...'
cp .vimrc $source/dots/
tar -zcvf .vim.tgz .vim
mv .vim.tgz $source/dots/

# bash
echo ' packing bashrc...'
cp .bashrc $source/dots/

# git
echo ' packing gitconfig...'
cp .gitconfig $source/dots/

popd > /dev/null

echo 'done.'
git status
