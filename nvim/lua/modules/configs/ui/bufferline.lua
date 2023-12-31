return function()
  local icons = { ui = require('modules.utils.icons').get 'ui' }

  local opts = {
    options = {
      number = nil,
      modified_icon = icons.ui.Modified,
      buffer_close_icon = icons.ui.Close,
      left_trunc_marker = icons.ui.Left,
      right_trunc_marker = icons.ui.Right,
      max_name_length = 14,
      max_prefix_length = 13,
      tab_size = 20,
      color_icons = true,
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
      show_tab_indicators = true,
      enforce_regular_tabs = true,
      persist_buffer_sort = true,
      always_show_bufferline = true,
      separator_style = 'thin',
      diagnostics = 'nvim_lsp',
      diagnostics_indicator = function(count)
        return '(' .. count .. ')'
      end,
      offsets = {
        {
          filetype = 'NvimTree',
          text = 'File Explorer',
          text_align = 'center',
          padding = 1,
        },
        {
          filetype = 'lspsagaoutline',
          text = function()
            return vim.fn.getcwd()
          end,
          text_align = 'center',
          padding = 1,
        },
      },
    },
    -- Change bufferline's highlights here! See `:h bufferline-highlights` for detailed explanation.
    -- Note: If you use catppuccin then modify the colors below!
    highlights = {},
  }

  if vim.g.colors_name == 'catppuccin' then
    local cp = require('modules.utils').get_palette() -- Get the palette.

    local catppuccin_hl_overwrite = {
      highlights = require('catppuccin.groups.integrations.bufferline').get {
        styles = { 'italic', 'bold' },
        custom = {
          mocha = {
            -- Hint
            hint = { fg = cp.rosewater },
            hint_visible = { fg = cp.rosewater },
            hint_selected = { fg = cp.rosewater },
            hint_diagnostic = { fg = cp.rosewater },
            hint_diagnostic_visible = { fg = cp.rosewater },
            hint_diagnostic_selected = { fg = cp.rosewater },
          },
        },
      },
    }

    opts = vim.tbl_deep_extend('force', opts, catppuccin_hl_overwrite)
  end

  -- Fix bufferline unavailability when displaying alpha.
  -- ref: https://github.com/akinsho/bufferline.nvim/issues/631#issuecomment-1341583854
  vim.api.nvim_create_autocmd('User', {
    pattern = 'AlphaReady',
    desc = 'disable tabline for alpha',
    callback = function()
      vim.opt.showtabline = 0
    end,
  })
  vim.api.nvim_create_autocmd('BufUnload', {
    desc = 'enable tabline after alpha',
    callback = function()
      vim.opt.showtabline = 2
    end,
  })

  require('bufferline').setup(opts)
end
