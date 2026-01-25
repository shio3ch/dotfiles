# brew wrapper - 変更時に自動でBrewfile更新
brew() {
  command brew "$@"
  local result=$?

  case "$1" in
    install|uninstall|remove|upgrade)
      echo "Updating Brewfile..."
      command brew bundle dump --force --file=~/workspace/dotfiles/mac/brew/Brewfile

      if ! git -C ~/workspace/dotfiles diff --quiet mac/brew/Brewfile 2>/dev/null; then
        git -C ~/workspace/dotfiles add mac/brew/Brewfile
        git -C ~/workspace/dotfiles commit -m "brew: auto-update Brewfile"
      fi
      ;;
  esac

  return $result
}
