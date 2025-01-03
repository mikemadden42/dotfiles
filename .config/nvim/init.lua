-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin configuration
require("lazy").setup({
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            vim.opt.background = 'dark'
            vim.cmd.colorscheme('gruvbox')
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }, -- optional, for icons
        config = function()
            require('lualine').setup({
                options = {
                    theme = 'gruvbox',
                    icons_enabled = true,
                    component_separators = { left = '', right = ''},
                    section_separators = { left = '', right = ''},
                },
                sections = {
                    lualine_a = {'mode'},
                    lualine_b = {'branch', 'diff', 'diagnostics'},
                    lualine_c = {'filename'},
                    lualine_x = {'encoding', 'fileformat', 'filetype'},
                    lualine_y = {'progress'},
                    lualine_z = {'location'}
                }
            })
        end
    }
})

------------------
-- Basic Settings
------------------
-- Indentation and Tabs
vim.opt.tabstop = 4        -- Width of tab character
vim.opt.softtabstop = 4    -- Fine-tunes amount of insert mode tab spacing
vim.opt.shiftwidth = 4     -- Number of spaces for indentation
vim.opt.expandtab = true   -- Convert tabs to spaces
vim.opt.laststatus = 2     -- Always show status line

-- Display and UI
vim.opt.number = true          -- Show line numbers
vim.opt.wrap = false           -- Disable line wrap
vim.opt.ruler = true           -- Show cursor position in status line
vim.opt.cursorline = true      -- Highlight current line

-- Show whitespace characters
vim.opt.list = true
vim.opt.listchars = {
    tab = '‣ ',
    trail = '·',
    precedes = '«',
    extends = '»',
    eol = '¬'
}

-- Search settings
vim.opt.hlsearch = true    -- Highlight search matches
vim.opt.incsearch = true   -- Show matches while typing
vim.opt.ignorecase = true  -- Case insensitive search
vim.opt.smartcase = true   -- Unless uppercase is used

-- Security
vim.opt.modeline = false   -- Disable modeline

-- Performance
vim.opt.updatetime = 250   -- Faster completion
vim.opt.timeoutlen = 300   -- Faster key sequence completion
