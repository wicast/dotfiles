#source ~/.bash_profile

if [ ! -f ~/.zplug/init.zsh ]; then
	source /usr/share/zsh/scripts/zplug/init.zsh
else	source ~/.zplug/init.zsh
fi


zplug "zsh-users/zsh-history-substring-search"

zplug "robbyrussell/oh-my-zsh"

zplug "lib/directories", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug "lib/functions", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "lib/correction", from:oh-my-zsh
zplug "lib/compfix", from:oh-my-zsh
zplug "lib/misc", from:oh-my-zsh
zplug "lib/theme-and-apperance", from:oh-my-zsh

zplug "plugins/git", from:oh-my-zsh
zplug "plugins/adb", from:oh-my-zsh
zplug "plugins/tig", from:oh-my-zsh
zplug "plugins/spring", from:oh-my-zsh
zplug "plugins/autojump", from:oh-my-zsh
zplug "plugins/zsh-navigation-tools",  from:oh-my-zsh


setopt prompt_subst
zplug "caiogondim/bullet-train-oh-my-zsh-theme",  as:theme



if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
#zplug load --verbose
zplug load

setopt auto_cd

alias ls='ls --color=auto'

###-tns-completion-start-###
if [ -f /home/wicast/.tnsrc ]; then 
    source /home/wicast/.tnsrc 
fi
###-tns-completion-end-###

if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi
