# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# # Setup iterm2 Shell Integration
# # document: https://iterm2.com/documentation-shell-integration.html
# if [ -f "$HOME/.iterm2_shell_integration.zsh" ]
# then
#     source $HOME/.iterm2_shell_integration.zsh
# fi

# Set Go environment variables.
export GOPATH="$HOME/go"

# Set Ruby environment variables.
export GEM_HOME=$HOME/.gem

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"

# bun
export BUN_INSTALL="$HOME/.bun"

# Set PATH
# /opt/homebrew/bin is for homebrew on Apple Silicon Mac
for dir in \
  "/opt/homebrew/bin" \
  "/opt/homebrew/opt/node@18/bin" \
  "/opt/homebrew/opt/node@20/bin" \
  "/opt/homebrew/opt/openjdk/bin" \
  "/opt/homebrew/opt/python@3.10/bin" \
  "/opt/homebrew/opt/ruby/bin" \
  "$GEM_HOME/bin" \
  "$GOPATH/bin" \
  "$HOME/Library/Python/3.10/bin" \
  "$HOME/code/github/dotfiles/bin" \
  "$HOME/code/github/prosemirror/bin" \
  "$PNPM_HOME" \
  "$BUN_INSTALL/bin"
do
  [[ -d "$dir" ]] && export PATH="$dir:$PATH"
done

# Stop Next.js from collecting my information: https://nextjs.org/telemetry
export NEXT_TELEMETRY_DISABLED=1

# Do not download bundled Chromium during installation step of Puppeteer
# https://github.com/puppeteer/puppeteer/blob/v0.10.2/docs/api.md#environment-variables
export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD="yes"
export PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD="yes"
export CYPRESS_INSTALL_BINARY="0"

# Do not download asset during installation step of node-re2, to speed up the installation
# https://github.com/uhop/node-re2/issues/116#issuecomment-958187621
export DEVELOPMENT_SKIP_GETTING_ASSET="yes"

if [ -e "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" ]
then
    export PUPPETEER_EXECUTABLE_PATH="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
    export PLAYWRIGHT_CHROME_EXECUTABLE_PATH="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
fi

# zoxide
if [ -x "$(command -v zoxide)" ]; then
    export _ZO_ECHO=1
    eval "$(zoxide init zsh)"
fi

# jj
if [ -x "$(command -v jj)" ]; then
    source <(COMPLETE=zsh jj)
    jj config set --user ui.paginate never
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

function rmcache {
  rm -rf ./.next
  rm -rf ./node_modules/.vitest
  rm -rf ./node_modules/.vite
  rm -rf ./node_modules/.cache
}

# Stop Powerlevel10k from printing warning
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# pyenv 
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# if pyenv is installed, then init pyenv
if command -v pyenv > /dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

# uv
if [[ -f "$HOME/.local/bin/env" ]]; then
    source "$HOME/.local/bin/env"
fi

# corepack
export COREPACK_DEFAULT_TO_LATEST=0
export COREPACK_ENABLE_AUTO_PIN=0
export COREPACK_ENABLE_DOWNLOAD_PROMPT=0
export COREPACK_ENABLE_STRICT=0

function print_prompt {
    # more color: https://stackoverflow.com/a/28938235
    mkdir -p /tmp/zsh_prompt/
    zsh_prompt_file="/tmp/zsh_prompt/$(date +"%Y-%m-%d_%H")"
    if [[ ! -f "$zsh_prompt_file" ]]; then
        echo '\033[1;33m''(>_< ) 今天也是元气满满的一天！''\033[0m'
        touch $zsh_prompt_file
    fi
    unset zsh_prompt_file
}

print_prompt
