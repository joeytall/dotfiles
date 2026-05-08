-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Options
local opt = vim.opt
opt.termguicolors  = true
opt.clipboard      = "unnamedplus"
opt.hidden         = true
opt.showcmd        = true
opt.showmatch      = true
opt.showmode       = true
opt.ruler          = true
opt.number         = true
opt.relativenumber = true
opt.formatoptions:append("o")
opt.textwidth      = 0
opt.expandtab      = true
opt.tabstop        = 2
opt.shiftwidth     = 2
opt.errorbells     = false
opt.modeline       = true
opt.joinspaces     = false
opt.splitbelow     = true
opt.splitright     = true
opt.scrolloff      = 10
opt.sidescrolloff  = 5
opt.display:append("lastline")
opt.startofline    = false
opt.hlsearch       = true
opt.ignorecase     = true
opt.smartcase      = true
opt.incsearch      = true
opt.gdefault       = true
opt.magic          = true
opt.laststatus     = 2
opt.encoding       = "utf-8"
opt.wrap           = true
opt.backupdir      = vim.fn.expand("~/.vim/backup")
opt.directory      = vim.fn.expand("~/.vim/swap")
opt.undodir        = vim.fn.expand("~/.vim/undo")
opt.undofile       = true
opt.history        = 100
opt.undolevels     = 100
opt.wildmode       = { "longest", "list" }
opt.wildmenu       = true
opt.cursorcolumn   = true
opt.mouse          = "a"
opt.timeoutlen     = 1000
opt.ttimeoutlen    = 0
opt.fixendofline   = false

-- Keymaps
local map = vim.keymap.set
local s = { silent = true }

-- Window navigation
map("n", "<BS>",    "<C-W>h", s)
map("n", "<C-J>",   "<C-W>j", s)
map("n", "<C-K>",   "<C-W>k", s)
map("n", "<C-H>",   "<C-W>h", s)
map("n", "<C-L>",   "<C-W>l", s)
map("n", "<S-H>",   "<C-W>H", s)
map("n", "<S-L>",   "<C-W>L", s)
map("n", "<S-K>",   "<C-W>K", s)
map("n", "<leader>K", "<C-W>K")
map("n", "<leader>J", "<C-W>J")
map("n", "<C-M>",   "<C-W>_", s)
map("n", "<C-=>",   "<C-W>=", s)
map("n", "<C-N>",   ":silent noh<CR>", s)

-- Git (vim-fugitive)
map("n", "gb", ":Git blame<CR>", s)
map("n", "gc", ":Git commit<CR>", s)
map("n", "gC", ":Git commit -a<CR>", s)
map("n", "gs", ":Git<CR>", s)

-- Function keys
map("n", "<F1>",  ":EraseBadWhitespace<CR>", s)
map("n", "<F2>",  ":TagbarToggle<CR>", s)
map("n", "<F3>",  ":Git blame<CR>", s)
map("n", "<F4>",  ":Git log<CR>", s)
map("n", "<F5>",  ":pwd<CR>", s)
map("n", "<F6>",  "/--- <CR>zz", s)
map("n", "<F7>",  ":UndotreeToggle<CR>", s)
map("n", "<F8>",  ":NvimTreeToggle<CR>", s)
map("n", "<F10>", ":lclose<CR>", s)
map("n", "<C-T>", ":NvimTreeToggle<CR>", s)

-- No arrow keys
for _, mode in ipairs({ "i", "n" }) do
  for _, key in ipairs({ "<Up>", "<Down>", "<Left>", "<Right>" }) do
    map(mode, key, "<NOP>")
  end
end

-- Clipboard
map("v", "<leader>y", '"+y')
map("v", "<leader>d", '"+d')
map("n", "<leader>p", '"+p')
map("n", "<leader>P", '"+P')
map("v", "<leader>p", '"+p')
map("v", "<leader>P", '"+P')

