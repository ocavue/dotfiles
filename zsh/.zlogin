#
# Executes commands at login post-zshrc.
#

# Source plugins.
if [ -f "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" ]
then
    source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Fix the issue that "z" go the the wrong subdirectly https://github.com/agkozak/zsh-z#zshz_uncommon
export ZSHZ_UNCOMMON=1

# # Setup iterm2 Shell Integration
# # document: https://iterm2.com/documentation-shell-integration.html
# if [ -f "$HOME/.iterm2_shell_integration.zsh" ]
# then
#     source $HOME/.iterm2_shell_integration.zsh
# fi

# Set Go environment variables.
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:$GOBIN"

# Do not download bundled Chromium during installation step of Puppeteer
# https://github.com/puppeteer/puppeteer/blob/v0.10.2/docs/api.md#environment-variables
export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD="yes"
export PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD="yes"

if [ -e "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" ]
then
    export PUPPETEER_EXECUTABLE_PATH="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
    export PLAYWRIGHT_CHROME_EXECUTABLE_PATH="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
fi

# Fix the issue of duplicated command
# https://github.com/sindresorhus/pure/issues/300#issuecomment-328744993
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

function setproxy {
    export HTTPS_PROXY=http://127.0.0.1:1081/
    export HTTP_PROXY=http://127.0.0.1:1081/
    export ALL_PROXY=http://127.0.0.1:1081/
    export NO_PROXY=localhost,0.0.0.0,127.0.0.1
    export https_proxy=http://127.0.0.1:1081/
    export http_proxy=http://127.0.0.1:1081/
    export all_proxy=http://127.0.0.1:1081/
    export no_proxy=localhost,0.0.0.0,127.0.0.1
}
