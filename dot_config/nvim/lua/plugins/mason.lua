-- Mason設定：フォーマッターとLSPの自動インストール
return {
  "mason-org/mason.nvim",
  opts = {
    ensure_installed = {
      "prettier",
      "stylua",
      "typescript-language-server",
      "eslint-lsp",
    },
  },
}
