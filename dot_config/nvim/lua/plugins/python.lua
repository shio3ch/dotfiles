return {
  {
    "Vigemus/iron.nvim",
    ft = { "python" },
    keys = {
      { "<leader>ri", "<cmd>IronRepl<cr>",        desc = "REPL を開く" },
      { "<leader>rr", "<cmd>IronRestart<cr>",     desc = "REPL を再起動" },
      { "<leader>rf", "<cmd>IronFocus<cr>",       desc = "REPL にフォーカス" },
      { "<leader>rh", "<cmd>IronHide<cr>",        desc = "REPL を隠す" },
      { "<leader>rs", "<Plug>(iron-send-line)",   desc = "現在行を送信" },
      { "<leader>rs", "<Plug>(iron-visual-send)", mode = "v", desc = "選択範囲を送信" },
      { "<leader>rc", "<Plug>(iron-clear)",       desc = "REPL をクリア" },
      { "<leader>rq", "<Plug>(iron-interrupt)",   desc = "REPL を中断" },
    },
    config = function()
      require("iron.core").setup({
        config = {
          scratch_repl = true,
          repl_definition = {
            python = {
              command = { "python3" },
            },
          },
          repl_open_cmd = require("iron.view").split.vertical.botright(0.4),
        },
        highlight = { italic = true },
        ignore_blank_lines = true,
      })
    end,
  },
}
