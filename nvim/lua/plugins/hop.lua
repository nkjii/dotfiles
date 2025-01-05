return {
  "phaazon/hop.nvim",
  branch = "v2",
  config = function()
    require("hop").setup {
      multi_windows = true,
    }
  end,
}