-- Quick save/quit
map("n", "<leader>e",  ":e<CR>")
map("n", "<leader>w",  ":w<CR>")
map("n", "<leader>q",  ":q<CR>")
map("n", "<leader>wq", ":wq<CR>")

-- Tidy
map("n", "=t", ":%! tidy -config ~/.tidyrc<CR>")

-- Autopair new line (was delimitMate C-c)
map("i", "<C-c>", "<CR><Esc>O")

-- %% expands to current file's directory in command mode
vim.cmd('cabbr <expr> %% expand("%:p:h")')

-- Autocmds
local ag  = vim.api.nvim_create_augroup
local auc = vim.api.nvim_create_autocmd

local ft = ag("filetypes", { clear = true })
auc({ "BufNewFile", "BufRead" }, { group = ft, pattern = "*.mobile.erb",
  callback = function() vim.b.eruby_subtype = "html"; vim.bo.filetype = "eruby" end })
auc({ "BufNewFile", "BufRead" }, { group = ft, pattern = { ".pryrc", "Gemfile", "Gemfile.lock" },
  command = "set filetype=ruby" })
auc({ "BufNewFile", "BufRead" }, { group = ft, pattern = { "*.aspx", "*.ascx" },
  command = "set filetype=javascript" })
auc({ "BufNewFile", "BufRead" }, { group = ft, pattern = "*.asmx",    command = "set filetype=aspnet" })
auc({ "BufNewFile", "BufRead" }, { group = ft, pattern = ".amazonrc", command = "set filetype=zsh" })
auc({ "BufNewFile", "BufRead" }, { group = ft, pattern = "Config",    command = "set filetype=perl" })
auc("FileType", { group = ft, pattern = "crontab", command = "setlocal nobackup nowritebackup" })
auc("FileType", { group = ft, pattern = "python",  command = "setlocal tabstop=2 shiftwidth=2" })

local rn = ag("relnumber", { clear = true })
auc("InsertEnter",              { group = rn, callback = function() opt.relativenumber = false end })
auc("InsertLeave",              { group = rn, callback = function() opt.relativenumber = true  end })
auc({ "BufLeave",  "FocusLost"   }, { group = rn, callback = function() opt.relativenumber = false end })
auc({ "BufEnter",  "FocusGained" }, { group = rn, callback = function() opt.relativenumber = true  end })

