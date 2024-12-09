local has_deno = vim.fn.filereadable("deno.json") == 1

if has_deno then
    -- Set ALE fixers for TypeScript when deno.json is present
    vim.b.ale_fixers = {
        typescriptreact = {'deno'},  -- Use Deno and Prettier
    }
    vim.b.ale_linters = {
        typescriptreact = {'deno'},  -- Use Deno and Prettier
    }
else
    -- Set default ALE fixers for TypeScript
    vim.b.ale_fixers = {
        typescriptreact = {'eslint', 'prettier'},  -- Use ESLint and Prettier
    }
    vim.b.ale_linters = {
        typescriptreact = {'eslint'},  -- Use ESLint and Prettier
    }
end
