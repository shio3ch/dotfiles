return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-jest",
      "marilari88/neotest-vitest",
    },
    opts = function(_, opts)
      vim.list_extend(opts.adapters, {
        require("neotest-jest")({
          jestCommand = "npx jest",
          jestConfigFile = function(file)
            local cwd = vim.fn.fnamemodify(file, ":p:h")
            for _, name in ipairs({ "jest.config.js", "jest.config.ts", "jest.config.mjs" }) do
              local path = cwd .. "/" .. name
              if vim.fn.filereadable(path) == 1 then
                return path
              end
            end
          end,
        }),
        require("neotest-vitest"),
      })
    end,
  },
}
