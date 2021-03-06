sudo apt-get update && sudo apt-get install zsh -y
sudo sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
mv .zshrc zshrc.bk
ln -s dotfiles/zshrc .zshrc
cd .oh-my-zsh
git apply ../dotfiles/zsh_history.patch
cat -n .bash_history | sort -k2 -k1n | uniq -f1 | sort -nk1,1 | cut -f2- >> .zsh_history

