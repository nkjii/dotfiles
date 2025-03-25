return {
  "nvim-lualine/lualine.nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = { "BufNewFile", "BufRead" },
  opts = function()
    return {
      options = {
          theme = custom_theme,
          component_separators = {},
          section_separators = {},
          disabled_filetypes = {
            statusline = { "no-neck-pain" },
            winbar = { "no-neck-pain", "Avante", "AvanteInput" },
          },
        },
        winbar = {
          lualine_a = {},
          lualine_b = {
            { "filename", file_status = false, newfile_status = false, path = 1 },
          },
          lualine_c = {
            { "diff", symbols = { added = " ", modified = " ", removed = " " } },
          },
          lualine_x = { { "diagnostics", sources = { "nvim_lsp" } } },
          lualine_y = {
            { "filetype", icon_only = true },
          },
          lualine_z = {
            {
              "filename",
              newfile_status = true,
              symbols = {
                modified = " ",
                readonly = "󰌾 ",
              },
            },
          },
        },
        inactive_winbar = {
          lualine_a = {},
          lualine_b = {
            { "filename", file_status = false, newfile_status = false, path = 1 },
          },
          lualine_c = {
            { "diff", symbols = { added = " ", modified = " ", removed = " " } },
          },
          lualine_x = { { "diagnostics", sources = { "nvim_lsp" } } },
          lualine_y = {
            { "filetype", icon_only = true },
          },
          lualine_z = {
            {
              "filename",
              newfile_status = true,
              symbols = {
                modified = " ",
                readonly = "󰌾 ",
              },
            },
          },
        },
        sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { require("lualine/cc-component") },
          lualine_x = { { "filename", path = 3 } },
          lualine_y = { "encoding", "fileformat" },
          lualine_z = {},
        },
      }
  end
}
