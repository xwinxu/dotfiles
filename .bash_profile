# export PATH=/Users/winniexu/anaconda3/bin:$PATH
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
# export PATH=$JAVA_HOME/bin:$PATH
# export PATH=${PATH}:/usr/local/mysql/bin/

export GOPATH=$HOME/go-workspace
export GOROOT=/usr/local/opt/go/libexec

export PATH=usr/local/bin:/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/mysql/bin/:$GOPATH/bin:$GOROOT/bin
# export PATH=/Users/winniexu/anaconda3/bin:/usr/local/bin:/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/mysql/bin/:$GOPATH/bin:$GOROOT/bin

export PATH=${PATH}:/Library/TeX/texbin
### TeX
# export PATH="/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin:$PATH"

vscode () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCODE" --args $* ;}

if [ -f ~/.bashrc ]; then
    source ~/.bashrc;
fi

alias python=python3
alias chrome="open -a 'Google Chrome'"

export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

#Colors
#light_green="\[\e[1;32m\]"
#light_red="\[\e[1;31m\]"
#yellow="\[\e[0;33m\]"
#gray="\[\e[0;37m\]"
#reset="\[\e[m\]"
#
##Customize prompt
#prompt_command() {
#	local status="$?"
#	local status_color=""
#	if [ $status != 0]; then
#		status_color=$light_red
#	else
#		status_color=$light_green
#	fi
#	export PS1="[${yellow}\w${reset}]${gray}$(__git_ps1){reset} ${status_color}λ${reset} "
#}
#export GIT_PS1_SHOWDIRTYSTATE=1
#export PROMPT_COMMAND=prompt_commandsh
# Homebrew

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/winniexu/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/winniexu/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/winniexu/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/winniexu/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/winniexu/google-cloud-sdk/path.bash.inc' ]; then . '/Users/winniexu/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/winniexu/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/winniexu/google-cloud-sdk/completion.bash.inc'; fi
export PATH=/Library/TeX/texbin:${PATH}
