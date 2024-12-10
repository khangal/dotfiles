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
  'Raimondi/delimitMate',
  'tpope/vim-dispatch',
  'tpope/vim-ragtag',
  'tpope/vim-unimpaired',
  'tpope/vim-abolish',
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
}
