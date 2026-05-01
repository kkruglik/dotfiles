return {
  {
    "mfussenegger/nvim-dap-python",
    build = false,
    rocks = { enabled = false },
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("dap-python").setup("python")
    end,
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()

      -- Make breakpoints more visible with better symbols and colors
      vim.fn.sign_define("DapBreakpoint", {
        text = "🔴",
        texthl = "DiagnosticError",
        linehl = "DapBreakpointLine",
        numhl = "DiagnosticError",
      })

      vim.fn.sign_define("DapBreakpointCondition", {
        text = "🟡",
        texthl = "DiagnosticWarn",
        linehl = "DapBreakpointLine",
        numhl = "DiagnosticWarn",
      })

      vim.fn.sign_define("DapStopped", {
        text = "➤",
        texthl = "DiagnosticInfo",
        linehl = "DapStoppedLine",
        numhl = "DiagnosticInfo",
      })

      -- Define highlight groups for better visibility
      vim.api.nvim_set_hl(0, "DapBreakpointLine", { bg = "#3c1e1e" })
      vim.api.nvim_set_hl(0, "DapStoppedLine", { bg = "#1e3c3c" })

      -- Auto open/close dap-ui
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- Better debug keymaps - function keys like most IDEs
      vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Continue" })
      vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debug: Step Over" })
      vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debug: Step Into" })
      vim.keymap.set("n", "<S-F11>", dap.step_out, { desc = "Debug: Step Out" })
      vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>B", function()
        dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end, { desc = "Debug: Conditional Breakpoint" })

      -- Python debug configurations
      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Run Current File",
          program = "${file}",
          console = "internalConsole",
          cwd = "${workspaceFolder}",
        },
        {
          type = "python",
          request = "launch",
          name = "Run with Arguments",
          program = "${file}",
          console = "integratedTerminal",
          cwd = "${workspaceFolder}",
          args = function()
            local args_string = vim.fn.input("Arguments: ")
            return vim.split(args_string, " ")
          end,
        },
        {
          type = "python",
          request = "launch",
          name = "Run main.py",
          program = "${workspaceFolder}/main.py",
          console = "integratedTerminal",
          cwd = "${workspaceFolder}",
        },
        {
          type = "python",
          request = "launch",
          name = "Run as Module",
          module = function()
            return vim.fn.input("Module name: ")
          end,
          console = "integratedTerminal",
          cwd = "${workspaceFolder}",
        },
        {
          type = "python",
          request = "launch",
          name = "Run All Tests",
          module = "pytest",
          args = { "-v" },
          console = "integratedTerminal",
          cwd = "${workspaceFolder}",
        },
        {
          type = "python",
          request = "launch",
          name = "Run Current Test File",
          module = "pytest",
          args = { "${file}", "-v" },
          console = "integratedTerminal",
          cwd = "${workspaceFolder}",
        },
      }
    end,
  },
}
