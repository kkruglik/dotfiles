return {
  "folke/snacks.nvim",
  opts = {
    explorer = {
      replace_netrw = true,
    },
    words = { enabled = true },
    scroll = { enabled = true },
    indent = { enabled = true },
    dashboard = { enabled = true },
    notifier = { enabled = true },
    picker = {
      matcher = {
        frecency = true,
      },
      win = {
        list = {
          keys = {
            ["J"] = { "preview_scroll_down", mode = { "n" } },
            ["K"] = { "preview_scroll_up", mode = { "n" } },
          },
        },
        preview = {
          wo = { wrap = true },
        },
      },
      sources = {
        buffers = {
          focus = "list",
        },
        explorer = {
          layout = { layout = { position = "right" } },
        },
        lsp_symbols = {
          filter = {
            rust = true,
          },
        },
      },
    },
  },
  keys = {
    {
      "<leader>e",
      function()
        Snacks.explorer()
      end,
      desc = "Toggle Explorer",
    },
  },
}
