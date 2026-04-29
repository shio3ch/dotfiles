-- フォーマッター設定
return {
  "stevearc/conform.nvim",
  opts = {
    -- 各言語のフォーマッター設定
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_format" },
      markdown = { "prettier" },
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier" },
      jsonc = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
    },
  },
}
