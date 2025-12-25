require'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
    },
  },
}

require'lspconfig'.ts_ls.setup {
  commands = {
    OrganizeImports = {
      organize_imports = function()
        local params = {
          command = "_typescript.organizeImports",
          arguments = { vim.api.nvim_buf_get_name(0) },
          title = ""
        }
        vim.lsp.buf.execute_command(params)
      end,
      description = "Organize Imports"
    }
  }
}

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    -- vim.keymap.set('n', 'K', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
-- vim.lsp.config('tsserver', {})

  -- -- Mappings.
  -- local opts = { noremap=true, silent=true }
  -- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- buf_set_keymap('n', '<C-]>', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  -- buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('n', '<space>ks', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  -- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  -- buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  -- buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
--   if client.server_capabilities.document_formatting then
--     buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
--   elseif client.server_capabilities.document_range_formatting then
--     buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
--   end
--
--   -- Set autocommands conditional on server_capabilities
--   if client.server_capabilities.document_highlight then
--     vim.api.nvim_exec([[
--       hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
--       hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
--       hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
--       augroup lsp_document_highlight
--         autocmd!
--         autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
--         autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
--       augroup END
--     ]], false)
--   end
-- end

-- require'lspconfig'.vuels.setup{
--     on_attach = on_attach
-- }

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- capabilities.textDocument.completion.completionItem.resolveSupport = {
--   properties = {
--     'documentation',
--     'detail',
--     'additionalTextEdits',
--   }
-- }

-- require'lspconfig'.rust_analyzer.setup {
--   capabilities = capabilities,
-- }

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
--
-- local capabilities = require("blink.cmp").get_lsp_capabilities()

-- require("lspconfig")["denols"].setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   commands = {
--     OrganizeImports = {
--       organize_imports,
--       description = "Organize Imports"
--     }
--   },
--   root_dir = nvim_lsp.util.root_pattern("deno.jsonc", "deno.json", "deno.lock"),
-- })
--
-- require("lspconfig")["ts_ls"].setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   commands = {
--     OrganizeImports = {
--       organize_imports,
--       description = "Organize Imports"
--     }
--   },
--   root_dir = nvim_lsp.util.root_pattern("pnpm-lock.yaml", "tsconfig.json", ".eslintrc.json"),
--   single_file_support = false
-- })
--
--
-- require'lspconfig'.rust_analyzer.setup{
--   capabilities = capabilities,
--   settings = {
--     ['rust-analyzer'] = {
--       diagnostics = {
--         enable = false;
--       }
--     }
--   }
-- }


local customizations = {
  { rule = 'style/*', severity = 'off', fixable = true },
  { rule = 'format/*', severity = 'off', fixable = true },
  { rule = '*-indent', severity = 'off', fixable = true },
  { rule = '*-spacing', severity = 'off', fixable = true },
  { rule = '*-spaces', severity = 'off', fixable = true },
  { rule = '*-order', severity = 'off', fixable = true },
  { rule = '*-dangle', severity = 'off', fixable = true },
  { rule = '*-newline', severity = 'off', fixable = true },
  { rule = '*quotes', severity = 'off', fixable = true },
  { rule = '*semi', severity = 'off', fixable = true },
}

require'lspconfig'.eslint.setup(
  {
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
      "vue",
      "html",
      "markdown",
      "json",
      "jsonc",
      "yaml",
      "toml",
      "xml",
      "gql",
      "graphql",
      "astro",
      "svelte",
      "css",
      "less",
      "scss",
      "pcss",
      "postcss"
    },
    settings = {
      -- Silent the stylistic rules in your IDE, but still auto fix them
      rulesCustomizations = customizations,
    },

    on_attach = function(client, bufnr)
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        command = "EslintFixAll",
      })
    end,
  }
)

-- require("lspconfig")["rust_analyzer"].setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   commands = {
--     OrganizeImports = {
--       organize_imports,
--       description = "Organize Imports"
--     }
--   },
--   cargo = {
--     buildScripts = {
--       enable = true,
--     },
--   }
-- })
--
-- require("lspconfig")["gopls"].setup({
--   capabilities = capabilities,
--   on_attach = on_attach,
--   -- capabilities = capabilities,
--   commands = {
--     OrganizeImports = {
--       organize_imports,
--       description = "Organize Imports"
--     }
--   }
-- })
--
-- require("lspconfig")["pyright"].setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   commands = {
--     OrganizeImports = {
--       organize_imports,
--       description = "Organize Imports"
--     }
--   }
-- })

-- require("lspconfig")["tailwindcss"].setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   commands = {}
-- })
--

-- require("lspconfig").lua_ls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   settings = {
--     Lua = {
--       runtime = {
--         -- Tell the language server which version of Lua you're using (most likely LuaJIT in Neovim)
--         version = 'LuaJIT',
--       },
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = {'vim'},
--       },
--       workspace = {
--         -- Make the server aware of Neovim runtime files
--         library = vim.api.nvim_get_runtime_file("", true),
--       },
--       telemetry = {
--         enable = false,
--       },
--     },
--   },
-- }

-- local diagnostics_visible = true

-- function ToggleDiagnostics()
--     if diagnostics_visible then
--         vim.diagnostic.hide()
--     else
--         vim.diagnostic.show()
--     end
--     diagnostics_visible = not diagnostics_visible
-- end

-- vim.api.nvim_set_keymap('n', 'yop', '<cmd>lua ToggleDiagnostics()<CR>', {noremap = true, silent = true})
--
-- _G.diagnostics_visible = true
--
-- function ToggleDiagnostics()
--     if _G.diagnostics_visible then
--         vim.diagnostic.hide()
--     else
--         vim.diagnostic.show()
--     end
--     _G.diagnostics_visible = not _G.diagnostics_visible
-- end
--
-- vim.api.nvim_set_keymap('n', 'yop', '<cmd>lua ToggleDiagnostics()<CR>', {noremap = true, silent = true})
--
-- vim.cmd [[
--   augroup DiagnosticsVisibility
--     autocmd!
--     autocmd BufWritePost * lua if vim.bo.filetype == "ruby" and not _G.diagnostics_visible then vim.diagnostic.hide() end
--   augroup END
-- ]]
