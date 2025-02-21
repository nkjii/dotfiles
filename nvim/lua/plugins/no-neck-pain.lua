return {
  "shortcuts/no-neck-pain.nvim",
  config = function()
      require("no-neck-pain").setup({
        buffers = {
          scratchPad = {
              enabled = true,
              location = "~/notes",
          },
          bo = {
            filetype = "md",
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
