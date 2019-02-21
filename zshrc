# Load zgen
source "${HOME}/.zgen/zgen.zsh"

#----------------------------------------
# Zgen
#----------------------------------------
if ! zgen saved; then

	# Load oh-my-zsh base plugins
	zgen oh-my-zsh

	# Specify particular plugins here
    zgen oh-my-zsh plugins/command-not-found
	zgen oh-my-zsh plugins/git
	zgen oh-my-zsh plugins/tmux
	zgen oh-my-zsh plugins/history
	zgen oh-my-zsh plugins/web-search
	zgen oh-my-zsh plugins/vi-mode
	zgen oh-my-zsh themes/ys
	zgen oh-my-zsh plugins/extract

	# NOTE: zsh-syntax-highlighting *must* come before zsh-history-substring
	# search, else breakage occurs (or so I'm told).
	zgen load jdavis/zsh-files
	zgen load zsh-users/zsh-completions src
	zgen load zsh-users/zsh-syntax-highlighting
	zgen load zsh-users/zsh-history-substring-search

	# Use bullet train theme
	# zgen load caiogondim/bullet-train-oh-my-zsh-theme bullet-train
	zgen load win0err/aphrodite-terminal-theme aphrodite

	# Generate the init.zsh script
	zgen save
fi

# Remove `nvm` from BULLETTRAIN_PROMPT_ORDER, since it only works if node/nvm
# are installed, and I don't have much need for this, see:
#
#   - https://github.com/caiogondim/bullet-train.zsh/issues/192
#
#BULLETTRAIN_PROMPT_ORDER=($(echo ${BULLETTRAIN_PROMPT_ORDER[@]/#%nvm}))

#----------------------------------------
# Aliases
#----------------------------------------
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -la --color=auto'
alias dirs='dirs -v'
alias dd='dd status=progress'
alias c='clear'
alias grep='grep --color=auto'
alias vim='nvim'
alias p='popd'
alias pu='pushd'
alias ipython="python3 -m IPython"

export TERM='xterm-256color'
export EDITOR='nvim'
unset GREP_OPTIONS

bindkey -v

# gitlab config, for engr gitlab
# export GITLAB_API_ENDPOINT=https://gitlab-beta.engr.illinois.edu/api/v4
# export GITLAB_API_PRIVATE_TOKEN=6M6c5scTU66B49EXEkYZ
# export PATH="/home/rodrigo/anaconda3/bin:$PATH"
#

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# export FZF_DEFAULT_COMMAND='ag ""'
# export FZF_DEFAULT_COMMAND='find . -path "*/\.*" -prune -o -type f -print -o -type l -print 2> /dev/null | sed s/^..//'
# Source lmod init script
source /usr/share/lmod/lmod/init/profile
source /etc/profile.d/zzz_eli_lmod.sh
# Fix for certain GTK apps crashing
GTK_IM_MODULE=''

if [ -z "$TMUX" ]
then
    tmux attach -t TMUX || tmux new -s TMUX
fi

# alias matlab='matlab -nodesktop -nodisplay -nosplash'
export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64:/usr/local/cuda-8.0/extras/CUPTI/lib64:$LD_LIBRARY_PATH

unalias rm
