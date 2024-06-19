autoload -Uz vcs_info

#version control info

zstyle ':vcs_info:*' enable git
precmd() { vcs_info }
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '!'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git:*' formats $'(git:%b)%u%c%m'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        hook_com[staged]+='T'
    fi
}

#prompt info

PROMPT_USER_MACHINE='%B%F{40}%n@%m'
PROMPT_PATH=' %B%F{75}%(6~.%-1~/…/%4~.%5~)'
PROMPT_GIT='%F{reset}${vcs_info_msg_0_}'
PROMPT_DOLLAR=$'%b%F{reset} '
PROMPT=$PROMPT_USER_MACHINE$PROMPT_PATH$PROMPT_GIT$PROMPT_DOLLAR


#setopt

setopt prompt_subst

#aliases

alias ls="ls -GF"
alias ll="ls -lGF"
alias la="ls -aGF"
alias l="ls -GF"
alias lla="ls -alGF"

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
