# enable bash completion in interactive shells
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# RVM bash completion
[[ -r /usr/local/rvm/scripts/completion ]] && . /usr/local/rvm/scripts/completion

export TERM=rxvt-unicode-256color
eval `dircolors ~/dotfiles/dircolors-solarized/dircolors.256dark`
alias grep='grep --color'
alias ls='ls --color=auto'

# needed for git helper functions
source /usr/share/git/completion/git-prompt.sh

# userline config 
tput-colors() {
    for i in $(seq 1 255);do 
        echo "$i - $(tput setaf $i)color$(tput sgr0)" 
    done
}
reset=$(tput sgr0)
yellow=$(tput setaf 184)
cyan=$(tput setaf 51)
light_green=$(tput setaf 46)

export PS1='\[$yellow\]\u\[$reset\]\[$light_green\]@\[$reset\]\[$cyan\]\w\[$reset\]\[$light_green\]\$ \[$reset\]'

# Ruby, ruby, ruby
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
alias rake="bundle exec rake"
alias be="bundle exec"

alias open='xdg-open'

# Browswave connected stuff
alias bw='cd ~/Programming/browswave'
alias icbw='cd ~/Programming/icecat'
alias cw='cd ~/Programming/browswave/vendor/plugins/crawlers'
alias bic='cd ~/Programming/icecat'
alias dbbw='psql --dbname browswave_development'
alias bwssh='ssh browswave@browswave.com'
alias hulkssh='ssh browswave@pricelens.com'
alias plssh='ssh pricelens@pricelens.com'

# Configure less for default pager
export PAGER=less
export LESS="-r"
# Configure vim for default editor
export EDITOR=vim

# load app manager script
. ~/bin/app_manager.sh

# tmux git plugin
. ~/dotfiles/tmux-git/tmux-git.sh # think about removing it

# Remove useless bash stop/start screen input commands
stty stop undef
stty start undef

# Show Monday as first day of the calendar
alias cal="cal -m"
