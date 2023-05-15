#!/bin/bash

PURPLE="\033[0;35m"
CYAN="\033[0;36m"
GREEN="\033[0;32m"
NOCOLOR="\033[0m"

TIME=$(date +%m-%d-%Y_%H-%M-%S)
DOT_DIR="$HOME/osx-dotfiles"
BAK_DEST_DIR="$DOT_DIR/.bak/$TIME"
BAK_LATEST_DIR="$DOT_DIR/.bak/latest"

mkdir -p $BAK_DEST_DIR
unlink $BAK_LATEST_DIR
ln -sf $BAK_DEST_DIR $BAK_LATEST_DIR

# backup primary files
backup_primary_file_now () {
  #echo -ne "${CYAN}$1${NOCOLOR} backuped "
  echo -ne "${CYAN}$1${NOCOLOR} -> "
  cp -l "$1" $BAK_DEST_DIR 2>/dev/null
  rm $1
}

primaryFiles=( \
  .bash_aliases \
  .bashrc \
  .editorconfig \
  .gitconfig \
  .gitignore_global \
  .bash_profile \
  .zshrc \
)

echo Backup then symlink files
for i in ${!primaryFiles[@]};
do
  # echo ---
  # bak it up
  [ -f $HOME/${primaryFiles[$i]} ] && backup_primary_file_now $HOME/${primaryFiles[$i]}
  # symlink it
  ln -sf $DOT_DIR/primaries/${primaryFiles[$i]} $HOME/${primaryFiles[$i]}
  echo -e " ${PURPLE}$(ls -l $HOME/${primaryFiles[$i]} | sed -e 's/.* \///')${NOCOLOR}"
done
echo -e ${GREEN}DONE${NOCOLOR}
