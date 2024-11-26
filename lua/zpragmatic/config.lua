local M = {}

M.defaults = {
    filetype_questions = {
        ["*"] = {
            "Save changes? (y/n/q): ",
        },
        ["java"] = {
            "Did you check for syntax errors? (y/n/q): ",
            "Are all tests passing? (y/n/q): ",
        },
        ["javascript"] = {
            "Did you run the linter? (y/n/q): ",
            "Are there any console logs to remove? (y/n/q): ",
        },
    },
    bypass_filetypes = { "markdown", "txt", "json" },
}

M.options = vim.deepcopy(M.defaults)

function M.setup(opts)
    M.options = vim.tbl_deep_extend("force", M.defaults, opts or {})
end

return M
