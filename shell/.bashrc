# Check for an interactive session
# lolcat [ -z "$PS1" ] && return
#PS1='[\u@\h \W]\$ '
PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] "
export HISTCONTROL=ignoredups

. ~/.exports							
. ~/.aliases

