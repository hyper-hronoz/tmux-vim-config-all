return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },
  options = {
    opt = {
      relativenumber = true, -- sets vim.opt.relativenumber
      clipboard = "", -- Connection to the system clipboard
      tabstop = 2,
      shiftwidth = 2,
      showtabline = 2,
      cursorcolumn = false,
      cursorline = false,
    },
    g = {
      mapleader = " ", -- sets vim.g.mapleader
    },
  },
  -- Set colorscheme to use
  colorscheme = "catppuccin-mocha",
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },
  lsp = {
    config = {
      clangd = {
        capabilities = {
          offsetEncoding = "utf-8",
        },
      },
    },
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = false, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },
  mappings = {
    n = {
      ["<leader>bs"] = { "<cmd>SmartResizeMode<cr>", desc = "Resize mode" },
      ["<leader>lp"] = { "<cmd>LspStop<cr>", desc = "Stop lsp" },
      ["<leader>lP"] = { "<cmd>LspStart<cr>", desc = "Start lsp" },
      ["<S-l>"] = {
        function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
        desc = "Next buffer",
      },
      ["<S-h>"] = {
        function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
        desc = "Previous buffer",
      },
    },
  },
  plugins = {
    "p00f/clangd_extensions.nvim", -- install lsp plugin
    ["nvim-ts-autotag"] = {
      filetypes = { "html", "xml", "kit" },
    },
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        ensure_installed = { "clangd" }, -- automatically install lsp
      },
    },
    { "nyoom-engineering/nyoom.nvim" },
    { "ray-x/starry.nvim" },
    { "nvim-treesitter/playground" },
    { "Djancyp/better-comments.nvim" },
    { "nathom/filetype.nvim" },
    -- ["rcarriga/nvim-notify"] = { disable = true },
    { "lervag/vimtex" },
    { "dhruvasagar/vim-table-mode" },
    { "rbtnn/vim-game_engine" },
    { "rbtnn/vim-mario" },
    { "mg979/vim-visual-multi" },
    { "catppuccin/nvim", lazy = false, name = "catppuccin" },
    { "Rasukarusan/nvim-select-multi-line" },
    { "Mofiqul/dracula.nvim", lazy = false },
    { 
      "derektata/lorem.nvim",
      lazy = false,
      config = function ()
        require("lorem").setup({
          sentenceLength = "mixedShort",
          comma = 0.1
        })
      end
    },
    { "navarasu/onedark.nvim" },
    { "ThePrimeagen/vim-be-good" },
    { "RyanMillerC/better-vim-tmux-resizer" },
    ["hrsh7th/cmp-cmdline"] = { after = "nvim-cmp" },
    {
      "hrsh7th/cmp-emoji",
      after = "nvim-cmp",
      config = function() astronvim.add_user_cmp_source "emoji" end,
    },
    {
      -- override nvim-cmp plugin
      "hrsh7th/nvim-cmp",
      keys = { ":", "/", "?" }, -- lazy load cmp on more keys along with insert mode
      dependencies = {
        "hrsh7th/cmp-cmdline", -- add cmp-cmdline as dependency of cmp
      },
      config = function(_, opts)
        local cmp = require "cmp"
        -- run cmp setup
        cmp.setup(opts)

        -- configure `cmp-cmdline` as described in their repo: https://github.com/hrsh7th/cmp-cmdline#setup
        cmp.setup.cmdline("/", {
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
            {
              name = "cmdline",
              option = {
                ignore_cmds = { "Man", "!" },
              },
            },
          }),
        })
      end,
    },
    {
      "nvim-neo-tree/neo-tree.nvim",
      config = function()
        require("neo-tree").setup {
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
                  local run_relative = "setlocal relativenumber"
                  local run_numbers = "setlocal nu rnu"
                  vim.cmd(run_relative)
                  vim.cmd(run_numbers)
                end
              end,
            },
          },
        }
      end,
    },
    {
      "goolord/alpha-nvim",
      opts = function(_, opts) -- override the options using lazy.nvim
        opts.section.header.val = { -- change the header section value

          "██╗  ██╗██████╗  ██████╗ ███╗   ██╗ ██████╗ ███████╗",
          "██║  ██║██╔══██╗██╔═══██╗████╗  ██║██╔═══██╗╚══███╔╝",
          "███████║██████╔╝██║   ██║██╔██╗ ██║██║   ██║  ███╔╝ ",
          "██╔══██║██╔══██╗██║   ██║██║╚██╗██║██║   ██║ ███╔╝  ",
          "██║  ██║██║  ██║╚██████╔╝██║ ╚████║╚██████╔╝███████╗",
          "╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝ ╚══════╝",
        }
      end,
    },
  },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
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
