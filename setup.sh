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

# the ssh config is in a different place
echo "$CURRENT_DIR/.ssh-config -> $HOME/.ssh/config"
ln -s "$CURRENT_DIR/.ssh-config" "$HOME/.ssh/config"

echo "$CURRENT_DIR/config/kitty.conf -> $HOME/.config/kitty/kitty.conf"
ln -is "$CURRENT_DIR/config/kitty.conf" "$HOME/.config/kitty/kitty.conf"

