# Setup script to symlink dotfiles

CURRENT_DIR=$(pwd)

for f in .bash_profile \
         .gitconfig \
         .gitignore_global \
         .git-completion.bash \
         .vimrc
do
  printf '\n'
  echo "$CURRENT_DIR/$f -> $HOME/$f"
  ln -s "$CURRENT_DIR/$f" "$HOME/$f"
done