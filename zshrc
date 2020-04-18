# zmodload zsh/zprof
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
    zgen load unixorn/autoupdate-zgen
    zgen load zsh-users/zsh-autosuggestions
    zgen oh-my-zsh plugins/git
    # zgen oh-my-zsh plugins/tmux
    zgen load supercrabtree/k
    zgen oh-my-zsh plugins/history
    # zgen oh-my-zsh plugins/web-search
    zgen oh-my-zsh plugins/vi-mode
    zgen oh-my-zsh themes/ys
    zgen oh-my-zsh plugins/extract
    zgen oh-my-zsh plugins/rsync
    zgen oh-my-zsh plugins/per-directory-history
    zgen oh-my-zsh plugins/wd

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
alias rename='/usr/bin/rename'
unalias rm

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

on_highwind() {
    ssh highwind -t $@
}

alias condor_q='on_highwind condor_q'
alias condor_rm='on_highwind condor_rm'

cq() {
    condor_q $@ \| bat
}
cqa() {
    condor_q -all $@ \| bat
}
cqnb() {
    condor_q -nobatch $@ \| bat
}
cqr() {
    condor_q -nobatch \| rg -e '^[\d.]+\s+josers2\s+[\d/]+\s+[\d:]+\s+[\d+:]+\s+R' \| bat --style=grid,numbers
}
cqs() {
    condor_q -nobatch $@ \| rg '^\d' \| fzf
}
cqid() {
    condor_q -nobatch $@ \| rg '^\d' \| fzf -m \| sed -e 's/^ \+//' -e 's/ .*//'
}
cqcmd() {
    condor_q -nobatch $@ \| rg '^\d' \| fzf -m \| sed -e 's/^.*+[0-9][0-9]:[0-9][0-9]:[0-9][0-9]//'
}
cqsa() {
    condor_q -all -nobatch $@ \| rg '^\d' \| fzf
}

