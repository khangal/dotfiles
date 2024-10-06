MODE=${@: -1}
echo $MODE

if [[ $MODE == "dark" ]]; then
  echo "Switching to dark mode"

  sed -i 's/colors: \*dayfox/colors: \*nightfox/' ~/.config/alacritty/alacritty.yml
  tmux source ~/dotfiles/tmux/tmux.nightfox.local
  export VIM_COLORSCHEME=nightfox
  export BAT_THEME="base16"
elif [[ $MODE == "light" ]] then
  echo "Switching to light mode"

  sed -i 's/colors: \*nightfox/colors: \*dayfox/' ~/.config/alacritty/alacritty.yml
  tmux source ~/dotfiles/tmux/tmux.dayfox.local
  export VIM_COLORSCHEME=dayfox
  export BAT_THEME="Solarized (light)"
else
  echo "Unkown project"
fi
