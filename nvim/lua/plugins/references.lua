return {
  -- Inline reference counter (like PyCharm)
  {
    "VidocqH/lsp-lens.nvim",
    event = "LspAttach",
    config = function()
      require("lsp-lens").setup({
        -- Show reference counts inline
        enable = true,
        include_declaration = false, -- Don't count declarations
        sections = {
          definition = false, -- Only show references
          references = true,
          implementation = true,
        },
      })
    end,
  },
  {
    "dnlhc/glance.nvim",
    cmd = { "Glance" },
    keys = {
      { "gR", "<cmd>Glance references<cr>", desc = "References (Glance)" },
    },
    config = function()
      require("glance").setup({
        height = 18,
        border = {
          enable = true,
        },
        theme = {
          enable = true,
          mode = "auto", -- 'brighten'|'darken'|'auto'
        },
      })
    end,
  },
}
