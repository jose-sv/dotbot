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
alias ls='ls'
alias ll='ls -l'
alias la='ls -la'
alias dirs='dirs -v'
alias dd='dd status=progress'
alias c='clear'
alias grep='grep --color=auto'
alias vim='nvim'
alias p='popd'
alias pu='pushd'

# ARM64
alias tmux=/opt/homebrew/bin/tmux
alias nvim=/opt/homebrew/bin/nvim
alias abrew=/opt/homebrew/bin/brew

alias x86='arch -x86_64'

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
# source /usr/share/lmod/lmod/init/profile
# source /etc/profile.d/zzz_eli_lmod.sh
# Fix for certain GTK apps crashing
GTK_IM_MODULE=''

# if [ -z "$TMUX" ]
# then
#     tmux attach -t TMUX || tmux new -s TMUX
# fi

# alias matlab='matlab -nodesktop -nodisplay -nosplash'
# export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64:/usr/local/cuda-8.0/extras/CUPTI/lib64:$LD_LIBRARY_PATH

unalias rm

alias glances=./Library/Python/2.7/bin/glances

alias tasks=/Users/josesanchezvicarte/todo/tasks
export PATH="$HOME/.gem/ruby/2.6.0/bin:$PATH"
export PATH="$HOME/Library/Python/3.8/bin/:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

alias fm='/Users/josesanchezvicarte/file_management/process_file.py'

alias lg='lazygit'

alias vpn='sudo openconnect --user josers2 --protocol=anyconnect vpn.cites.illinois.edu --passwd-on-stdin --authgroup=1 < /Users/josesanchezvicarte/ocp'
# alias mit_vpn='sudo openconnect --user jose-shd --protocol=anyconnect vpn.cites.illinois.edu --passwd-on-stdin --authgroup=1 < /Users/josesanchezvicarte/mit_ocp'

function bw_prev {
    gs -sOutputFile=$1_gray.pdf -sDEVICE=pdfwrite -sColorConversionStrategy=Gray -dProcessColorModel=/DeviceGray -dCompatibiltyLevel=1.4 -dNOPAUSE -dBATCH $@
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/josesanchezvicarte/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/josesanchezvicarte/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/josesanchezvicarte/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/josesanchezvicarte/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

sjrnl () {
    if [ $1 != "--all_text" ]; then
        args='--short'
    else
        shift;
    fi
    project=$1; shift
    entries=$(jrnl $project -to today $args | fzf -m -0)
    for entry in $entries; do
        echo $entry
        title=$(echo $entry | sed -e 's|....-..-.. ..:.. ||' -e 's/| //')
        echo $title
        jrnl $project -contains "$title" $*
    done
}

njrnl () {
    project=$1; shift
    if (( $# == 1 )); then
        jrnl $project today: $1
    else
        jrnl $project today: placeholder
    fi
    jrnl $project -1 --edit
}

eval "$(rbenv init - zsh)"

export PATH="/Users/josesanchezvicarte/Library/Python/3.9/bin:$PATH"
