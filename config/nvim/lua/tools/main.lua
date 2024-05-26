require("oil").setup({
  keymaps = {
    ["g?"] = "actions.show_help",
    ["<CR>"] = "actions.select",
    ["<A-s>"] = "actions.select_vsplit",
    ["<A-h>"] = "actions.select_split",
    ["<A-t>"] = "actions.select_tab",
    ["<A-p>"] = "actions.preview",
    ["<A-c>"] = "actions.close",
    ["<A-l>"] = "actions.refresh",
    ["-"] = "actions.parent",
    ["_"] = "actions.open_cwd",
    ["`"] = "actions.cd",
    ["~"] = "actions.tcd",
    ["gs"] = "actions.change_sort",
    ["gx"] = "actions.open_external",
    ["g."] = "actions.toggle_hidden",
    ["g\\"] = "actions.toggle_trash",
  },
  use_default_keymaps = false,
  view_options = {
    show_hidden = true,
  },
})

require("mason").setup()
require("mason-lspconfig").setup()
require('Comment').setup()

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

require('tools.lsp')
require('tools.cmp')
require('tools.treesitter')
require('tools.dap')
require('tools.neorg')
require('tools.mason')
