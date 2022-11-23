--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {

        -- set vim options here (vim.<first_key>.<second_key> =  value)
        options = {
                opt = {
                        relativenumber = true, -- sets vim.opt.relativenumber
                        clipboard = "", -- Connection to the system clipboard
                },
                g = {
                        mapleader = " ", -- sets vim.g.mapleader
                },
        },
        -- If you need more control, you can use the function()...end notation
        -- options = function(local_vim)
        --   local_vim.opt.relativenumber = true
        --   local_vim.g.mapleader = " "
        --   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
        --   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
        --
        --   return local_vim
        -- end,

        -- Set dashboard header
        header = {
                "██╗  ██╗██████╗  ██████╗ ███╗   ██╗ ██████╗ ███████╗",
                "██║  ██║██╔══██╗██╔═══██╗████╗  ██║██╔═══██╗╚══███╔╝",
                "███████║██████╔╝██║   ██║██╔██╗ ██║██║   ██║  ███╔╝ ",
                "██╔══██║██╔══██╗██║   ██║██║╚██╗██║██║   ██║ ███╔╝  ",
                "██║  ██║██║  ██║╚██████╔╝██║ ╚████║╚██████╔╝███████╗",
                "╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝ ╚══════╝",
        },

        -- Default theme configuration
        default_theme = {
                -- Modify the color palette for the default theme
                colors = {
                        fg = "#abb2bf",
                        bg = "#1e222a",
                },
                -- enable or disable highlighting for extra plugins
                plugins = {
                        aerial = true,
                        beacon = false,
                        bufferline = true,
                        dashboard = true,
                        highlighturl = true,
                        hop = false,
                        indent_blankline = true,
                        lightspeed = false,
                        ["neo-tree"] = true,
                        notify = true,
                        ["nvim-tree"] = false,
                        ["nvim-web-devicons"] = true,
                        rainbow = true,
                        symbols_outline = false,
                        telescope = true,
                        vimwiki = false,
                        ["which-key"] = true,
                },
        },

        -- Diagnostics configuration (for vim.diagnostics.config({...}))
        diagnostics = {
                virtual_text = true,
                underline = true,
        },

        -- Extend LSP configuration
        lsp = {
                -- enable servers that you already have installed without mason
                servers = {
                        -- "pyright"
                },
                -- easily add or disable built in mappings added during LSP attaching
                mappings = {
                        n = {
                                -- ["<leader>lf"] = false -- disable formatting keymap
                        },
                },
                -- add to the global LSP on_attach function
                -- on_attach = function(client, bufnr)
                -- end,

                -- override the mason server-registration function
                -- server_registration = function(server, opts)
                --   require("lspconfig")[server].setup(opts)
                -- end,

                -- Add overrides for LSP server settings, the keys are the name of the server
                ["server-settings"] = {
                        -- example for addings schemas to yamlls
                        -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
                        --   settings = {
                        --     yaml = {
                        --       schemas = {
                        --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
                        --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                        --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
                        --       },
                        --     },
                        --   },
                        -- },
                },
        },

        -- Mapping data with "desc" stored directly by vim.keymap.set().
        --
        -- Please use this mappings table to set keyboard mapping since this is the
        -- lower level configuration and more robust one. (which-key will
        -- automatically pick-up stored data by this setting.)
        mappings = {
                -- first key is the mode
                n = {
                        -- second key is the lefthand side of the map
                        -- mappings seen under group name "Buffer"
                        ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
                        ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
                        ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
                        ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
                        -- quick save
                        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
                },
                t = {
                        -- setting a mapping to false will disable it
                        -- ["<esc>"] = false,
                },
        },

        -- Configure plugins
        plugins = {
                init = {
                        -- You can disable default plugins as follows:
                        { "fzy-lua-native" },
                        {
                                "gelguy/wilder.nvim",
                                config = function()
                                        local wilder = require "wilder"
                                        wilder.setup { modes = { ":" } }
                                        wilder.set_option("pipeline", {
                                                wilder.branch(
                                                        wilder.cmdline_pipeline {
                                                                -- sets the language to use, 'vim' and 'python' are supported
                                                                language = "vim",
                                                                -- 0 turns off fuzzy matching
                                                                -- 1 turns on fuzzy matching
                                                                -- 2 partial fuzzy matching (match does not have to begin with the same first letter)
                                                                fuzzy = 1,
                                                        },
                                                        wilder.python_search_pipeline {}
                                                ),
                                        })
                                        wilder.set_option(
                                                "renderer",
                                                wilder.popupmenu_renderer(wilder.popupmenu_border_theme {
                                                        highlights = {
                                                                border = "Normal", -- highlight to use for the border
                                                        },
                                                        -- 'single', 'double', 'rounded' or 'solid'
                                                        -- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
                                                        border = "rounded",
                                                })
                                        )
                                end,
                        },

                        -- We also support a key value style plugin definition similar to NvChad:
                        -- ["ray-x/lsp_signature.nvim"] = {
                        --   event = "BufRead",
                        --   config = function()
                        --     require("lsp_signature").setup()
                        --   end,
                        -- },
                },
                -- All other entries override the require("<key>").setup({...}) call for default plugins
                ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
                        -- config variable is the default configuration table for the setup functino call
                        local null_ls = require "null-ls"
                        -- Check supported formatters and linters
                        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
                        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
                        config.sources = {
                                -- Set a formatter that is manually installed
                                null_ls.builtins.formatting.prettier,
                        }
                        return config -- return final config table to use in require("null-ls").setup(config)
                end,
                treesitter = { -- overrides `require("treesitter").setup(...)`
                        ensure_installed = { "lua" },
                },
                -- use mason-lspconfig to configure LSP installations
                ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
                        ensure_installed = { "sumneko_lua" },
                },
                -- use mason-null-ls to install and setup configure null-ls sources
                ["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
                        ensure_installed = { "stylua" },
                },
                packer = { -- overrides `require("packer").setup(...)`
                        compile_path = vim.fn.stdpath "data" .. "/packer_compiled.lua",
                },
        },

        -- LuaSnip Options
        luasnip = {
                -- Extend filetypes
                filetype_extend = {
                        javascript = { "javascriptreact" },
                },
                -- Configure luasnip loaders (vscode, lua, and/or snipmate)
                vscode = {
                        -- Add paths for including more VS Code style snippets in luasnip
                        paths = {},
                },
        },

        -- CMP Source Priorities
        -- modify here the priorities of default cmp sources
        -- higher value == higher priority
        -- The value can also be set to a boolean for disabling default sources:
        -- false == disabled
        -- true == 1000
        cmp = {
                source_priority = {
                        nvim_lsp = 1000,
                        luasnip = 750,
                        buffer = 500,
                        path = 250,
                },
        },

        -- Modify which-key registration (Use this with mappings table in the above.)
        ["which-key"] = {
                -- Add bindings which show up as group name
                register = {
                        -- first key is the mode, n == normal mode
                        n = {
                                -- second key is the prefix, <leader> prefixes
                                ["<leader>"] = {
                                        -- third key is the key to bring up next level and its displayed
                                        -- group name in which-key top level menu
                                        ["b"] = { name = "Buffer" },
                                },
                        },
                },
        },

        -- This function is run last and is a good place to configuring
        -- augroups/autocommands and custom filetypes also this just pure lua so
        -- anything that doesn't fit in the normal config locations above can go here
        polish = function()
                -- Set key binding
                -- Set autocommands
                vim.api.nvim_create_augroup("packer_conf", { clear = true })
                vim.api.nvim_create_autocmd("BufWritePost", {
                        desc = "Sync packer after modifying plugins.lua",
                        group = "packer_conf",
                        pattern = "plugins.lua",
                        command = "source <afile> | PackerSync",
                })

                -- Set up custom filetypes
                -- vim.filetype.add {
                --   extension = {
                --     foo = "fooscript",
                --   },
                --   filename = {
                --     ["Foofile"] = "fooscript",
                --   },
                --   pattern = {
                --     ["~/%.config/foo/.*"] = "fooscript",
                --   },
                -- }
        end,
}

return config
