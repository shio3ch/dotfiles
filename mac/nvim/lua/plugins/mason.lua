-- Mason設定：フォーマッターとLSPの自動インストール
return {
  "mason-org/mason.nvim",
  opts = {
    ensure_installed = {
      -- Markdownフォーマッター
      "prettier",
    },
  },
}
