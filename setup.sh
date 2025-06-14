#!/bin/zsh

set -ex

# debug log
echo "Running dotfiles/setup.sh $(whoami) $(date)" >> $HOME/.dotfiles.setup.log

# get absolute path of dotfiles
cd $(dirname $0)
DOTFILES_PATH=$PWD

# install oh-my-zsh (GitHub Codespaces already has oh-my-zsh installed)
if [ ! -d "$HOME/.oh-my-zsh" ]
then
    curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh > /tmp/ohmyzsh_install.sh
    # RUNZSH - 'no' means the installer will not run zsh after the install (default: yes)
    # https://github.com/ohmyzsh/ohmyzsh/blob/95ef2516697aa764d1d4bb93ad3490584cc118ec/tools/install.sh#L29
    export RUNZSH=no
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

# install zoxide and fzf
if [ -x "$(command -v brew)" ]; then
    brew install zoxide fzf
fi

# install powerlevel10k
git_clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# install zsh-autosuggestions
git_clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# install ni
if [ -x "$(command -v npm)" ]; then 
    # npm exists
    if ! [ -x "$(command -v ni)" ]; then
        # ni not exists
        npm install -g @antfu/ni
    fi
fi

# install iTerm2 Shell Integration
# document: https://iterm2.com/documentation-shell-integration.html
# curl -L https://iterm2.com/shell_integration/zsh -o $HOME/.iterm2_shell_integration.zsh

# setup zsh config
ln -sf $DOTFILES_PATH/zsh/.zshrc $HOME/.zshrc
ln -sf $DOTFILES_PATH/zsh/.p10k.zsh $HOME/.p10k.zsh

# set default shell to zsh on GitHub Codespaces
if [ -n "$CODESPACES" ]; then
    echo "Setting default shell to zsh on GitHub Codespaces" >> $HOME/.dotfiles.setup.log
    sudo chsh "$(id -un)" --shell "/usr/bin/zsh"
fi

echo "Finished setup.sh $(whoami) $(date)" >> $HOME/.dotfiles.setup.log
echo "Finished dotfiles/setup.sh"
