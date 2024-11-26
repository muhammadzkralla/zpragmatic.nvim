local config = require("zpragmatic.config")
local prompts = require("zpragmatic.prompts")

local M = {}

function M.setup(opts)
    config.setup(opts)
    prompts.setup_autocmd()
end

return M
