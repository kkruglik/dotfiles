local wezterm = require("wezterm")

local function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return "Dark"
end

local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return {
			color_scheme = "Catppuccin Mocha",
			window_frame = {
				active_titlebar_bg = "#1e1e2e", -- Catppuccin Mocha base
				inactive_titlebar_bg = "#1e1e2e", -- Same for consistency
			},
			colors = {
				tab_bar = {
					background = "#1e1e2e",
					active_tab = {
						bg_color = "#cba6f7", -- Catppuccin Mocha mauve
						fg_color = "#1e1e2e",
					},
					inactive_tab = {
						bg_color = "#313244", -- Catppuccin Mocha surface0
						fg_color = "#cdd6f4", -- Catppuccin Mocha text
					},
					inactive_tab_hover = {
						bg_color = "#45475a", -- Catppuccin Mocha surface1
						fg_color = "#cdd6f4",
					},
					new_tab = {
						bg_color = "#313244",
						fg_color = "#cdd6f4",
					},
					new_tab_hover = {
						bg_color = "#45475a",
						fg_color = "#cdd6f4",
					},
				},
			},
		}
	else
		return {
			color_scheme = "Catppuccin Latte",
			window_frame = {
				active_titlebar_bg = "#eff1f5", -- Catppuccin Latte base
				inactive_titlebar_bg = "#eff1f5", -- Same for consistency
			},
			colors = {
				tab_bar = {
					background = "#eff1f5",
					active_tab = {
						bg_color = "#8839ef", -- Catppuccin Latte mauve
						fg_color = "#eff1f5",
					},
					inactive_tab = {
						bg_color = "#e6e9ef", -- Catppuccin Latte mantle
						fg_color = "#4c4f69", -- Catppuccin Latte text
					},
					inactive_tab_hover = {
						bg_color = "#dce0e8", -- Catppuccin Latte crust
						fg_color = "#4c4f69",
					},
					new_tab = {
						bg_color = "#e6e9ef",
						fg_color = "#4c4f69",
					},
					new_tab_hover = {
						bg_color = "#dce0e8",
						fg_color = "#4c4f69",
					},
				},
			},
		}
	end
end

local theme_config = scheme_for_appearance(get_appearance())

return {
	color_scheme = theme_config.color_scheme,
	window_frame = theme_config.window_frame,
	colors = theme_config.colors,

	-- Font configuration
	font = wezterm.font("JetBrains Mono"),
	font_size = 17,
	line_height = 1.2,

	-- Window splitting and navigation keybindings
	keys = {
		-- Split panes
		{ key = "d", mods = "CMD", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "d", mods = "CMD|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },

		-- Navigate panes (using vim-style with Cmd+Ctrl to avoid conflicts)
		{ key = "h", mods = "CMD|CTRL", action = wezterm.action.ActivatePaneDirection("Left") },
		{ key = "l", mods = "CMD|CTRL", action = wezterm.action.ActivatePaneDirection("Right") },
		{ key = "k", mods = "CMD|CTRL", action = wezterm.action.ActivatePaneDirection("Up") },
		{ key = "j", mods = "CMD|CTRL", action = wezterm.action.ActivatePaneDirection("Down") },

		-- Close pane
		{ key = "w", mods = "CMD|SHIFT", action = wezterm.action.CloseCurrentPane({ confirm = true }) },

		-- Resize panes (using vim-style with Cmd+Shift)
		{ key = "h", mods = "CMD|SHIFT", action = wezterm.action.AdjustPaneSize({ "Left", 5 }) },
		{ key = "l", mods = "CMD|SHIFT", action = wezterm.action.AdjustPaneSize({ "Right", 5 }) },
		{ key = "k", mods = "CMD|SHIFT", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
		{ key = "j", mods = "CMD|SHIFT", action = wezterm.action.AdjustPaneSize({ "Down", 5 }) },
	},

	-- General settings
	automatically_reload_config = true,
	window_close_confirmation = "NeverPrompt",
	hide_tab_bar_if_only_one_tab = true,
	window_padding = {
		left = 20,
		right = 20,
		top = 20,
		bottom = 20,
	},
}
