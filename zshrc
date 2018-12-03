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
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# for cuda
export PATH=/usr/local/cuda-9.0/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64:/usr/local/cuda-9.0/extras/CUPTI/lib64:$LD_LIBRARY_PATH

# for fathom
export PYTHONPATH=/main/fathom/fathom:$PYTHONPATH

# alias cd='pushd'
alias p='popd'
alias dirs='dirs -v'

# gitlab config, for engr gitlab
export GITLAB_API_ENDPOINT=https://gitlab-beta.engr.illinois.edu/api/v4
export GITLAB_API_PRIVATE_TOKEN=6M6c5scTU66B49EXEkYZ
# export PATH="/home/rodrigo/anaconda3/bin:$PATH"
#
alias vim='vim.nox'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# export FZF_DEFAULT_COMMAND='ag ""'
export FZF_DEFAULT_COMMAND='find . -path "*/\.*" -prune -o -type f -print -o -type l -print 2> /dev/null | sed s/^..//'

# alias matlab='matlab -nodesktop -nodisplay -nosplash'
export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64:/usr/local/cuda-8.0/extras/CUPTI/lib64:$LD_LIBRARY_PATH

unalias rm
