local function convert_to_square_brackets(lines)
  local task_map = {
    ["- (-)"] = "- [ ]",
    ["- (x)"] = "- [x]",
    ["- (=)"] = "- [=]",
  }

  local converted_tasks = {}

  for _, line in ipairs(lines) do
    local task_status = line:sub(1, 5)
    local task_description = line:sub(7)
    -- print(task_status, task_map[task_status])
    local mapped_status = task_map[task_status] or "- [ ]"
    table.insert(converted_tasks, mapped_status .. " " .. task_description)
  end

  return converted_tasks
end

function ConvertSelection()
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")

  local start_line = start_pos[2]
  local end_line = end_pos[2]

  -- Ensure start_line is less than end_line
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end

  local lines = vim.fn.getline(start_line, end_line)

  -- Convert the lines using the Lua function
  local converted_lines = convert_to_square_brackets(lines)

  -- Join the converted lines into a single string with newlines
  local result = table.concat(converted_lines, "\n")

  -- Copy the result to the system clipboard (adjust register as needed)
  vim.fn.setreg('+', result)
end

-- Map the function to <leader>y in visual mode
vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>c', [[:<C-u>lua ConvertSelection()<CR>]], { noremap = true, silent = true })
