return {
  {
    "mrcjkb/rustaceanvim",
    opts = {
      server = {
        default_settings = {
          ["rust-analyzer"] = {
            check = {
              command = "clippy",
              extraArgs = { "--no-deps" },
            },
            procMacro = {
              enable = true,
            },
          },
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false,
        float = {
          border = "rounded",
          wrap = true,
          max_width = 80,
          source = "if_many",
        },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "E",
            [vim.diagnostic.severity.WARN] = "W",
            [vim.diagnostic.severity.INFO] = "I",
            [vim.diagnostic.severity.HINT] = "H",
          },
        },
      },
      servers = {
        pyright = {
          enabled = false,
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true,
                autoSearchPaths = true,
                autoImportCompletions = true,
              },
            },
          },
        },
        basedpyright = {
          enabled = false,
          settings = {
            basedpyright = {
              analysis = {
                typeCheckingMode = "basic",
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = false,
                autoSearchPaths = true,
                autoImportCompletions = true,
                importFormat = "relative",
              },
            },
          },
        },
        ruff = {},
        pylsp = { enabled = false },
        pyrefly = {
          enabled = false,
          settings = {},
        },
        ty = { enabled = true },
      },
    },
  },
}
