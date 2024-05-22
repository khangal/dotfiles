require('neorg').setup {
    load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
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
