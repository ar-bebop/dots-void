-- BARS
-- Status bar, buffers line, tabs, etc.

local colors = require('colors')

local theme = {
  normal = {
    a = { fg = colors.base00, bg = colors.base05 },
    b = { fg = colors.base05, bg = colors.base00 },
    c = { fg = colors.base05, bg = nil },
  },

  insert = { a = { fg = colors.base00, bg = colors.base0B } },
  visual = { a = { fg = colors.base00, bg = colors.base0E } },
  replace = { a = { fg = colors.base00, bg = colors.base0F } },
  command = { a = { fg = colors.base00, bg = colors.base09 } },

  inactive = {
    a = { fg = colors.base05, bg = colors.base00 },
    b = { fg = colors.base05, bg = colors.base02 },
    c = { fg = colors.base02, bg = nil },
  },
}


local opts = {
    options = {
        theme = theme,
        icons_enabled = true,
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '▓▒░', right = '░▒▓' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {
            'mode',
        },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {
            {
                'filename',
                file_status = true,    -- Displays file status (readonly status, modified status)
                newfile_status = true, -- Display new file status (new file means no write after created)
                path = 3,
                shorting_target = 40,  -- Shortens path to leave 40 spaces in the window
                symbols = {
                    modified = '[+]',  -- Text to show when the file is modified.
                    readonly = '[-]',  -- Text to show when the file is non-modifiable or readonly.
                    unnamed = '[?]',   -- Text to show for unnamed buffers.
                    newfile = '[!]',   -- Text to show for newly created file before first write
                },
            },
            {
                'windows',
                show_filename_only = true,   -- Shows shortened relative path when set to false.
                show_modified_status = true, -- Shows indicator when the window is modified.
                mode = 2,
                filetype_names = {
                    TelescopePrompt = 'Telescope',
                    NvimTree = 'Tree',
                    dashboard = 'Dashboard',
                    packer = 'Packer',
                    fzf = 'FZF',
                    alpha = 'Alpha'
                }, -- Shows specific window name for that filetype ( { `filetype` = `window_name`, ... } )
            }
        },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'searchcount', 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {
        lualine_a = {
            {
                'buffers',
                mode = 0,
                filetype_names = {
                    TelescopePrompt = 'Telescope',
                    NvimTree = 'Tree',
                    dashboard = 'Dashboard',
                    packer = 'Packer',
                    fzf = 'FZF',
                    alpha = 'Alpha'
                },
                symbols = {
                    modified = '~~',
                    alternate_file = '#|',
                }
            }
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'tabs' }
    },
    winbar = {},
    inactive_winbar = {},
    extensions = { 'fzf', 'lazy', 'nvim-tree' }
}

return {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = opts
}
