return {
  "folke/styler.nvim",
  config = function()
      require("styler").setup({
        themes = {
          inactive = { colorscheme = "catpuccin" },
          active = { colorscheme = "tokyonight" },
        },
      })
    end
}
