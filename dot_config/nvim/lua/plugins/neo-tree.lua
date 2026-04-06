return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- 隠しファイルを表示
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
  },
}
