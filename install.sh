#/bin/bash

# installs Theos vim/konsole + dotties!
echo 'Installing Theos dotties...'

# aptitudes
sudo apt-get -qy install vim
sudo apt-get -qy install konsole
sudo apt-get -qy install tig

# dotties
echo ' copying dotties...'
pushd . > /dev/null
cd dots

cp .gitconfig ~/
cp .bashrc ~/
cp .vimrc ~/

tar -zxvf .vim.tgz
mv .vim ~/
rm -rf .vim

tar -zxvf kde.tgz
mkdir -p ~/kde/share/apps/konsole
mv kde/* ~/kde/share/apps/konsole/
rm -rf kde

popd > /dev/null

echo 'Done!'
