-- require('rocks.main')
require("config.lazy")

-- Source ~/.vimrc
-- vim.cmd('source ~/.vimrc.bundles')
vim.cmd('source ~/.vimrc')

-- Load general settings
require('settings.general')

-- Load key mappings
require('settings.keymaps')

require('tools.main')
