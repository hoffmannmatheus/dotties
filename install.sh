#/bin/bash

echo 'Installing dotties...'

# basic aptitudes
sudo apt-get -qy install vim tig git gource lua5.2 

# dotties
echo ' copying dotties...'
pushd . > /dev/null
cd dots

cp .gitconfig ~/
cp .bashrc ~/
cp .vimrc ~/

tar -zxvf .vim.tgz
rm -rf ~/.vim
mv .vim ~/
rm -rf .vim

popd > /dev/null
source ~/.bashrc

echo 'Done!'
