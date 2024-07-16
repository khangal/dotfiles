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
require('tools.luasnip')

-- Function to toggle Copilot state
function ToggleCopilot()
  -- Check if Copilot is currently enabled
  local copilot_status = vim.fn['copilot#Enabled']()
  
  if copilot_status == 1 then
    -- Copilot is enabled, so disable it
    vim.cmd('Copilot disable')
  else
    -- Copilot is disabled, so enable it
    vim.cmd('Copilot enable')
  end
end

-- Create a Neovim command to toggle Copilot
vim.api.nvim_create_user_command('CopilotToggle', ToggleCopilot, {})
vim.api.nvim_set_keymap('n', 'yos', ':CopilotToggle<CR>', { noremap = true, silent = true })
