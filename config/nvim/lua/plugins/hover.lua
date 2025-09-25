return {
  "lewis6991/hover.nvim",
  event = "LspAttach",
  opts = {
    init = function()
      -- Load multiple hover providers with LSP first, then fallbacks
      require("hover.providers.lsp")
      require("hover.providers.man")
      require("hover.providers.dictionary")
    end,
    preview_opts = {
      border = "rounded",
    },
    title = true,
  },
  config = function(_, opts)
    require("hover").setup(opts)
    -- Extra key to cycle providers manually
    vim.keymap.set("n", "gK", function() require("hover").hover_select() end, { desc = "Hover (Select Provider)" })
  end,
}
