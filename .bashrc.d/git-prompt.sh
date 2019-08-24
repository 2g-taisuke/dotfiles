# git-prompt
. ${HOME}/.git-prompt.sh

# プロンプトに各種情報を表示
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWUNTRACKEDFILES=
GIT_PS1_SHOWSTASHSTATE=1

# see: http://bashrcgenerator.com/
#export PS1='[\u@\h \w$(__git_ps1)]\$ '
export PS1='\[$(tput bold)\]\[\033[38;5;2m\]\w$(__git_ps1) > \[$(tput sgr0)\]'
