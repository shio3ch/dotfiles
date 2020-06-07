# dotfiles

My dotfiles.

```shell
cd ~
git clone https://github.com/shio3ch/dotfiles.git
```

## mac

### vim
1. Make symbolic link to `.vimrc` file.
   ```shell
   ln -s ~/dotfiles/mac/vim/.vimrc ~/.vimrc
   ```
2. Make symbolic link to `.vim` direcotry.
   ```shell
   ln -s ~/dotfiles/mac/vim/.vim ~/.vim
   ```
3. deinプラグインの有効化
   ```shell
   vim
   ```
   ```vim
   :call dein#install()
   ```

### zsh
1. Make symbolic link to `.zshrc` file.
   ```shell
   ln -s ~/dotfiles/mac/zsh/.zshrc ~/.zshrc
   ```
2. Make symbolic link to `.zsh` direcotry.
   ```shell
   ln -s ~/dotfiles/mac/zsh ~/.zsh
   ```

