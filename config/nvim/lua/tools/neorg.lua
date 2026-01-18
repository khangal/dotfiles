require('neorg').setup {
  lazy = false,
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
    ["core.norg.esupports.metagen"] = {},
  },
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = "norg",
  callback = function(ev)
    vim.keymap.set(
      "n",
      "<Leader>n",
      "<Plug>(neorg.dirman.new-note)",
      { buffer = ev.buf, silent = true, desc = "Neorg: New note" }
    )
  end,
})
-- vim.api.nvim_del_keymap('n', '\\nn')
-- vim.keymap.set("n", "<Leader>n", "<Plug>(neorg.dirman.new-note)", {})
