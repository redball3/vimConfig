require("catppuccin").setup({
	flavour = "mocha",
	transparent_background = false,
    highlight_overrides = {
        all = function (colours)
           return {
               LineNr = {
                   fg = colours.white,
                   bg = colours.white
               }
           }
        end
    }
})

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.cmd.colorscheme "catppuccin"
