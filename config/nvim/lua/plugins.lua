return {
   {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
  'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  },
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  "nvim-lua/plenary.nvim",
  { 'junegunn/fzf.vim', dependencies = { 'junegunn/fzf' } },
  {
    'numToStr/Comment.nvim',
    opts = {
        -- add any options here
    }
  },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/nvim-cmp" },
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  'mattn/emmet-vim',
  'junegunn/vim-easy-align',
  'junegunn/goyo.vim',
  'github/copilot.vim',
  'honza/vim-snippets',
  'JoosepAlviste/nvim-ts-context-commentstring',
  -- 'Raimondi/delimitMate',
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
  'tpope/vim-dispatch',
  'tpope/vim-ragtag',
  'tpope/vim-unimpaired',
  { 'tpope/vim-abolish', cmd = { "Abolish", "Subvert" } },
  'tpope/vim-endwise',
  'mxsdev/nvim-dap-vscode-js',
  {
    'iamcco/markdown-preview.nvim',
    build = 'cd app && yarn install',
    ft = { 'markdown' },
  },
  {
    'prettier/vim-prettier',
    build = 'yarn install',
    ft = {
      'javascript', 'css', 'scss', 'json', 'xml', 'vue', 'python', 'ruby', 'html',
    },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },
  'norcalli/nvim-colorizer.lua',
  {
    'dense-analysis/ale',
    cond = function()
      return vim.version().major >= 8 or vim.fn.has('nvim') == 1
    end,
  },
  'tpope/vim-fugitive',
  'tpope/vim-repeat',
  'janko-m/vim-test',
  'tpope/vim-surround',
  'tpope/vim-dadbod',
  'kristijanhusak/vim-dadbod-ui',
  'kristijanhusak/vim-dadbod-completion',
  'yssl/QFEnter',
  'zbirenbaum/copilot.lua',
  'CopilotC-Nvim/CopilotChat.nvim',
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp"
  },
  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    config = true,
  },
  {
    "nvim-neorg/neorg",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = true,
    opts = {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.keybinds"] = {
          config = {
            default_keybinds = true,
          },
        },
        ["core.concealer"] = {
          config = {
            icons = {
              todo = {
                done = {
                  icon = "✔", -- Custom icon for completed tasks
                },
              },
            },
          },
        }, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/Dropbox/notes",
              tasks = "~/Dropbox/tasks",
              me = "~/Dropbox/me",
            },
            default_workspace = "notes",
            autodetect = true,
            autochdir = true,
          },
        },
      }
    },
  }
}
