#!/bin/zsh

set -ex

# debug log
echo "Running setup.sh $(whoami) $(date)" > $HOME/.dotfiles.setup.log

# switch the default shell to `zsh`
sudo chsh -s /bin/zsh

# install oh-my-zsh (GitHub Codespaces already has oh-my-zsh installed)
if [ ! -d "$HOME/.oh-my-zsh" ]
then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# install z
git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-z

# install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions

# install iTerm2 Shell Integration
# document: https://iterm2.com/documentation-shell-integration.html
# curl -L https://iterm2.com/shell_integration/zsh -o $HOME/.iterm2_shell_integration.zsh

# setup zsh config
ln -sf $(dirname $0)/zsh/.zlogin $HOME/.zlogin

# setup theme
ln -sf $(dirname $0)/zsh/.p10k.zsh $HOME/.p10k.zsh
