# Setup script to symlink dotfiles

CURRENT_DIR=$(pwd)

for f in .bashrc \
         .bash_profile \
         .gitconfig \
         .gitignore_global \
         .git-completion.bash \
         .hushlogin \
         .vimr \
         .zshrc
do
  printf '\n'
  echo "$CURRENT_DIR/$f -> $HOME/$f"
  ln -s "$CURRENT_DIR/$f" "$HOME/$f"
done

echo "$CURRENT_DIR/config/kitty.conf -> $HOME/.config/kitty/kitty.conf"
ln -is "$CURRENT_DIR/config/kitty.conf" "$HOME/.config/kitty/kitty.conf"

