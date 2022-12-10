--              AstroNvim Configuration Table
--
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
                        tabstop = 4,
                        shiftwidth = 4,
                        showtabline = 4,
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
                formatting = {
                        format_on_save = false,
                        filter = function(client)
                                if client.name == "clangd" then return client.name == "null-ls" end

                                -- enable all other clients
                                return true
                        end,
                },
                -- enable servers that you already have installed without mason
                servers = {
                        -- "pyright"
                },
                -- easily add or disable built in mappings added during LSP attaching
                mappings = {},
                -- add to the global LSP on_attach function
                -- on_attach = function(client, bufnr)
                -- end,

                -- override the mason server-registration function
                -- server_registration = function(server, opts)
                --   require("lspconfig").setup(opts)
                -- end,

                -- Add overrides for LSP server settings, the keys are the name of the server
                ["server-settings"] = {
                        clangd = {
                                capabilities = {
                                        offsetEncoding = "utf-8",
                                },
                        },
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
                        ["<M-K>"] = { "<cmd>resize -15<CR>", desc = "Resize split up" },
                        ["<M-J>"] = { "<cmd>resize +15<CR>", desc = "Resize split down" },
                        ["<M-H>"] = { "<cmd>vertical resize -15<CR>", desc = "Resize split left" },
                        ["<M-L>"] = { "<cmd>vertical resize +15<CR>", desc = "Resize split right" },

                        ["<M-k>"] = { "<cmd>resize -2<CR>", desc = "Resize split up" },
                        ["<M-j>"] = { "<cmd>resize +2<CR>", desc = "Resize split down" },
                        ["<M-h>"] = { "<cmd>vertical resize -2<CR>", desc = "Resize split left" },
                        ["<M-l>"] = { "<cmd>vertical resize +2<CR>", desc = "Resize split right" },
                        --
                        -- ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
                        -- ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
                        -- ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
                        -- ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
                },
                -- t = {
                --         ["<C-Up>"] = false,
                --         ["<C-Down>"] = false,
                --         ["<C-Left>"] = false,
                --         ["<C-Right>"] = false,
                -- },
        },

        -- Configure plugins
        plugins = {

                ["neo-tree"] = {
                        filesystem = {
                                filtered_items = {
                                        visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
                                        hide_dotfiles = false,
                                        hide_gitignored = true,
                                },
                        },
                        event_handlers = {
                                {
                                        event = "vim_buffer_enter",
                                        handler = function()
                                                if vim.bo.filetype == "neo-tree" then
                                                        vim.cmd "setlocal relativenumber"
                                                        vim.cmd "setlocal nu rnu"
                                                end
                                        end,
                                },
                        },
                },

                init = {
                        {'RyanMillerC/better-vim-tmux-resizer'},
                        ["hrsh7th/nvim-cmp"] = { keys = { ":", "/", "?" } },
                        ["hrsh7th/cmp-cmdline"] = { after = "nvim-cmp" },
                        {
                                "hrsh7th/cmp-emoji",
                                after = "nvim-cmp",
                                config = function() astronvim.add_user_cmp_source "emoji" end,
                        },
                },
                treesitter = {
                        ensure_installed = { "lua" },
                },
                ["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
                        ensure_installed = { "clang_format" },
                },
                packer = {
                        compile_path = vim.fn.stdpath "data" .. "/packer_compiled.lua",
                },
                cmp = function(opts)
                        local cmp = require "cmp"

                        cmp.setup.cmdline({ "/", "?" }, {
                                mapping = cmp.mapping.preset.cmdline(),
                                sources = {
                                        { name = "buffer" },
                                },
                        })

                        cmp.setup.cmdline(":", {
                                mapping = cmp.mapping.preset.cmdline(),
                                sources = cmp.config.sources({
                                        { name = "path" },
                                }, {
                                        { name = "cmdline" },
                                }),
                        })

                        opts.mapping["<TAB>"] = cmp.mapping.confirm { select = false }

                        return opts
                end,
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
