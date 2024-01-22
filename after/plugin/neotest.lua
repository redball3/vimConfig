neotest = require("neotest")

local gotest = require("neotest-go")
local rusttest = require("neotest-rust")

neotest.setup({
    adapters = {
        gotest,
        rusttest,
    },
    status = { virtual_text = true },
    output = { open_on_run = true },
    diagnostic = {
        enabled = true
    }
})

local root_patterns = { "go.mod", "Cargo.toml" }
local root_dir = vim.fs.dirname(vim.fs.find(root_patterns, { upward = true })[1])

local runallTests = function() 
    neotest.run.run(root_dir)
end

vim.keymap.set("n", "<leader>t", runallTests, {})
vim.keymap.set("n", "<leader>to", function() neotest.summary.toggle() end, {})
vim.keymap.set("n", "<leader>tw", function() neotest.watch.toggle(root_dir) end, {})
