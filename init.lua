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
            cursorcolumn = false,
            cursorline = false,
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
            bg = "#000000",
            black = "#000000", -- вот эта херня подсветка при переключениях
            black_1 = "#1f1f25",
            green = "#98c379",
            green_1 = "#89b06d",
            green_2 = "#95be76",
            white = "#dedede",
            white_1 = "#afb2bb",
            white_2 = "#c9c9c9",
            blue = "#ffffff",
            blue_1 = "#40d9ff",
            blue_2 = "#1b1f27",
            blue_3 = "#8094B4",
            blue_4 = "#90c7f3",
            orange = "#d19a66",
            orange_1 = "#ff9640",
            orange_2 = "#ff8800",
            yellow = "#e5c07b",
            yellow_1 = "#ebae34",
            yellow_2 = "#d1b071",
            red = "#e06c75",
            red_1 = "#ec5f67",
            red_2 = "#ffbba6",
            red_3 = "#cc626a",
            red_4 = "#d47d85",
            red_5 = "#e9989e",
            grey = "#5c6370",
            grey_1 = "#4b5263",
            grey_2 = "#777d86",
            grey_3 = "#282c34",
            grey_4 = "#000000",
            grey_5 = "#3e4452",
            grey_6 = "#3b4048",
            grey_7 = "#5c5c5c",
            grey_8 = "#252931",
            grey_9 = "#787e87",
            grey_10 = "#D3D3D3",
            gold = "#ffcc00",
            cyan = "#56b6c2",
            cyan_1 = "#88cbd4",
            purple = "#c678dd",
            purple_1 = "#a9a1e1",
            purple_2 = "#c2bdea",
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

            ["<leader>vv"] = { "<cmd>call sml#mode_on()<cr>", desc = "Multiple selection" },

            ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
            ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
            ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
            ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },

            ["<leader>dash"] = { function() require("alpha").start() end, desc = "Alpha Dashboard" },

            ["<leader>lp"] = { "<cmd>LspStop<cr>", desc = "Stop lsp" },
            ["<leader>lP"] = { "<cmd>LspStart<cr>", desc = "Start lsp" },
        },
    },

    -- Configure plugins
    plugins = {
        ["mason-nvim-dap"] = {
            ensure_installed = { "python", "cpp" },
        },

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
                            vim.cmd("setlocal relativenumber")
                            vim.cmd("setlocal nu rnu")
                        end
                    end,
                },
            },
        },

        init = {
            {"lervag/vimtex"},
            {"dhruvasagar/vim-table-mode"},
            {"rbtnn/vim-game_engine"},
            {"rbtnn/vim-mario"},
            {"mg979/vim-visual-multi"},
            {"Rasukarusan/nvim-select-multi-line"},
            { "Mofiqul/dracula.nvim" },
            {"derektata/lorem.nvim"},
            { "navarasu/onedark.nvim" },
            { "ThePrimeagen/vim-be-good" },
            { "catppuccin/nvim", as = "catppuccin" },
            { "RyanMillerC/better-vim-tmux-resizer" },
            ["hrsh7th/nvim-cmp"] = { keys = { ":", "/", "?" } },
            ["hrsh7th/cmp-cmdline"] = { after = "nvim-cmp" },
            {
                "hrsh7th/cmp-emoji",
                after = "nvim-cmp",
                config = function() astronvim.add_user_cmp_source "emoji" end,
            },
        },
        ["indent-o-matic"] = {
            max_lines = 2048,
            standard_widths = { 4 },
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

        local dracula = require "dracula"
        dracula.setup {
            -- customize dracula color palette
            colors = {
                bg = "#000000",
                fg = "#F8F8F2",
                comment = "#6272A4",
                red = "#FF5555",
                orange = "#FFB86C",
                yellow = "#F1FA8C",
                green = "#50fa7b",
                purple = "#BD93F9",
                cyan = "#8BE9FD",
                pink = "#FF79C6",
                bright_red = "#FF6E6E",
                bright_green = "#69FF94",
                bright_yellow = "#FFFFA5",
                bright_blue = "#D6ACFF",
                bright_magenta = "#FF92DF",
                bright_cyan = "#A4FFFF",
                bright_white = "#FFFFFF",
                menu = "#000000",
            },
            -- show the '~' characters after the end of buffers
            show_end_of_buffer = true, -- default false
            -- use transparent background
            transparent_bg = true, -- default false
            -- set custom lualine background color
            lualine_bg_color = "#000000", -- default nil
            -- set italic comment
            italic_comment = true, -- default false
            -- overrides the default highlights see `:h synIDattr`
            overrides = {
                -- Examples
                -- NonText = { fg = dracula.colors().white }, -- set NonText fg to white
                -- NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
                -- Nothing = {} -- clear highlight of Nothing
            },
        }

        -- vim.cmd.colorscheme "dracula"
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
