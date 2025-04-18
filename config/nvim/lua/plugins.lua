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
  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = { 'rafamadriz/friendly-snippets' },

    -- use a release tag to download pre-built binaries
    version = '1.*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = { preset = 'default' },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
      },

      -- (Default) Only show the documentation popup when manually triggered
      completion = { documentation = { auto_show = false } },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  },
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
  'CopilotC-Nvim/CopilotChat.nvim',
  { "cordx56/rustowl", dependencies = { "neovim/nvim-lspconfig" } },
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
