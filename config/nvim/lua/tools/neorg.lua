require('neorg').setup {
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
  },
}
