return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    "nvim-telescope/telescope-ui-select.nvim",
  },
  keys = {
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files({ hidden = true })
      end,
      desc = "Find Files",
    },
    {
      "<leader>fg",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Live Grep",
    },
    {
      "<leader>fb",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "Find Buffers",
    },
    {
      "<leader>fh",
      function()
        require("telescope.builtin").help_tags()
      end,
      desc = "Help Tags",
    },
    {
      "<leader>fr",
      function()
        require("telescope.builtin").oldfiles()
      end,
      desc = "Recent Files",
    },
    {
      "<leader>fs",
      function()
        require("telescope.builtin").lsp_document_symbols()
      end,
      desc = "Document Symbols",
    },
    {
      "<leader>fd",
      function()
        require("telescope.builtin").diagnostics()
      end,
      desc = "Diagnostics",
    },
    {
      "<leader>gc",
      function()
        require("telescope.builtin").git_commits()
      end,
      desc = "Git Commits",
    },
    {
      "<leader>gs",
      function()
        require("telescope.builtin").git_status()
      end,
      desc = "Git Status",
    },
  },
  opts = function(_, opts)
    local actions = require("telescope.actions")

    opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
      path_display = { "smart" },
      file_ignore_patterns = { "node_modules/", ".git/", "%.lock" },
      mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        },
      },
    })
    opts.extensions = opts.extensions or {}
    opts.extensions["ui-select"] = require("telescope.themes").get_dropdown({})
  end,
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    telescope.load_extension("fzf")
    telescope.load_extension("ui-select")
  end,
}
