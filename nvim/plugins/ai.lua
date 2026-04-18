return {
  {
    "supermaven-inc/supermaven-nvim",
    enabled = true,
    config = function()
      require("supermaven-nvim").setup({
        disable_inline_completion = true, -- disable auto-suggestions
        keymaps = {
          clear_suggestion = "<C-]>", -- clear with Ctrl+]
          accept_word = "<C-j>", -- accept next word with Ctrl+j
        },
      })
    end,
  },
}
