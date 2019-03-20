# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/home/nlucent/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="muse"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git archlinux golang)

source $ZSH/oh-my-zsh.sh

# User configuration
unsetopt BEEP
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
 export SSH_KEY_PATH="~/.ssh/rsa_id"
# Terminal
export TERMINAL=/usr/bin/st

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Aliases
alias vi="nvim"
alias vim="nvim"
alias flash-kb="cd ~/code/qmk_firmware && util/docker_build.sh massdrop/ctrl:default && sudo ./mdloader_linux --first --download massdrop_ctrl_default.bin --restart"
alias rezsh="source ~/.zshrc"
alias edzsh="nvim ~/.zshrc"
alias edi3="nvim ~/.config/i3/config"
alias edvim="nvim ~/.vimrc"
alias breakssh="echo enter tilde ."

## Functions
cheat () {
    curl http://cht.sh/$1
}

vimgolf () {
    docker run --rm -it -e "key=$(cat ~/.vimgolf)" kramos/vimgolf $1
}

rpush () {
    rsync -zavh ~/.oh-my-zsh -e ssh $1:~
    rsync -zavh ~/.zshrc -e ssh $1:~
    rsync -zavh ~/.config/nvim -e ssh $1:~/.config
    rsync -zavh ~/.tmux* -e ssh $1:~
    if [[ "${1}" == "quizboy" ]]
    then 
        rsync -zavh ~/.dwarffortress -e ssh $1:~
    fi
}

scan () {
    scanimage --device "$(cat ~/.scanner)" --format=jpeg > $1
}

rpull () {
    rsync -zavh --exclude .oh-my-zsh/log/ --exclude .asound* --exclude .surf --exclude .mozilla --exclude .config/variety/Downloaded --exclude .bash_history --exclude vmware/  --exclude Mail/ --exclude .cache/ --exclude .config/BraveSoftware --exclude .local/share/Steam --exclude .local/share/Trash --exclude Downloads/ --exclude .ssh -e ssh nlucent@$1:~/ ~
   source ~/.zshrc

}

