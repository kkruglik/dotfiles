return {
  "nvim-lualine/lualine.nvim",
  enabled = true,
  opts = {
    options = {
      section_separators = { left = "", right = "" },
      component_separators = { left = "│", right = "│" },
    },
sections = {
      lualine_b = {
        { "branch", color = "lualine_b_normal" },
        { "diff", color = "lualine_b_normal" },
      },
      lualine_a = {
        "mode",
        {
          function()
            local reg = vim.fn.reg_recording()
            if reg ~= "" then
              return "recording @" .. reg
            end
            return ""
          end,
          color = { fg = "#ff9e64" },
        },
      },
      lualine_c = {
        {
          "filename",
          path = 1,
          symbols = {
            modified = " ●",
            readonly = " [-]",
            unnamed = "[No Name]",
          },
        },
      },
      lualine_x = {
        {
          "diagnostics",
          symbols = { error = "E ", warn = "W ", info = "I ", hint = "H " },
        },
        "filetype",
      },
      lualine_z = {
        "searchcount",
        "location",
      },
    },
  },
}
