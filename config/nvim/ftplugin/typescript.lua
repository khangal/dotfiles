local has_deno = vim.fn.filereadable("deno.json") == 1

if has_deno then
    -- Set ALE fixers for TypeScript when deno.json is present
    vim.b.ale_fixers = {
        typescript = {'deno'},  -- Use Deno and Prettier
        typescriptreact = { 'deno' }
    }
    vim.b.ale_linters = {
        typescript = {'deno'},
    }
else
    -- Set default ALE fixers for TypeScript
    vim.b.ale_fixers = {
        typescript = {'eslint', 'prettier'},  -- Use ESLint and Prettier
        typescriptreact = { 'prettier', 'eslint' }
    }
    vim.b.ale_linters = {
        typescript = {'eslint'},  -- Use ESLint and Prettier
    }
end
