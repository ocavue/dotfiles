#!/bin/zsh

set -ex

# debug log
echo "Running setup.sh $(whoami) $(date)" > $HOME/.dotfiles.setup.log

# get absolute path of dotfiles
cd $(dirname $0)
DOTFILES_PATH=$PWD

# switch the default shell to `zsh`
sudo chsh -s /bin/zsh

# install oh-my-zsh (GitHub Codespaces already has oh-my-zsh installed)
if [ ! -d "$HOME/.oh-my-zsh" ]
then
    curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh > /tmp/ohmyzsh_install.sh
    sh /tmp/ohmyzsh_install.sh
fi

function git_clone {
    remote=$1
    local=$2
    if [ ! -d "$local" ]
    then
        git clone --depth=1 $remote $local
    fi
}

# install z
git_clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-z

# install powerlevel10k
git_clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# install zsh-autosuggestions
git_clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# install iTerm2 Shell Integration
# document: https://iterm2.com/documentation-shell-integration.html
# curl -L https://iterm2.com/shell_integration/zsh -o $HOME/.iterm2_shell_integration.zsh

# setup zsh config
ln -sf $DOTFILES_PATH/zsh/.zshrc $HOME/.zshrc
ln -sf $DOTFILES_PATH/zsh/.zlogin $HOME/.zlogin
ln -sf $DOTFILES_PATH/zsh/.p10k.zsh $HOME/.p10k.zsh

echo "Finished setup.sh $(whoami) $(date)" > $HOME/.dotfiles.setup.log
echo "Finished dotfiles/setup.sh"
