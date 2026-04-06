# brew wrapper - 変更時に自動でBrewfile更新
brew() {
  command brew "$@"
  local result=$?

  case "$1" in
    install|uninstall|remove|upgrade)
      local dotfiles_dir
      dotfiles_dir="$(chezmoi source-path)"
      echo "Updating Brewfile..."
      command brew bundle dump --force --file="$dotfiles_dir/Brewfile"

      if ! git -C "$dotfiles_dir" diff --quiet Brewfile 2>/dev/null; then
        git -C "$dotfiles_dir" add Brewfile
        git -C "$dotfiles_dir" commit -m "brew: auto-update Brewfile"
      fi
      ;;
  esac

  return $result
}
