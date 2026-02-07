-- フォーマッター設定
return {
  "stevearc/conform.nvim",
  opts = {
    -- 各言語のフォーマッター設定
    formatters_by_ft = {
      markdown = { "prettier" },
      -- 他の言語のフォーマッターもここに追加可能
      -- lua = { "stylua" },
      -- javascript = { "prettier" },
      -- typescript = { "prettier" },
    },
  },
}
