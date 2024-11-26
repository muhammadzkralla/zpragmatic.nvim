local M = {}

M.defaults = {
    filetype_questions = {},
    bypass_filetypes = {},
}

M.options = vim.deepcopy(M.defaults)

function M.setup(opts)
    M.options = vim.tbl_deep_extend("force", M.defaults, opts or {})
end

return M
