# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi


export PATH
export TERM='xterm'
export SSLKEYLOGFILE=~/.ssl-key.log


## Node 
export NODE_ENV='dev'

## Cuda
PATH="/usr/local/cuda-11/bin:$PATH"

## Java
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
PATH="$PATH:/opt/maven/apache-maven-3.8.1/bin"

## Scripts
prompt() {
	if [[ $1 == '' ]]; then 
		echo 'Argument Empty';
	else 
		export PS1=$1 ;
	fi
}
bin_npm() {
	PATH="`pwd`/node_modules/.bin:$PATH"
}
xrandr_correct() {

	xrandr --output DP1 --auto --right-of eDP1 ; 
	./.fehbg; 
}
night_switch() {
	xrandr --output $1 --gamma 1.0:0.88:0.76 --brightness 0.55 
}
day_switch() {
	xrandr --output $1 --gamma 1:1:1 --brightness 1.0
}

conda() {
	# >>> conda initialize >>>
	# !! Contents within this block are managed by 'conda init' !!
	__conda_setup="$('/home/irshadcc/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
	if [ $? -eq 0 ]; then
	    eval "$__conda_setup"
	else
	    if [ -f "/home/irshadcc/anaconda3/etc/profile.d/conda.sh" ]; then
		. "/home/irshadcc/anaconda3/etc/profile.d/conda.sh"
	    else
		export PATH="/home/irshadcc/anaconda3/bin:$PATH"
	    fi
	fi
	unset __conda_setup
	# <<< conda initialize <<<
}

## Alias
alias reload-x="xrdb -load ~/.Xresources"
alias sus="systemctl suspend"
alias shut="systemctl poweroff"
