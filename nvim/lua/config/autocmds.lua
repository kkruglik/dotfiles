-- Final optimized version - minimal overhead
local theme_cache = { hour = nil, theme = nil }

local function update_time_theme()
  local hour = tonumber(os.date("%H"))

  if theme_cache.hour == hour then
    return
  end
  theme_cache.hour = hour

  local target = (hour >= 7 and hour < 18) and "light" or "dark"

  if theme_cache.theme ~= target then
    theme_cache.theme = target
    vim.schedule(function()
      vim.o.background = target
      vim.cmd("colorscheme tokyonight-" .. (target == "light" and "day" or "storm"))
    end)
  end
end

vim.fn.timer_start(3600000, update_time_theme, { ["repeat"] = -1 })
vim.api.nvim_create_autocmd("VimEnter", { callback = update_time_theme })
