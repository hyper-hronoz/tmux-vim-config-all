--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key

local config = {
  plugins = {
    init = {
      { "joshdick/onedark.vim" }, -- each table entry is a plugin using the Packer syntax without the "use"
      {"junegunn/fzf"},
      {
        "christoomey/vim-tmux-navigator", config = function ()
          
        end
      }, -- each table entry is a plugin using the Packer syntax without the "use"
      {
        'gelguy/wilder.nvim',
        config= function ()
                    local wilder = require('wilder')

          wilder.setup({modes = {':', '/', '?'}})

          -- wilder.set_option("renderer", wilder.popupmenu_renderer({
          --   -- highlighter applies highlighting to the candidates
          --   highlighter = wilder.basic_highlighter(),
          -- }))

        end
      }
    },
  },

  options = {
    opt = {
    },
  },

  mappings = {
    n = {
      ["C-h"] = { ":TmuxNavigateLeft<cr>", desc = "FUCK"},
      ["C-j"] = { ":TmuxNavigateDown<cr>", desc = "FUCK"},
      ["C-k"] = { ":TmuxNavigateUp<cr>", desc = "FUCK"},
      ["C-l"] = { ":TmuxNavigateRight<cr>", desc = "FUCK"},
      ["<leader>ff"] = { ":FZF<cr>", desc = "FUCK"},
    },
    t = {
    }
  },
}

return config
