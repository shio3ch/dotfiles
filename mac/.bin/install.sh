#!/bin/bash
set -eu

output_help_message() {
  echo "Usage: $0 [--help | -h]" 0>&2
  echo ""
}

make_symbolic_link() {
  echo "make dotfile symbolic links.."
  DOTFILES_DIR=$(cd $(dirname $0);cd ../; pwd)
  
  # .vim
  ln -s ${DOTFILES_DIR}/vim/.vimrc ${HOME}/.vimrc
  ln -s ${DOTFILES_DIR}/vim/.vim ${HOME}/.vim

  # .zsh
  ln -s ${DOTFILES_DIR}/zsh/.zshrc ${HOME}/.zshrc
  ln -s ${DOTFILES_DIR}/zsh ${HOME}/.zsh

  echo "maked symbolic links!"
}

while [ $# -gt 0 ];do
  case ${1} in
    --debug|-d)
      set -eux
      ;;
    --help|-h)
      output_help_message
      exit 1
      ;;
    *)
      ;;
  esac
  shift
done

make_symbolic_link
exit 0
