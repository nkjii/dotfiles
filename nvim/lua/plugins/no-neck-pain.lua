return {
  "shortcuts/no-neck-pain.nvim",
  config = function()
      require("no-neck-pain").setup({
        width = 150,
        buffers = {
          scratchPad = {
              enabled = false,
          },
          bo = {
            filetype = "md",
          },
          colors = {
            backgroupnd = "onedark",
            blend = - 0.2,
          },
        },    
        autocmds = {
          enableOnVimEnter = true,
          enableOnTabEnter = true,
        },
      })
      vim.keymap.set("n", "<leader>z", "<cmd>NoNeckPain<CR>")
  end,
}
