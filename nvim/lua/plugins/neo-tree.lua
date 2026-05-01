return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = false,
  opts = {
    source_selector = {
      winbar = true,
      statusline = false,
      sources = {
        { source = "filesystem", display_name = " 󰙅 Files" },
        { source = "buffers", display_name = "  Buffers" },
        { source = "git_status", display_name = " 󰊢 Git" },
        { source = "document_symbols", display_name = " 󰘦 Symblols" },
      },
      content_layout = "center",
      tabs_layout = "equal",
      separator = { left = "▏", right = "▕" },
    },
    sources = {
      "filesystem",
      "buffers",
      "git_status",
      "document_symbols",
    },
    filesystem = {
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
      bind_to_cwd = true,
      cwd_target = {
        sidebar = "global",
        current = "global",
      },
    },
    window = {
      position = "right",
      width = 35,
    },
  },
  keys = {
    -- Use toggle with reveal_force_cwd
    {
      "<leader>e",
      "<cmd>Neotree toggle reveal_force_cwd<cr>",
      desc = "Toggle Neo-tree",
    },
  },
}
