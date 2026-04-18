-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Multi-language run commands under <leader>r
local function run_terminal(cmd)
  local ok, snacks = pcall(require, "snacks")
  if not ok or not snacks.terminal then
    vim.notify("Snacks terminal not available", vim.log.levels.ERROR)
    return
  end

  local cwd = vim.fn.getcwd()
  if LazyVim and LazyVim.root then
    cwd = LazyVim.root()
  end

  snacks.terminal.open(cmd, {
    cwd = cwd,
    interactive = false,
    auto_close = false,
    win = {
      position = "bottom",
      height = 0.4,
    },
  })
end

-- Quick run (most common use case)
map("n", "<leader>rr", function()
  vim.cmd("w")
  local ft = vim.bo.filetype
  local cmd

  if ft == "python" then
    cmd = "python " .. vim.fn.expand("%")
  elseif ft == "rust" then
    cmd = "cargo run"
  else
    vim.notify("No run command for filetype: " .. ft, vim.log.levels.WARN)
    return
  end

  run_terminal(cmd)
end, { desc = "Run current file" })

-- Run with arguments
map("n", "<leader>ra", function()
  local ft = vim.bo.filetype
  local args = vim.fn.input("Arguments: ")
  vim.cmd("w")
  local cmd

  if ft == "python" then
    if args ~= "" then
      cmd = "python " .. vim.fn.expand("%") .. " " .. args
    else
      cmd = "python " .. vim.fn.expand("%")
    end
  elseif ft == "rust" then
    if args ~= "" then
      cmd = "cargo run -- " .. args
    else
      cmd = "cargo run"
    end
  else
    vim.notify("No run command for filetype: " .. ft, vim.log.levels.WARN)
    return
  end

  run_terminal(cmd)
end, { desc = "Run with arguments" })

-- Run tests
map("n", "<leader>rt", function()
  local ft = vim.bo.filetype
  local cmd

  if ft == "python" then
    cmd = "python -m pytest " .. vim.fn.expand("%")
  elseif ft == "rust" then
    cmd = "cargo test"
  else
    vim.notify("No test command for filetype: " .. ft, vim.log.levels.WARN)
    return
  end

  run_terminal(cmd)
end, { desc = "Run current test file" })

-- Run all tests
map("n", "<leader>rT", function()
  local ft = vim.bo.filetype
  local cmd

  if ft == "python" then
    cmd = "python -m pytest"
  elseif ft == "rust" then
    cmd = "cargo test"
  else
    vim.notify("No test command for filetype: " .. ft, vim.log.levels.WARN)
    return
  end

  run_terminal(cmd)
end, { desc = "Run all tests" })

-- Build/Check
map("n", "<leader>rb", function()
  local ft = vim.bo.filetype
  local cmd

  if ft == "python" then
    -- Python doesn't have build step, just run linting
    cmd = "python -m flake8 " .. vim.fn.expand("%")
  elseif ft == "rust" then
    cmd = "cargo build"
  else
    vim.notify("No build command for filetype: " .. ft, vim.log.levels.WARN)
    return
  end

  run_terminal(cmd)
end, { desc = "Build/Check" })

-- Release build/run
map("n", "<leader>rR", function()
  local ft = vim.bo.filetype
  local cmd

  if ft == "python" then
    -- Python doesn't have release mode, just run with optimization
    cmd = "python -O " .. vim.fn.expand("%")
  elseif ft == "rust" then
    cmd = "cargo run --release"
  else
    vim.notify("No release command for filetype: " .. ft, vim.log.levels.WARN)
    return
  end

  run_terminal(cmd)
end, { desc = "Run release" })

-- Choose from run configurations
map("n", "<leader>rc", function()
  local ft = vim.bo.filetype
  local choices = {}

  if ft == "python" then
    choices = {
      "Run Current File",
      "Run with Arguments",
      "Run All Tests",
      "Run Current Test File",
      "Run as Module",
      "Check with flake8",
    }
  elseif ft == "rust" then
    choices = {
      "Run",
      "Run with Arguments",
      "Run Tests",
      "Build",
      "Build Release",
      "Run Release",
      "Check",
    }
  else
    vim.notify("No configurations for filetype: " .. ft, vim.log.levels.WARN)
    return
  end

  vim.ui.select(choices, { prompt = "Select run configuration:" }, function(choice)
    if not choice then
      return
    end

    local cmd
    vim.cmd("w")

    if ft == "python" then
      if choice == "Run Current File" then
        cmd = "python " .. vim.fn.expand("%")
      elseif choice == "Run with Arguments" then
        local args = vim.fn.input("Arguments: ")
        cmd = "python " .. vim.fn.expand("%") .. " " .. args
      elseif choice == "Run All Tests" then
        cmd = "python -m pytest"
      elseif choice == "Run Current Test File" then
        cmd = "python -m pytest " .. vim.fn.expand("%")
      elseif choice == "Run as Module" then
        local module = vim.fn.input("Module name: ")
        if module ~= "" then
          cmd = "python -m " .. module
        end
      elseif choice == "Check with flake8" then
        cmd = "python -m flake8 " .. vim.fn.expand("%")
      end
    elseif ft == "rust" then
      if choice == "Run" then
        cmd = "cargo run"
      elseif choice == "Run with Arguments" then
        local args = vim.fn.input("Arguments: ")
        cmd = args ~= "" and "cargo run -- " .. args or "cargo run"
      elseif choice == "Run Tests" then
        cmd = "cargo test"
      elseif choice == "Build" then
        cmd = "cargo build"
      elseif choice == "Build Release" then
        cmd = "cargo build --release"
      elseif choice == "Run Release" then
        cmd = "cargo run --release"
      elseif choice == "Check" then
        cmd = "cargo check"
      end
    end

    if cmd then
      run_terminal(cmd)
    end
  end)
end, { desc = "Choose run configuration" })

local ok, wk = pcall(require, "which-key")
if ok then
  wk.add({
    { "<leader>r", group = "Run" },
  })
end

vim.keymap.set("n", "<leader>or", "<cmd>OverseerRun<cr>", { desc = "Overseer Run" })
vim.keymap.set("n", "<leader>ot", "<cmd>OverseerToggle<cr>", { desc = "Overseer Toggle" })

if ok then
  wk.add({
    { "<leader>o", group = "Overseer" },
  })
end

-- Code actions
map("n", "<leader>ci", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })

-- Buffer management
map("n", "Q", "<cmd>bd<cr>", { desc = "Close buffer" })

-- Quickfix
map("n", "<leader>xC", "<cmd>cex []<cr>", { desc = "Clear quickfix list" })
