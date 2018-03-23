
### Added by Zplugin's installer
source '/home/wicast/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk
zplugin load psprint zsh-navigation-tools
# zplugin ice from"notabug" atload"echo loaded zui" if"(( 1 ))"
zplugin load zdharma/zui
zplugin load zsh-users/zsh-autosuggestions
zplugin light zsh-users/zsh-syntax-highlighting
zplugin load zsh-users/zsh-completions

# oh-my-zsh

zplugin snippet 'http://github.com/robbyrussell/oh-my-zsh/raw/master/lib/git.zsh'
zplugin snippet 'https://github.com/robbyrussell/oh-my-zsh/raw/master/plugins/git/git.plugin.zsh'
zplugin snippet 'https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/history.zsh'
zplugin snippet 'https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/directories.zsh'
zplugin snippet 'https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/completion.zsh'
zplugin snippet 'https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/correction.zsh'
zplugin snippet 'https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/theme-and-appearance.zsh'
# zplugin snippet 'https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/misc.zsh'
zplugin snippet 'https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/compfix.zsh'
zplugin snippet 'https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/functions.zsh'

zplugin light bhilburn/powerlevel9k
# zplugin light denysdovhan/spaceship-zsh-theme
# zplugin light skylerlee/zeta-zsh-theme
# zplugin light zakaziko99/agnosterzak-ohmyzsh-theme
# zplugin snippet 'https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/dstufft.zsh-theme'

autoload -Uz compinit
compinit

setopt promptsubst
# powerlevel9k
zsh_wifi_signal(){
    local signal=$(nmcli device wifi | grep yes | awk '{print $8}')
    local color='%F{yellow}'
    [[ $signal -gt 75 ]] && color='%F{green}'
    [[ $signal -lt 50 ]] && color='%F{red}'
    echo -n "%{$color%}\uf230  $signal%{%f%}" # \uf230 is 
}

POWERLEVEL9K_CUSTOM_WIFI_SIGNAL="zsh_wifi_signal"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context battery dir vcs virtualenv newline)


if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -e 'puts Gem.user_dir')/bin:$PATH"
fi


# key bindings
bindkey "e[1~" beginning-of-line
bindkey "e[4~" end-of-line
bindkey "e[5~" beginning-of-history
bindkey "e[6~" end-of-history
bindkey "e[3~" delete-char
bindkey "e[2~" quoted-insert
bindkey "e[5C" forward-word
bindkey "eOc" emacs-forward-word
bindkey "e[5D" backward-word
bindkey "eOd" emacs-backward-word
bindkey "ee[C" forward-word
bindkey "ee[D" backward-word
bindkey "^H" backward-delete-word
# for rxvt
bindkey "e[8~" end-of-line
bindkey "e[7~" beginning-of-line
# for non RH/Debian xterm, can't hurt for RH/DEbian xterm
bindkey "eOH" beginning-of-line
bindkey "eOF" end-of-line
# for freebsd console
bindkey "e[H" beginning-of-line
bindkey "e[F" end-of-line
# completion in the middle of a line
bindkey '^i' expand-or-complete-prefix
