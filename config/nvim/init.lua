require('rocks.main')

-- Source ~/.vimrc
vim.cmd('source ~/.vimrc.bundles')

-- Load general settings
require('settings.general')

-- Load key mappings
require('settings.keymaps')

require('tools.main')

-- Source ~/.vimrc
vim.cmd('source ~/.vimrc')
