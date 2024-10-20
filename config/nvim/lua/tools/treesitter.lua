require'nvim-treesitter.configs'.setup {
  ensure_installed = {"css", "javascript", "rust", "typescript", "vim", "lua"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  -- ignore_install = { "vim" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "txt" },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = true
  },
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim 
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",

        -- Or you can define your own textobjects like this
        -- ["iF"] = {
        --   python = "(function_definition) @function",
        --   cpp = "(function_definition) @function",
        --   c = "(function_definition) @function",
        --   java = "(method_declaration) @function",
        -- },
      },
    },
  },
}

require('ts_context_commentstring').setup {
  enable_autocmd = false,
}

-- lua require('Comment').setup()
-- neovim 0.10 needs this
require('Comment').setup { pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook() }
vim.g.skip_ts_context_commentstring_module = true

-- local get_option = vim.filetype.get_option
-- vim.filetype.get_option = function(filetype, option)
--   return option == "commentstring"
--     and require("ts_context_commentstring.internal").calculate_commentstring()
--     or get_option(filetype, option)
-- end