cqba() {
    if [ $# -eq 0 ]
    then
        condor_q -better-analyze  $(condor_q -nobatch \| rg '^\d' \| fzf -m \| sed -e 's/^ \+//' -e 's/ .*//') \| bat --style=numbers,grid
    else
        condor_q -better-analyze $@ \| bat --style=numbers,grid
    fi
}

cr() {
    if [ $# -eq 0 ]
    then
        condor_rm $(condor_q -nobatch \| rg '^\d' \| fzf -m \| sed -e 's/^ \+//' -e 's/ .*//')
    else
        condor_rm $@
    fi
}
crc() {
    condor_rm $(condor_q \\| fzf -m | sed -e 's/^ \+//' -e 's/ .*//')
}
alias cst='on_highwind condor_status'
alias cs='on_highwind condor_submit'
alias pssh='parallel-ssh -h ~/hosts -i'

cqrbm() {
    if [ $# -eq 0 ]
    then
        condor_q -run -long \| rg -e '^ClusterId' -e 'RemoteHost' \> cqrbm.tmp
        sed cqrbm.tmp -e 's/ClusterId = //' -e 's/RemoteHost = /  /' -e 's/".*@//' -e 's/\..*//'
    else
        condor_q -all -run -long \| rg -e '^ClusterId' -e 'RemoteHost' -e '^User\ \=\ ' \> cqrbm.tmp
        if [ $1 = 'all' ]
        then
            sed cqrbm.tmp -e 's/ClusterId = //' -e 's/RemoteHost = / /' -e 's/User = /  /' -e 's/"//' -e 's/slot.*@//' -e 's/@.*//' -e 's/\..*//'
        else
            rg cqrbm.tmp -e $1 -C 1 --context-separator '' | sed -e 's/ClusterId = //' -e 's/RemoteHost = /  /' -e 's/User = /  /' -e 's/"//' -e 's/slot.*@//' -e 's/@.*//' -e 's/\..*//'
        fi
    fi
    rm -f cqrbm.tmp
}

if (( ${+_CONDOR_SLOT_NAME} )); then
    echo "Running in a condor slot"
else
    if [ -z "$TMUX" ]; then
        if [ $(hostname) = 'highwind' -o $(hostname) = 'dreadnought' -o $(hostname) = 'ragnarok' ]; then
            tmux attach -t TMUX || tmux new -s TMUX
        fi
    fi
fi

export PATH=/home/josers2/.ruby/bin:/home/josers2/anaconda3/bin:$PATH
export GEM_HOME=/home/josers2/.ruby

# args: name url
setup-push() {
    if [ $# -eq 1 ]
    then
        remote=$(git remote show | rg Fetch | sed -e 's|.* ||')
        parallel-ssh -h ~/hosts -i "mkdir -p /scratch/jose/.repos/$1;
        cd /scratch/jose/.repos/$1;
        git init --bare;
        echo \#\!/bin/sh > hooks/post-receive;
        echo GIT_WORK_TREE=/scratch/jose/$1 git checkout -f > hooks/post-receive;
        chmod +x hooks/post-receive;
        mkdir -p /scratch/jose/$1"
        git remote add fpsg $remote
        git remote add test_machines $remote
        git remote add run_machines $remote
        git remote set-url --add --push fpsg odin:/scratch/jose/.repos/$1
        git remote set-url --add --push fpsg midgar:/scratch/jose/.repos/$1
        git remote set-url --add --push fpsg bahamut:/scratch/jose/.repos/$1
        git remote set-url --add --push fpsg weapon:/scratch/jose/.repos/$1
        git remote set-url --add --push run_machines midgar:/scratch/jose/.repos/$1
        git remote set-url --add --push run_machines bahamut:/scratch/jose/.repos/$1
        git remote set-url --add --push run_machines odin:/scratch/jose/.repos/$1
        git remote set-url --add --push test_machines weapon:/scratch/jose/.repos/$1
        git push fpsg +master:refs/heads/master

    # setup on fpsg
    elif [ $# -eq 2 ]
    then
        parallel-ssh -h ~/hosts -i "mkdir -p /scratch/jose/.repos/$1;
        cd /scratch/jose/.repos/$1;
        git init --bare;
        echo \#\!/bin/sh > hooks/post-receive;
        echo GIT_WORK_TREE=/scratch/jose/$1 git checkout -f > hooks/post-receive;
        chmod +x hooks/post-receive;
        mkdir -p /scratch/jose/$1"
        git remote add fpsg $2
        git remote add test_machines $2
        git remote add run_machines $2
        git remote set-url --add --push fpsg midgar:/scratch/jose/.repos/$1
        git remote set-url --add --push fpsg weapon:/scratch/jose/.repos/$1
        git remote set-url --add --push fpsg bahamut:/scratch/jose/.repos/$1
        git remote set-url --add --push fpsg odin:/scratch/jose/.repos/$1
        git remote set-url --add --push run_machines midgar:/scratch/jose/.repos/$1
        git remote set-url --add --push run_machines bahamut:/scratch/jose/.repos/$1
        git remote set-url --add --push run_machines odin:/scratch/jose/.repos/$1
        git remote set-url --add --push test_machines weapon:/scratch/jose/.repos/$1
        git push fpsg +master:refs/heads/master

    # setup on a target machine
    elif [ $# -eq 3 ]
    then
        ssh $3 -t "mkdir -p $(HOME)/.repos/$1;
        cd $(HOME)/.repos/$1;
        git init --bare;
        echo \#\!/bin/sh > hooks/post-receive;
        echo GIT_WORK_TREE=$(HOME)/$1 git checkout -f > hooks/post-receive;
        chmod +x hooks/post-receive;
        mkdir -p $(HOME)/$1"
        git remote add $3 $2
        git remote set-url --add --push $3 $3:$(HOME)/.repos/$1
        git push $3 +master:refs/heads/master

    # fail
    else
        echo "Arguments are: remote_name remote_url [target machine]"
    fi
}

cdd() {
    if [ $# -eq 0 ]
    then
        cd $(echo $(d | fzf) | sed -e 's|[0-9]\+\s*||' -e 's|~|/home/josers2|')
    else
        cd $1
    fi
}

DISABLE_UNTRACKED_FILES_DIRTY="true"

alias sgx_source='source /scratch/sgx/sgxsdk/environment'

# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/josers2/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/josers2/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/josers2/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/josers2/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<

# zprof
