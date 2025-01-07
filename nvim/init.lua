require("core.option")
require("core.keymaps")
-- setup lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins", {
  performance = {
    rtp = {
      disabled_plugins = {
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
      },
    },
  },
})

-- カラースキームの設定
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.pumblend = 0
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
require('tokyonight').setup({
  style = 'night',
  transparent = true,
  styles = {
        sidebars = "transparent",
        floats = "transparent",
    },
})
vim.cmd.colorscheme "tokyonight"
vim.cmd("highlight TelescopeSelection cterm=bold gui=bold guifg=#a6e3a1 guibg=#181825")
-- 行番号の色を変更
vim.cmd [[
  highlight LineNr guifg=#808080
  highlight CursorLineNr guifg=#FFFF00
]]
 require("lualine").setup({
   options = {
     -- ... other configuration
     theme = "auto", -- Can also be "auto" to detect automatically.
   }
 })

local map = vim.keymap.set
local opt = { noremap = true }
-- Telescope bindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.api.nvim_set_keymap('n', '<leader>fa', ':Telescope file_browser<CR>', { noremap = true })

-- hop nvim
local hop = require('hop')
vim.keymap.set('n', '<leader>ss', ':HopChar2<CR>', {desc = '説明'}) 
vim.keymap.set('n', '<leader>sa', ':HopPattern<CR>', {desc = '説明'}) 
-- nvim-tree
require("nvim-tree").setup()
map('n', '<leader>bb', '<Cmd>NvimTreeToggle<CR>', opts)
map('n', '<leader>bf', '<Cmd>NvimTreeFindFile<CR>', opts)
-- trouble.nvim
require("trouble").setup()
map('n', 'gl', '<Cmd>Trouble diagnostics toggle<CR>', opts)
-- gitsigns
require('gitsigns').setup()

-- 1. LSP Sever management
local lspconfig = require('lspconfig')
require('mason').setup()
require('mason-lspconfig').setup_handlers({ function(server)
  local opt = {
    -- -- Function executed when the LSP server startup
    on_attach = function(client, bufnr)
      local opts = { noremap=true, silent=true }
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
      -- バッファのファイルタイプをチェック
      local filetype = vim.api.nvim_buf_get_option(bufnr, 'filetype')
      if filetype ~= 'python' then
          -- Pythonファイル以外の場合にのみフォーマットの自動コマンドを設定
          vim.cmd('autocmd BufWritePre <buffer=' .. bufnr .. '> lua vim.lsp.buf.format()')
      end
    end,
    capabilities = require('cmp_nvim_lsp').default_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    )
  }
  require('lspconfig')[server].setup(opt)
end })

local lspconfig = require('lspconfig')
local util = require('lspconfig.util')
require('lspconfig').pyright.setup{
  settings = {
    venvPath = ".",
    pythonPath = "./.venv/bin/python",
    analysis = {
      extraPaths = {"."}
    }
  }
  }

-- nuxt typescript setup
local function get_typescript_server_path(root_dir)
      local home = os.getenv("HOME")
      local global_ts = home .. "/.local/share/mise/installs/node/18/lib/node_modules/typescript/lib"
      local found_ts = ""
      local function check_dir(path)
        found_ts = util.path.join(path, "node_modules", "typescript", "lib")
        if util.path.exists(found_ts) then
          return path
        end
      end
      if util.search_ancestors(root_dir, check_dir) then
        return found_ts
      else
        return global_ts
      end
    end

local function organize_imports()
      local params = {
        command = "_typescript.organizeImports",
        arguments = { vim.api.nvim_buf_get_name(0) },
        title = "",
      }
      vim.lsp.buf.execute_command(params)
    end
-- VueやNuxtのプロジェクトでのみ有効にする
require('lspconfig').volar.setup({
    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json", "spec" },
    init_options = {
        vue = {
          hybridMode = false,
        },
      },
    capabilities = capabilities,
    root_dir = util.root_pattern("vite.config.ts", "nuxt.config.ts"),
    on_new_config = function(new_config, new_root_dir)
      new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
    end,
  })

-- VueやNuxtのプロジェクトでなければtsserverを使う
require('lspconfig').tsserver.setup({
  single_file_support = false,
  root_dir = function(fname)
    -- VueやNuxtのプロジェクトではVolarに任せるので無効にする
    if util.root_pattern("vite.config.ts", "nuxt.config.ts")(fname) then
      return nil
    end
    return util.root_pattern("tsconfig.json", "playwright.config.ts")(fname)
  end,
})
require('lspconfig').sqls.setup{
        on_attach = function(client, bufnr)
            require('sqls').on_attach(client, bufnr)
        end
}

require('lspconfig').groovyls.setup{
    cmd = { "groovy-language-server" },
}
-- 2. build-in LSP function
-- keyboard shortcut
vim.keymap.set('n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.format()<CR>')
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
-- LSP handlers
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
)
-- Reference highlight
vim.cmd [[
set updatetime=500
highlight LspReferenceText  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceRead  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
augroup lsp_document_highlight
  autocmd!
  autocmd CursorHold,CursorHoldI * lua vim.lsp.buf.document_highlight()
  autocmd CursorMoved,CursorMovedI * lua vim.lsp.buf.clear_references()
augroup END

augroup DisableDocumentHighlightYAML
    autocmd!
    autocmd FileType yaml lua vim.lsp.buf.document_highlight = function() end
    autocmd FileType sql lua vim.lsp.buf.document_highlight = function() end
    autocmd FileType mysql lua vim.lsp.buf.document_highlight = function() end
    autocmd FileType md lua vim.lsp.buf.document_highlight = function() end
    autocmd FileType markdown lua vim.lsp.buf.document_highlight = function() end
    autocmd FileType groovy lua vim.lsp.buf.document_highlight = function() end
  augroup END
]]

-- 3. completion (hrsh7th/nvim-cmp)
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    -- { name = "buffer" },
    -- { name = "path" },
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ['<C-l>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm { select = true },
  }),
  experimental = {
    ghost_text = true,
  },
})
-- cmp.setup.cmdline('/', {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = {
--     { name = 'buffer' }
--   }
-- })
-- cmp.setup.cmdline(":", {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = {
--     { name = "path" },
--     { name = "cmdline" },
--   },
-- })



