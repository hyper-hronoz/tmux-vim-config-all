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
                        cursorcolumn = true,
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
                        bg = "#000000",
                },
                -- enable or disable highlighting for extra plugins
                plugins = {
                        aerial = false,
                        beacon = false,
                        bufferline = false,
                        dashboard = false,
                        highlighturl = false,
                        hop = false,
                        indent_blankline = false,
                        lightspeed = false,
                        ["neo-tree"] = false,
                        notify = false,
                        ["nvim-tree"] = false,
                        ["nvim-web-devicons"] = false,
                        rainbow = false,
                        symbols_outline = false,
                        telescope = false,
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
                        ["<leader>bs"] = { "<cmd>SmartResizeMode<cr>", desc = "Resize mode" },

                        ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
                        ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
                        ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
                        ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
                },
        },

        -- Configure plugins
        plugins = {
                heirline = function(config)
                        -- the first element of the default configuration table is the statusline
                        config[1] = {
                                -- set the fg/bg of the statusline
                                hl = { bg = "#000000", fg = "#000000" },
                                -- when adding the mode component, enable the mode text with padding to the left/right of it
                                astronvim.status.component.mode { mode_text = { padding = { left = 1, right = 1 } } },
                                -- add all the other components for the statusline
                                astronvim.status.component.git_branch(),
                                astronvim.status.component.file_info(),
                                astronvim.status.component.git_diff(),
                                astronvim.status.component.diagnostics(),
                                astronvim.status.component.fill(),
                                astronvim.status.component.macro_recording(),
                                astronvim.status.component.fill(),
                                astronvim.status.component.lsp(),
                                astronvim.status.component.treesitter(),
                                astronvim.status.component.nav(),
                        }
                        -- winbar
                        config[2] = {
                                fallthrough = false,
                                -- if the current buffer matches the following buftype or filetype, disable the winbar
                                {
                                        condition = function()
                                                return astronvim.status.condition.buffer_matches {
                                                        buftype = { "terminal", "prompt", "nofile", "help", "quickfix" },
                                                        filetype = { "NvimTree", "neo-tree", "dashboard", "Outline",
                                                                "aerial" },
                                                }
                                        end,
                                        init = function() vim.opt_local.winbar = nil end,
                                },
                                -- if the window is currently active, show the breadcrumbs
                                {
                                        condition = astronvim.status.condition.is_active,
                                        astronvim.status.component.breadcrumbs { hl = { fg = "#000000",
                                                bg = "#000000" } },
                                },
                                -- if the window is not currently active, show the file information
                                {
                                        astronvim.status.component.file_info {
                                                file_icon = { hl = false },
                                                hl = { fg = "#000000", bg = "#000000" },
                                                surround = false,
                                        },
                                },
                        }

                        return config
                end,

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
                        { "Mofiqul/dracula.nvim" },
                        { "ThePrimeagen/vim-be-good" },
                        {
                                "xiyaowong/nvim-transparent",
                                config = function()
                                        require("transparent").setup {
                                                -- enable = true, -- boolean: enable transparent
                                                -- extra_groups = { -- table/string: additional groups that should be cleared
                                                --         "BufferLineTabClose",
                                                --         "BufferlineBufferSelected",
                                                --         "BufferLineFill",
                                                --         "BufferLineBackground",
                                                --         "BufferLineSeparator",
                                                --         "BufferLineIndicatorSelected",
                                                -- },
                                                -- exclude = {}, -- table: groups you don't want to clear
                                        }
                                end,
                        },
                        { "RyanMillerC/better-vim-tmux-resizer" },
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
