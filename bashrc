#
# ~/.bashrc (modernized)
#

# Only run this if interactive
[[ $- != *i* ]] && return

# --- Color utilities ---
colors() {
    local fg bg val
    echo "Color escapes: \e[<value>m"
    for fg in {30..37}; do
        for bg in {40..47}; do
            val="${fg};${bg}"
            printf "  %-9s" "\e[${val}mTEXT\e[0m"
            printf " \e[${val};1mBOLD\e[0m"
        done
        echo; echo
    done
}

# --- Bash completion ---
if [ -r /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
fi

# --- Colorful prompt ---
if [ -x "$(command -v dircolors)" ]; then
    if [ -f ~/.dir_colors ]; then
        eval "$(dircolors -b ~/.dir_colors)"
    elif [ -f /etc/DIR_COLORS ]; then
        eval "$(dircolors -b /etc/DIR_COLORS)"
    fi
fi

# Simple colored PS1
if [[ $EUID == 0 ]]; then
    PS1='\[\033[01;31m\][\h \W]\$\[\033[00m\] '
else
    PS1='\[\033[01;32m\][\u@\h \W]\$\[\033[00m\] '
fi

# Enable color for common commands
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# --- Useful bash options ---
shopt -s checkwinsize   # Update terminal size after each command
shopt -s histappend     # Append to history, don't overwrite
shopt -s expand_aliases # Ensure aliases work in scripts

# --- Aliases ---
alias vim="nvim"

# --- Node Version Manager (NVM) ---
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# --- Custom PATH ---
export PATH="$HOME/.local/nvim-znver2/bin:$HOME/Apps/bin:$PATH"
