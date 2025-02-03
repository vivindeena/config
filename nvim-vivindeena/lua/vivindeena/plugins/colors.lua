return {
	{
		"folke/tokyonight.nvim",
		-- priority = 1000,
		-- config = function()
		-- 	local transparent = false -- set to true if you would like to enable transparency
		--
		-- 	local bg = "#011628"
		-- 	local bg_dark = "#011423"
		-- 	local bg_highlight = "#143652"
		-- 	local bg_search = "#0A64AC"
		-- 	local bg_visual = "#275378"
		-- 	local fg = "#CBE0F0"
		-- 	local fg_dark = "#B4D0E9"
		-- 	local fg_gutter = "#627E97"
		-- 	local border = "#547998"
		--
		-- 	require("tokyonight").setup({
		-- 		style = "night",
		-- 		transparent = transparent,
		-- 		styles = {
		-- 			sidebars = transparent and "transparent" or "dark",
		-- 			floats = transparent and "transparent" or "dark",
		-- 		},
		-- 		on_colors = function(colors)
		-- 			colors.bg = bg
		-- 			colors.bg_dark = transparent and colors.none or bg_dark
		-- 			colors.bg_float = transparent and colors.none or bg_dark
		-- 			colors.bg_highlight = bg_highlight
		-- 			colors.bg_popup = bg_dark
		-- 			colors.bg_search = bg_search
		-- 			colors.bg_sidebar = transparent and colors.none or bg_dark
		-- 			colors.bg_statusline = transparent and colors.none or bg_dark
		-- 			colors.bg_visual = bg_visual
		-- 			colors.border = border
		-- 			colors.fg = fg
		-- 			colors.fg_dark = fg_dark
		-- 			colors.fg_float = fg
		-- 			colors.fg_gutter = fg_gutter
		-- 			colors.fg_sidebar = fg_dark
		-- 		end,
		-- 	})
		--
		-- 	vim.cmd("colorscheme tokyonight")
		-- end,
	},
	{
		"vivindeena/vn-night.nvim",
        name="vn-night"
		--       priority = 1000,
		-- config = function()
		-- 	require("vn-night").setup()
		-- 	vim.cmd("colorscheme vn-night")
		-- end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
        highlight_overrides= function()
            local colors = require('catppuccin.palettes').get_palette(require('catppuccin.palettes').get_palette(flavour).teal)
            local ucolors = require('catppuccin.utils.colors')
            local telescope_prompt = ucolors.darken(colors.crust, 0.95, '#000000')
            local telescope_results = ucolors.darken(colors.mantle, 0.95, '#000000')
            local telescope_text = colors.text
            local telescope_prompt_title = colors.sky
            local telescope_preview_title = colors.teal
            return {
                all = {
                    TelescopeBorder = { bg = telescope_results, fg = telescope_results },
                    TelescopePromptBorder = { bg = telescope_prompt, fg = telescope_prompt },
                    TelescopePromptCounter = { fg = telescope_text },
                    TelescopePromptNormal = { fg = telescope_text, bg = telescope_prompt },
                    TelescopePromptPrefix = { fg = telescope_prompt_title, bg = telescope_prompt },
                    TelescopePromptTitle = { fg = telescope_prompt, bg = telescope_prompt_title },
                    TelescopePreviewTitle = { fg = telescope_results, bg = telescope_preview_title },
                    TelescopePreviewBorder = {
                        bg = ucolors.darken(telescope_results, 0.95, '#000000'),
                        fg = ucolors.darken(telescope_results, 0.95, '#000000'),
                    },
                    TelescopePreviewNormal = {
                        bg = ucolors.darken(telescope_results, 0.95, '#000000'),
                        fg = telescope_results,
                    },
                    TelescopeResultsTitle = { fg = telescope_results, bg = telescope_preview_title },
                    TelescopeMatching = { fg = telescope_prompt_title },
                    TelescopeNormal = { bg = telescope_results },
                    TelescopeSelection = { bg = telescope_prompt },
                    TelescopeSelectionCaret = { fg = telescope_text },
                    TelescopeResultsNormal = { bg = telescope_results },
                    TelescopeResultsBorder = { bg = telescope_results, fg = telescope_results },
                }
            }
        end,
		config = function()
			require("catppuccin").setup()
			vim.cmd("colorscheme catppuccin")
		end,
	},
}

