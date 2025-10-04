local original_notify = vim.notify
vim.notify = function(msg, level, opts)
  if msg:match("require%('lspconfig'%)") and msg:match("deprecated") then
    return -- Suppress the specific deprecation warning
  end
  original_notify(msg, level, opts)
end

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
