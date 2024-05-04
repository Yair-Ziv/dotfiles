return {
  'goolord/alpha-nvim',
  config = function ()
    local alpha = require('alpha')
    local dashboard = require('alpha.themes.dashboard')

    local icons = require('yair.utils.icons').icons
    local header_banner = require('yair.utils.alpha-headers')

    local section_header = {
      type = 'text',
      val = header_banner,
      opts = {
        position = 'center',
        hl = 'Type'
      }
    }

    local section_buttons = {
      type = 'group',
      val = {
        { type = 'text', val = 'Quick Links', opts = { hl = 'SpecialComment', position = 'center' } },
        { type = 'padding', val = 1 },
        dashboard.button( 'e', icons.kinds.new.File .. '> New file' , ':enew<CR>' ),
        dashboard.button( 'o', icons.ui.files .. '> View old files', ':Telescope oldfiles<CR>' ),
        dashboard.button( '<SPC> e e', icons.ui.open_folder .. '> Open file explorer' ),
        dashboard.button( '<SPC> s f', icons.kinds.new.FindFIle .. '> Search for file' ),
        dashboard.button( 'l', icons.kinds.custom_icons.Lazy .. '> Open Lazy', ':Lazy<CR>' ),
        dashboard.button( 'q', icons.ui.buffer_close .. '> Close NVIM', ':qa<CR>' )
      },
      position = 'center'
    }

    -- MRU
    local default_mru_ignore = { 'gitcommit' }

    local mru_opts = {
      ignore = function(path, ext)
        return (string.find(path, 'COMMIT_EDITMSG')) or (vim.tbl_contains(default_mru_ignore, ext))
      end,
      autocd = false
    }

    local path_ok, plenary_path = pcall(require, 'plenary.path')
    if not path_ok then
        return
    end

    local cdir = vim.fn.getcwd()
    local if_nil = vim.F.if_nil

    local function get_extension(fn)
        local match = fn:match('^.+(%..+)$')
        local ext = ''
        if match ~= nil then
            ext = match:sub(2)
        end
        return ext
    end

    local nvim_web_devicons = {
      enabled = true,
      highlight = true
    }

    local function icon(fn)
        local nwd = require("nvim-web-devicons")
        local ext = get_extension(fn)
        return nwd.get_icon(fn, ext, { default = true })
    end

    local function file_button(fn, sc, short_fn,autocd)
        short_fn = short_fn or fn
        local ico_txt
        local fb_hl = {}

        if nvim_web_devicons.enabled then
            local ico, hl = icon(fn)
            local hl_option_type = type(nvim_web_devicons.highlight)
            if hl_option_type == 'boolean' then
                if hl and nvim_web_devicons.highlight then
                    table.insert(fb_hl, { hl, 0, #ico })
                end
            end
            if hl_option_type == 'string' then
                table.insert(fb_hl, { nvim_web_devicons.highlight, 0, #ico })
            end
            ico_txt = ico .. '  '
        else
            ico_txt = ''
        end
        local cd_cmd = (autocd and ' | cd %:p:h' or '')
        local file_button_el = dashboard.button(sc, ico_txt .. short_fn, '<cmd>e ' .. vim.fn.fnameescape(fn) .. cd_cmd ..' <CR>')
        local fn_start = short_fn:match('.*[/\\]')
        if fn_start ~= nil then
            table.insert(fb_hl, { 'Comment', #ico_txt - 2, #fn_start + #ico_txt })
        end
        file_button_el.opts.hl = fb_hl
        return file_button_el
    end

    local function mru(start, cwd, items_number, opts)
      opts = opts or mru_opts
      items_number = if_nil(items_number, 10)

      local oldfiles = {}
      for _, v in pairs(vim.v.oldfiles) do
        if #oldfiles == items_number then
          break
        end
        local cwd_cond
        if not cwd then
          cwd_cond = true
        else
          cwd_cond = vim.startswith(v, cwd)
        end
        local ignore = (opts.ignore and opts.ignore(v, get_extension(v)))
        if (vim.fn.filereadable(v) == 1) and cwd_cond and not ignore then
          oldfiles[#oldfiles + 1] = v
        end
      end
      local target_width = 35

      local tbl = {}
      for i, fn in ipairs(oldfiles) do
        local short_fn
        if cwd then
          short_fn = vim.fn.fnamemodify(fn, ':.')
        else
          short_fn = vim.fn.fnamemodify(fn, ':~')
        end

        if #short_fn > target_width then
          short_fn = plenary_path.new(short_fn):shorten(1, { -2, -1 })
          if #short_fn > target_width then
            short_fn = plenary_path.new(short_fn):shorten(1, { -1 })
          end
        end

        local shortcut = tostring(i + start - 1)

        local file_button_el = file_button(fn, shortcut, short_fn,opts.autocd)
        tbl[i] = file_button_el
      end
      return {
        type = 'group',
        val = tbl,
        opts = {},
      }
    end

    local section_mru = {
      type = 'group',
      val = {
        {
          type = 'text',
          val = 'Recent Files',
          opts = {
            hl = 'SpecialComment',
            shrink_margin = false,
            position = 'center'
          }
        },
        { type = 'padding', val = 1 },
        {
          type = 'group',
          val = function()
            return { mru(0, cdir) }
          end,
          opts = { shrink_margin = false }
        }
      }
    }

    local config = {
      layout = {
        { type = 'padding', val = 2},
        section_header,
        { type = 'padding', val = 2},
        section_mru,
        { type = 'padding', val = 2},
        section_buttons
      }
    }

    alpha.setup(config)
  end
};
