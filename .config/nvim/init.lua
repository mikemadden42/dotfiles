-- First lines of init.lua
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
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
            vim.opt.background = "dark"
            -- vim.opt.background = "light"
            vim.cmd.colorscheme("gruvbox")
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional, for icons
        config = function()
            require("lualine").setup({
                options = {
                    theme = "gruvbox",
                    icons_enabled = true,
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diff", "diagnostics" },
                    lualine_c = { "filename" },
                    lualine_x = { "encoding", "fileformat", "filetype" },
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                },
            })
        end,
    },
    {
        "fatih/vim-go",
        config = function()
            -- Use goimports instead of gofmt for automatic import management
            vim.g.go_fmt_command = "goimports"

            -- Enable syntax highlighting for types (int, string, struct, etc.)
            vim.g.go_highlight_types = 1

            -- Enable syntax highlighting for struct fields
            vim.g.go_highlight_fields = 1

            -- Enable syntax highlighting for function names
            vim.g.go_highlight_functions = 1
        end,
    },
    { "tpope/vim-fugitive" },
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        keys = {
            { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
            { "<leader>fe", "<cmd>NvimTreeFindFile<CR>", desc = "Find file in explorer" },
        },
        config = function()
            -- Disable netrw (Vim's built-in file explorer)
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            -- Set termguicolors to enable highlight groups
            vim.opt.termguicolors = true

            require("nvim-tree").setup({
                sort_by = "case_sensitive",
                view = {
                    width = 30,
                },
                renderer = {
                    group_empty = true,
                    icons = {
                        show = {
                            file = true,
                            folder = true,
                            folder_arrow = true,
                            git = true,
                        },
                    },
                    indent_markers = {
                        enable = true,
                    },
                },
                filters = {
                    dotfiles = false,
                },
                git = {
                    enable = true,
                    ignore = false,
                },
                actions = {
                    open_file = {
                        quit_on_open = false,
                        resize_window = true,
                    },
                },
                update_focused_file = {
                    enable = true,
                    update_root = false,
                },
            })

            -- Auto close nvim-tree when it's the last window
            vim.api.nvim_create_autocmd("BufEnter", {
                nested = true,
                callback = function()
                    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
                        vim.cmd("quit")
                    end
                end,
            })
        end,
    },
})

------------------
-- Basic Settings
------------------
-- Indentation and Tabs
vim.opt.tabstop = 4 -- Width of tab character
vim.opt.softtabstop = 4 -- Fine-tunes amount of insert mode tab spacing
vim.opt.shiftwidth = 4 -- Number of spaces for indentation
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.laststatus = 2 -- Always show status line

-- Display and UI
vim.opt.number = true -- Show line numbers
vim.opt.wrap = false -- Disable line wrap
vim.opt.ruler = true -- Show cursor position in status line
vim.opt.cursorline = true -- Highlight current line

-- Show whitespace characters
vim.opt.list = true
vim.opt.listchars = {
    tab = "‣ ",
    trail = "·",
    precedes = "«",
    extends = "»",
    eol = "¬",
}

-- Search settings
vim.opt.hlsearch = true -- Highlight search matches
vim.opt.incsearch = true -- Show matches while typing
vim.opt.ignorecase = true -- Case insensitive search
vim.opt.smartcase = true -- Unless uppercase is used

-- Security
vim.opt.modeline = false -- Disable modeline

-- Performance
vim.opt.updatetime = 250 -- Faster completion
vim.opt.timeoutlen = 300 -- Faster key sequence completion

-- Enable syntax highlighting
vim.cmd("syntax on")

-- Enable 256 colors
vim.opt.termguicolors = true -- Better color support than t_Co=256

-- Optional: Disable space's default behavior
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
