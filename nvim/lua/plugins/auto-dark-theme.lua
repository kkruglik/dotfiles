return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {
      style = "storm", -- Default dark style
      light_style = "day", -- Light variant
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
