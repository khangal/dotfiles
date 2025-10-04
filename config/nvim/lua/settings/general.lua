vim.api.nvim_command('nohl')

-- if vim.fn.empty(vim.env.VIM_COLORSCHEME or '') == 0 then
--     vim.cmd('colorscheme ' .. vim.env.VIM_COLORSCHEME)
-- else
--     vim.cmd('colorscheme tokyonight-night')
-- end
--
vim.opt_global.relativenumber = true
vim.opt_global.complete = '.,w,b,u,t'
vim.opt_global.autoread = true
vim.opt_global.ignorecase = true -- Case-insensitive searching.
vim.opt_global.smartcase = true -- But case-sensitive if expression contains a capital letter.
vim.opt_global.tags:append('.git/tags')
vim.opt_global.iminsert = 0
vim.opt_global.imsearch = -1
vim.opt_global.termguicolors = true
vim.opt_global.hlsearch = false
-- vim.opt_global.foldmethod = 'expr'
-- vim.opt_global.foldexpr = 'nvim_treesitter#foldexpr()'
-- vim.opt_global.fillchars = { fold = ' ' }
vim.opt_global.textwidth = 0
vim.opt_global.cursorline = true
vim.opt_global.spell = false
vim.opt_global.pumheight = 20 -- Maximum number of items to show in the popup menu
vim.opt_global.completeopt={'menuone','noselect'}
vim.opt_global.foldmethod= 'syntax'
vim.opt_global.foldlevelstart=99
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
