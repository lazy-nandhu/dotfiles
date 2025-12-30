# Lines configured by zsh-newuser-install
PS1="%~ > "
HISTFILE=~/.cache/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
setopt auto_param_slash
unsetopt beep nomatch notify
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/nandhu/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#
alias ff="fastfetch --logo ~/sakura.png --logo-type kitty-direct --logo-width 35"
#alias fastfetch="fastfetch --logo arch_small --logo-padding 6 --logo-padding-top 3 --logo-padding-left 4"
alias ls="lsd"
alias chwal="python $HOME/.config/mango/scripts/wallpaper.py"
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
