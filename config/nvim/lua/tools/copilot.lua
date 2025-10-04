require("CopilotChat").setup {
  -- debug = true, -- Enable debugging
  -- default mappings
  mappings = {
    reset = {
      normal = "",     -- remove the default <C-l> mapping in normal mode
      insert = "",     -- remove it in insert mode
      callback = function() end,  -- optional: no-op callback
    },
    complete = {
      insert = '<Tab>',
    },
    close = {
      normal = 'q',
      insert = '<C-c>',
    },
    submit_prompt = {
      normal = '<CR>',
      insert = '<C-s>',
    },
    toggle_sticky = {
      detail = 'Makes line under cursor sticky or deletes sticky line.',
      normal = 'gr',
    },
    accept_diff = {
      -- normal = 'go',
      -- insert = 'go'
    },
    jump_to_diff = {
      normal = 'gj',
    },
    quickfix_diffs = {
      normal = 'gq',
    },
    yank_diff = {
      normal = 'gy',
      register = '"',
    },
    show_diff = {
      normal = 'gd',
    },
    show_info = {
      normal = 'gp',
    },
    show_context = {
      normal = 'gc',
    },
    show_help = {
      normal = 'gh',
    },
  },
  -- See Configuration section for rest
}
