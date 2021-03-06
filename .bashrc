alias ll='ls -al'
alias ..='cd ../'
alias ...='cd ../../'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias l='ls'
alias cm='git commit -m'
alias ad='git add'
alias ck='git checkout'
alias br='git branch'
alias ph='git push'
alias pho='git push origin'
alias pl='git pull'
alias plo='git pull origin'
alias st='git status'
alias gsls='gsutil ls'
alias gscat='gsutil cat'
alias desk='cd ~/Desktop/'
alias down='cd ~/Downloads/'
alias vec1='cd ~/vec1home/'
alias fumount='sudo diskutil umount force ~/vec1home'
alias fmount='sshfs winniexu@v.vectorinstitute.ai:/scratch/ssd001/home/winniexu/ /Users/winniexu/vec1home/'
#alias ckmount='sshfs winniexu@v.vectorinstitute.ai:/checkpoint/winniexu/ /Users/winniexu/ckpt/'
alias ckmount='sshfs winniexu@v.vectorinstitute.ai:/checkpoint/winniexu/icml/ /Users/winniexu/ckpt/'
alias ckumount='sudo diskutil umount force ~/ckpt'
alias tbvec1='ssh vec1 -NL 2002:vremote:2002'
alias tbvec2='ssh vec2 -NL 2003:v:2003'
# tensorboard --logdir_spec=1:gs://   
alias tbdev='tensorboard dev upload --logdir'
alias tmuxa='tmux attach-session -t'
alias tmuxn='tmux new-session -s'
alias pythonb='python -m pdb -c continue'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
# scp -r winniexu@v.vectorinstitute.ai:~/results_test/corrupt/ ~/Desktop/plot_corrupt
alias julia='/Applications/Julia-1.3.app/Contents/Resources/julia/bin/julia'

PS1='\u\[\e[36m\] λ\[\e[36m\]\w `if [ $? = 0 ]; then echo \[\e[33m\]:\)\[\e[37m\]; else echo \[\e[35m\]:\(\[\e[37m\]; fi` '

alias tcs='ssh xuwinni1@teach.cs.toronto.edu'
alias auto='ssh od@128.100.201.39 -p 10023'
alias autotensor='ssh od@128.100.201.39 -p 10023 -L localhost:16008:logstar:6008'
alias autoim='ssh -X -p 10023 od@128.100.201.39'
#light_blue="\[\e[0;36m\]"
#light_red="\[\e[0;35m\]"
#yellow="\[\e[0;33m\]"
##gray="\[\e[0;37m\]"
#reset="\[\e[m\]"
#
#prompt_command() {
#  local status="$?"
#  local status_color=""
#  if [ $status != 0 ]; then
#    status_color=${yello}
#    export PS1="${light_blue}\u${reset}λ\w${reset} ${status_color}:)${reset} "
#  else
#    status_color=${light_red}
#    export PS1="${light_blue}\u${reset}λ\w${reset} ${status_color}:(${reset} "
#  fi
#}
#PS1="$PSI"`prompt_command`
#export PROMPT_COMMAND=prompt_commandsh
