return {
  -- Disabled mini.tabline (keeping for reference)
  { "nvim-mini/mini.tabline", enabled = false },

  {
    "akinsho/bufferline.nvim",
    enabled = false,
    opts = {
      options = {
        indicator = { style = "underline" },
        separator_style = { "", "" },
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return icon .. count
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Explorer",
            text_align = "center",
            separator = true,
          },
        },
        hover = { enabled = true, delay = 150, reveal = { "close" } },
        show_buffer_close_icons = false,
        show_close_icon = false,
        color_icons = true,
      },
    },
  },
}
