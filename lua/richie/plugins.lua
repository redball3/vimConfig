return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { { "nvim-lua/plenary.nvim" } }
    },
    {
        "catppuccin/nvim", name = "catppuccin", priority = 1000
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = false
    },
    {
        "ThePrimeagen/harpoon",
        dependencies = { { "nvim-lua/plenary.nvim" } }
    },
    { "mbbill/undotree" },
    { "tpope/vim-fugitive" },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
    },
    {
        "zbirenbaum/copilot-cmp",
        event = "InsertEnter",
        config = function() require("copilot_cmp").setup() end,
        dependencies = {
            "zbirenbaum/copilot.lua",
            cmd = "Copilot",
            config = function()
                require("copilot").setup({
                    suggestion = { enabled = false },
                    panel = { enabled = false },
                })
            end,
        },
    },

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'neovim/nvim-lspconfig' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/nvim-cmp' },
            { 'L3MON4D3/LuaSnip' },
        }
    },
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-neotest/neotest-go",
            "rouge8/neotest-rust",
            "stevanmilic/neotest-scala"
        },
        config = function()
            -- get neotest namespace (api call creates or returns namespace)
            local neotest_ns = vim.api.nvim_create_namespace("neotest")
            vim.diagnostic.config({
                virtual_text = {
                    format = function(diagnostic)
                        local message =
                            diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
                        return message
                    end,
                },
            }, neotest_ns)
        end
    },
    { "lukas-reineke/indent-blankline.nvim" },
    {
        "abecodes/tabout.nvim",
        wants = ('nvim-treesitter'),
        after = ('nvim-cmp'),
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        }
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "scalameta/nvim-metals",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        ft = { "scala", "sbt", "java" },
        opts = function()
            local metals = require("metals")
            local metals_config = metals.bare_config()

            metals_config.settings = {
                enableSemanticHighlighting = true,
                showImplicitArguments = true,
                showInferredType = true,
                superMethodLensesEnabled = true,
                showImplicitConversionsAndClasses = true,
            }
            metals_config.init_options.statusBarProvider = "on"
            -- Example if you are using cmp how to make sure the correct capabilities for snippets are set

            metals_config.on_attach = function(client, bufnr)
                local opts = { buffer = bufnr, remap = false }

                local signature_setup = {
                    bind = true, -- This is mandatory, otherwise border config won't get registered.
                    handler_opts = {
                        border = "rounded"
                    }
                }
                require("lsp_signature").on_attach(signature_setup, bufnr)
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
                vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
                vim.keymap.set("v", "<C-K>", function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set("n", "<leader>oo", function() require("telescope").extensions.metals.commands() end, opts)
            end

            return metals_config
        end,
        config = function(self, metals_config)
            local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
            vim.api.nvim_create_autocmd("FileType", {
                pattern = self.ft,
                callback = function()
                    require("metals").initialize_or_attach(metals_config)
                end,
                group = nvim_metals_group,
            })
        end
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {},
        config = function(_, opts) require 'lsp_signature'.setup(opts) end
    },
    {
        'rmagatti/auto-session',
        lazy = false,

        ---enables autocomplete for opts
        opts = {
            suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
            -- log_level = 'debug',
        }
    },
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        }
    }
}
