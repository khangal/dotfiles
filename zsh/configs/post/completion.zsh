# # load our own completion functions
# fpath=(~/.zsh/completion /usr/local/share/zsh/site-functions $fpath)
#
# # completion; use cache if updated within 24h
# autoload -Uz compinit
# setopt extendedglob
#
# if [[ -n $HOME/.zcompdump(#qN.mh+24) ]]; then
#   compinit -d $HOME/.zcompdump;
# else
#   compinit -C;
# fi;
#
# # disable zsh bundled function mtools command mcd
# # which causes a conflict.
# compdef -d mcd

fpath=(
  ~/.zsh/completion
  /usr/local/share/zsh/site-functions
  $fpath
)

autoload -Uz compinit
setopt extendedglob

# Use cache if dump is newer than 24h; otherwise rebuild
if [[ -n $HOME/.zcompdump(#qN.mh-24) ]]; then
  compinit -C -d $HOME/.zcompdump
else
  compinit -d $HOME/.zcompdump
fi

compdef -d mcd