-- Plugins
require("lazy").setup({

  -- Colorscheme (Lua rewrite of your existing onedark fork)
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      require("onedark").setup({ style = "dark" })
      require("onedark").load()
      vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
    end,
  },

  -- Treesitter: replaces vim-javascript, python-syntax, html5.vim, vim-json,
  --             vim-css3-syntax, vim-markdown, vim-vue, php.vim, vim-polyglot
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua", "vim", "vimdoc", "python", "javascript", "typescript",
          "html", "css", "json", "markdown", "ruby", "php", "perl",
          "bash", "yaml", "toml", "vue",
        },
        highlight = { enable = true },
        indent    = { enable = true },
      })
    end,
  },

  -- LSP: replaces syntastic, python-mode, tern_for_vim
  -- Run :LspInstall <server> or install servers manually (pyright, ts_ls, etc.)
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Uncomment and add servers as you install them:
      -- require("lspconfig").pyright.setup{}
      -- require("lspconfig").ts_ls.setup{}
      -- require("lspconfig").ruby_lsp.setup{}
    end,
  },

  -- Completion + snippets: replaces vim-snipmate, vim-addon-mw-utils, tlib_vim
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
      "saadparwaiz1/cmp_luasnip",
      "honza/vim-snippets",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp     = require("cmp")
      local luasnip = require("luasnip")
      require("luasnip.loaders.from_snipmate").lazy_load()
      require("luasnip.loaders.from_vsnip").lazy_load()

      cmp.setup({
        snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
        mapping = cmp.mapping.preset.insert({
          ["<C-l>"] = cmp.mapping(function(fallback)
            if luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
            else fallback() end
          end, { "i", "s" }),
          ["<Tab>"]     = cmp.mapping.select_next_item(),
          ["<S-Tab>"]   = cmp.mapping.select_prev_item(),
          ["<CR>"]      = cmp.mapping.confirm({ select = false }),
          ["<C-Space>"] = cmp.mapping.complete(),
        }),
        sources = cmp.config.sources(
          { { name = "nvim_lsp" }, { name = "luasnip" } },
          { { name = "buffer" },   { name = "path" }    }
        ),
      })
    end,
  },

  -- Telescope: replaces ctrlp.vim + ag.vim
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local telescope = require("telescope")
      local builtin   = require("telescope.builtin")
      telescope.setup({
        defaults = {
          file_ignore_patterns = { "node_modules", ".git/", "coverage", "vendor/bundle", "build" },
        },
      })
      telescope.load_extension("fzf")

      map("n", "<leader><leader>", builtin.find_files, s)
      map("n", "<leader>b",        builtin.buffers, s)
      map("n", "<leader>ft",       builtin.tags, s)
      map("n", "<leader>fa", function() builtin.find_files({ cwd = "app/assets" })      end, s)
      map("n", "<leader>fc", function() builtin.find_files({ cwd = "app/controllers" }) end, s)
      map("n", "<leader>fm", function() builtin.find_files({ cwd = "app/models" })      end, s)
      map("n", "<leader>fv", function() builtin.find_files({ cwd = "app/views" })       end, s)
      map("n", "<F11>", function()
        builtin.grep_string({ search = vim.fn.expand("<cword>"), search_dirs = { vim.fn.expand("%") } })
      end, s)
      map("n", "<F12>", function()
        builtin.grep_string({ search = vim.fn.expand("<cword>") })
      end, s)
    end,
  },

  -- File tree: replaces NERDTree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({ filters = { dotfiles = false } })
    end,
  },

  -- Statusline: replaces vim-airline + vim-airline-themes
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options  = { theme = "onedark" },
        sections = {
          lualine_y = {},
          lualine_z = { function()
            return string.format("%3d%%", math.floor(vim.fn.line(".") * 100 / vim.fn.line("$")))
          end },
        },
      })
    end,
  },

  -- Git
  { "tpope/vim-fugitive" },

  -- Editing essentials (all still the standard)
  { "tpope/vim-surround" },
  { "tpope/vim-repeat"   },
  { "tpope/vim-endwise"  },
  { "tpope/vim-eunuch"   },
  { "tpope/vim-sleuth"   },
  { "tpope/vim-rails"    },
  { "tpope/vim-haml"     },
  { "tomtom/tcomment_vim" },

  -- Autopairs: replaces delimitMate
  { "windwp/nvim-autopairs", event = "InsertEnter", config = true },

  -- Indent guides: replaces vim-indent-guides
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", config = true },

  -- Undo tree: replaces gundo.vim
  { "mbbill/undotree" },

  -- Color preview: replaces vim-css-color
  {
    "norcalli/nvim-colorizer.lua",
    config = function() require("colorizer").setup() end,
  },

  -- Tags
  { "preservim/tagbar" },

  -- Whitespace
  { "bitc/vim-bad-whitespace" },

  -- Emmet
  { "mattn/emmet-vim" },

  -- Gist
  {
    "mattn/gist-vim",
    dependencies = { "mattn/webapi-vim" },
    init = function()
      vim.g.gist_clip_command = "pbcopy"
      vim.g.gist_post_private = 1
    end,
  },

  -- Language / syntax not yet covered by Treesitter
  { "vim-perl/vim-perl",    ft = "perl", build = "make clean carp dancer highlight-all-pragmas moose test-more try-tiny" },
  { "lepture/vim-jinja"     },
  { "StanAngeloff/php.vim"  },
  { "posva/vim-vue"         },
}, {
  ui = { border = "rounded" },
})
