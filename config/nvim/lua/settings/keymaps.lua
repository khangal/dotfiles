vim.g.mapleader = " "

-- Save file mappings
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-s>', '<Esc>:w<CR>', {noremap = true})

-- Netrw mappings
vim.api.nvim_set_keymap('n', '<F5>', '<Plug>NetrwRefresh', {})

-- Convenience mappings
vim.api.nvim_set_keymap('n', '<Leader>ci', ':source ~/.vimrc.local<CR>:source ~/.vimrc.bundles<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>bi', ':source ~/.vimrc.local<CR>:PlugInstall<CR>', {})

-- Quick open mappings
vim.api.nvim_set_keymap('n', '<Leader>vo', ':tabe ~/dotfiles<CR>:lcd %:p:h<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>vt', ':tabe ~/dotfiles/vimrc<CR>:lcd %:p:h<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>vi', ':tabe ~/dotfiles/vimrc.local<CR>:vsplit ~/dotfiles/config/nvim/lua/settings/general.lua<CR><C-w><C-w>:lcd %:p:h<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>vb', ':tabe ~/dotfiles/vimrc.bundles<CR>:vsplit ~/dotfiles/config/nvim/rocks.toml<CR><C-w><C-w>:lcd %:p:h<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>q', ':tabe ~/.ideas.markdown<CR>:lcd %:p:h<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>vn', ':tabe ~/Dropbox/notes/index.norg<CR>:lcd %:p:h<CR>', {})

-- Notebook mappings
vim.api.nvim_set_keymap('c', '\27[D', '<C-Left>', {})
vim.api.nvim_set_keymap('c', '\27[C', '<C-Right>', {})

-- Run Elixir formatter
vim.api.nvim_set_keymap('n', '<Leader>d', ':ALEFix<CR>', {})
-- Run lsp optimize import
vim.api.nvim_set_keymap('n', '<Leader>o', ':OrganizeImports<CR>', {})

-- Emacs-like beginning and end of line
vim.api.nvim_set_keymap('i', '<C-e>', '<C-o>$', {})
vim.api.nvim_set_keymap('i', '<C-a>', '<C-o>^', {})

-- Search word under cursor
vim.api.nvim_set_keymap('n', '<Leader>kw', ':S <C-r><C-w><CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>ke', ':S <C-r><C-w><CR>', {noremap = true})
-- Search current file
vim.api.nvim_set_keymap('n', '<Leader>kf', ':S %:t:r<CR>', {noremap = true})

-- Paste and yank mappings
vim.api.nvim_set_keymap('n', '<Leader>p', ':set paste<CR><Esc>"+p:set nopaste<CR>:retab<CR>', {})
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', {})
vim.api.nvim_set_keymap('v', '<Leader>k', 'y:S <c-r>"<CR>', {})

-- Other mappings
vim.api.nvim_set_keymap('n', '<C-_><C-_>', 'gcc', {})
vim.api.nvim_set_keymap('v', '<C-_><C-_>', 'gc', {})
vim.api.nvim_set_keymap('n', 'gb', ':GBranches<CR>', {})
vim.api.nvim_set_keymap('n', 'go', ':Git<CR>', {})
vim.api.nvim_set_keymap('n', '<A-1>', '1gt', {})
vim.api.nvim_set_keymap('n', '<A-2>', '2gt', {})
vim.api.nvim_set_keymap('n', '<A-3>', '3gt', {})
vim.api.nvim_set_keymap('n', '<A-4>', '4gt', {})
vim.api.nvim_set_keymap('n', '<A-5>', '5gt', {})
vim.api.nvim_set_keymap('n', '<A-6>', '6gt', {})

vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre"
})
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word"
})
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "Search current word"
})
vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file"
})

-- run :CopilotChat
vim.keymap.set('n', '<leader>c', '<cmd>CopilotChatToggle<CR>', {
    desc = "Open Copilot Chat"
})

vim.keymap.set('v', '<leader>c', '<cmd>CopilotChatToggle<CR>', {
    desc = "Open Copilot Chat"
})

-- local ls = require("luasnip")
--
-- vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
-- vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
-- vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})
--
-- vim.keymap.set({"i", "s"}, "<C-E>", function()
--   if ls.choice_active() then
--     ls.change_choice(1)
--   end
-- end, {silent = true})
