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

export PATH="/home/josers2/.local/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# export FZF_DEFAULT_COMMAND='ag ""'
# export FZF_DEFAULT_COMMAND='find . -path "*/\.*" -prune -o -type f -print -o -type l -print 2> /dev/null | sed s/^..//'
# Source lmod init script
source /usr/share/lmod/lmod/init/profile
source /etc/profile.d/zzz_eli_lmod.sh
# Fix for certain GTK apps crashing
GTK_IM_MODULE=''

# alias matlab='matlab -nodesktop -nodisplay -nosplash'
# export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64:/usr/local/cuda-8.0/extras/CUPTI/lib64:$LD_LIBRARY_PATH

unalias rm

nzFiles() {
    # if there are arguments
    if [ $# -ne 0  ]
    then
        # list all files with size > 0
        for i; do
            if [ -s $i ] ]
            then
                echo $i
            fi
        done
    fi

}

parallel-apt() {
    # if there are arguments
    if [ $# -ne 0  ]
    then
        # for every package to install
        for host in $(cat ~/hosts); do
            # echo $host
            # echo $@
            ssh -t $host sudo apt $@
        done
    fi

}

parallel-deb() {
    # if there are arguments
    if [ $# -ne 0  ]
    then
        # for every package to install
        for host in $(cat ~/hosts); do
            # echo $host
            # echo $@
            ssh -t $host sudo dpkg -i $@
        done
    fi

}

parallel-sudo() {
    # if there are arguments
    if [ $# -ne 0  ]
    then
        # for every package to install
        for host in $(cat ~/hosts); do
            # echo $host
            # echo $@
            ssh -t $host sudo $@
        done
    fi

}

parallel-cmd() {
    # if there are arguments
    if [ $# -ne 0  ]
    then
        # for every package to install
        for host in $(cat ~/hosts); do
            # echo $host
            # echo $@
            ssh -t $host $@
        done
    fi

}

alias tasks=/home/josers2/todo/tasks
cq() {
    condor_q $@ | bat
}
cqa() {
    condor_q -all $@ | bat
}
cqnb() {
    condor_q -nobatch $@ | bat
}
cqr() {
    condor_q -nobatch | rg -e '^[\d.]+\s+josers2\s+[\d/]+\s+[\d:]+\s+[\d+:]+\s+R' | bat --style=grid,numbers
}
cqs() {
    condor_q -nobatch $@ | fzf
}
cqid() {
    condor_q -nobatch $@ | fzf -m | sed -e 's|^ \+||' -e 's| .*||'
}
cqsa() {
    condor_q -all -nobatch $@ | fzf
}
cqba() {
    if [ $# -eq 0 ]
    then
        condor_q -better-analyze  $(condor_q -nobatch | fzf -m | sed -e 's|^ \+||' -e 's| .*||') | bat --style=numbers,grid
    else
        condor_q -better-analyze   $@ | bat --style=numbers,grid
    fi
}
cr() {
    if [ $# -eq 0 ]
    then
        condor_rm $(condor_q -nobatch | fzf -m | sed -e 's|^ \+||' -e 's| .*||')
    else
        condor_rm $@
    fi
}
crc() {
    condor_rm $(condor_q | fzf -m | sed -e 's|^ \+||' -e 's| .*||')
}
alias cst=condor_status
alias cs=condor_submit
alias pssh='parallel-ssh -h ~/hosts -i'

if (( ${+_CONDOR_SLOT_NAME} )); then
    echo "Running in a condor slot"
else
    if [ -z "$TMUX" ]; then
        tmux attach -t TMUX || tmux new -s TMUX
    fi
fi

export PATH=/home/josers2/.ruby/bin:$PATH
export GEM_HOME=/home/josers2/.ruby

# args: name url
setup-push() {
    if [ $# -eq 2 ]
    then
        parallel-ssh -h ~/hosts -i "mkdir -p /scratch/jose/.repos/$1;
        cd /scratch/jose/.repos/$1;
        git init --bare;
        echo \#\!/bin/sh > hooks/post-receive;
        echo GIT_WORK_TREE=/scratch/$1 git checkout -f > hooks/post-receive;
        chmod +x hooks/post-receive;
        mkdir /scratch/$1"
        git remote add fpsg $2
        git remote add test_machines $2
        git remote add run_machines $2
        git remote set-url --add --push fpsg midgar:/scratch/jose/.repos/$1
        git remote set-url --add --push fpsg weapon:/scratch/jose/.repos/$1
        git remote set-url --add --push fpsg bahamut:/scratch/jose/.repos/$1
        git remote set-url --add --push run_machines midgar:/scratch/jose/.repos/$1
        git remote set-url --add --push run_machines weapon:/scratch/jose/.repos/$1
        git remote set-url --add --push test_machines bahamut:/scratch/jose/.repos/$1
        # git push fpsg +master:refs/heads/master
    else
        echo "Bad number of arguments"
    fi
}

DISABLE_UNTRACKED_FILES_DIRTY="true"
