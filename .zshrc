export ZSH=~/.zsh

# Load all of the config files in ~/oh-my-zsh that end in .zsh
for config_file ($ZSH/lib/*.zsh) source $config_file

export TERM="xterm-256color"

# Load and run compinit
autoload -U compinit
compinit -i

alias vi='TERM=xterm;vim'
alias scp='noglob scp'
alias rsync='noglob rsync'

export PAGER="most"

if [[ -r /usr/share/powerline/bindings/zsh/powerline.zsh ]]; then
    source /usr/share/powerline/bindings/zsh/powerline.zsh
fi

#
# history
#

#set history size
export HISTSIZE=10000
#save history after logout
export SAVEHIST=10000
#history file
export HISTFILE=~/.zsh_history
#append into history file
setopt INC_APPEND_HISTORY
#save only one command if 2 common are same and consistent
setopt HIST_IGNORE_DUPS
#add timestamp for each entry
setopt EXTENDED_HISTORY

alias allhistory='history 1'

#
# powerline
#
source  ~/dotfiles/powerlevel9k/powerlevel9k.zsh-theme

POWERLEVEL9K_MODE='awesome-patched'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir rbenv)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history vcs)

POWERLEVEL9K_HISTORY_BACKGROUND="blue"
POWERLEVEL9K_HISTORY_FOREGROUND="white"

POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"

PLATTFORM='unknown'
unamestr=$(uname)
if [[ "$unamestr" == 'Linux' ]]; then
   PLATTFORM='linux'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
   PLATTFORM='freebsd'
fi

if [[ $PLATTFORM == 'linux' ]]; then
   alias ls='ls --color=auto'
   alias ll='ls -l --color=auto'
   alias lll='ls -la --color=auto'
elif [[ $PLATTFORM == 'freebsd' ]]; then
   alias ls='ls -G'
   alias ll='ls -l -G'
   alias lll='ls -la -G'
fi



