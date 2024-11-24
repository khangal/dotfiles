require("CopilotChat").setup {
  debug = true, -- Enable debugging
  -- default mappings
  mappings = {
    complete = {
      insert = '<Tab>',
    },
    close = {
      normal = 'q',
      insert = '<C-c>',
    },
    reset = {
      normal = 'gl',
      insert = 'gl',
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
      normal = 'go',
      insert = 'go'
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
    show_system_prompt = {
      normal = 'gp',
    },
    show_user_selection = {
      normal = 'gs',
    },
    show_user_context = {
      normal = 'gc',
    },
    show_help = {
      normal = 'gh',
    },
  },
  -- See Configuration section for rest
}
