local config = {
  -- Add plugins
  plugins = {
    init = {
      { "ellisonleao/glow.nvim" },
      {
        "20k-ultra/sonokai",
        config = function()
          vim.api.nvim_set_var("sonokai_style", "20k-ultra")
          vim.cmd "colorscheme sonokai"
        end,
      },
    },
    treesitter = {
      ensure_installed = { "lua" },
    },
    bufferline = {
      options = {
        show_buffer_close_icons = false,
        show_buffer_icons = false,
        show_close_icon = false,
      },
    },
    packer = {
      compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
    },
  },

  diagnostics = {
    virtual_text = true,
  },

  -- Disable default plugins
  enabled = {
    bufferline = true,
    nvim_tree = true,
    lualine = true,
    lspsaga = true,
    gitsigns = true,
    colorizer = true,
    toggle_term = true,
    comment = true,
    symbols_outline = true,
    indent_blankline = true,
    dashboard = true,
    which_key = true,
    neoscroll = false,
    ts_rainbow = true,
    ts_autotag = true,
  },

  polish = function()
    local opts = { noremap = true, silent = true }
    local map = vim.api.nvim_set_keymap
    local set = vim.opt

    -- Set options
    set.relativenumber = false
    set.mouse = ""
    set.list = false
    set.listchars = {
      tab = "│→",
      extends = "⟩",
      precedes = "⟨",
      trail = "·",
      nbsp = "␣",
    }
    set.showbreak = "↪ "
    set.wrap = true
    set.linebreak = true
    --
    -- Set key bindings
    map("n", "<C-s>", ":w!<CR>", opts)

    -- Set autocommands
    vim.cmd [[
      augroup packer_conf
        autocmd!
        autocmd bufwritepost plugins.lua source <afile> | PackerSync
      augroup end
    ]]
  end,
}

return config
