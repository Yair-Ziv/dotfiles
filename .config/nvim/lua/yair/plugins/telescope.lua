-- Find, Filter, Preview, Pick. All lua, all the time.
return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim', build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1 -- Only load if `make` is available. Make sure you have the system requirements installed.
      end,
    },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim"
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local ts_builtin = require('telescope.builtin')
    local kmap = vim.keymap

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist
          }
        }
      }
    })

    local function find_git_root()
      -- Use the current buffer's path as the starting point for the git search
      local current_file = vim.api.nvim_buf_get_name(0)
      local current_dir
      local cwd = vim.fn.getcwd()
      -- If the buffer is not associated with a file, return nil
      if current_file == '' then
        current_dir = cwd
      else
        -- Extract the directory from the current file's path
        current_dir = vim.fn.fnamemodify(current_file, ':h')
      end

      -- Find the Git root directory from the current file's path
      local git_root = vim.fn.systemlist('git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')[1]
      if vim.v.shell_error ~= 0 then
        print 'Not a git repository. Searching on current working directory'
        return cwd
      end
      return git_root
    end

    -- Custom live_grep function to search in git root
    local function live_grep_git_root()
      local git_root = find_git_root()
      if git_root then
        ts_builtin.live_grep {
          search_dirs = { git_root },
        }
      end
    end

    vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})

    -- See `:help telescope.builtin`
    kmap.set('n', '<leader>?', ts_builtin.oldfiles, { desc = '[?] Find recently opened files' })
    kmap.set('n', '<leader><space>', ts_builtin.buffers, { desc = '[ ] Find existing buffers' })
    kmap.set('n', '<leader>/', function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      ts_builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    local function telescope_live_grep_open_files()
      ts_builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end
    kmap.set('n', '<leader>s/', telescope_live_grep_open_files, { desc = '[S]earch [/] in Open Files' })
    kmap.set('n', '<leader>ss', ts_builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    kmap.set('n', '<leader>gf', ts_builtin.git_files, { desc = 'Search [G]it [F]iles' })
    kmap.set('n', '<leader>sf', ts_builtin.find_files, { desc = '[S]earch [F]iles' })
    kmap.set('n', '<leader>sh', ts_builtin.help_tags, { desc = '[S]earch [H]elp' })
    kmap.set('n', '<leader>sw', ts_builtin.grep_string, { desc = '[S]earch current [W]ord' })
    kmap.set('n', '<leader>sg', ts_builtin.live_grep, { desc = '[S]earch by [G]rep' })
    kmap.set('n', '<leader>sG', ':LiveGrepGitRoot<CR>', { desc = '[S]earch by [G]rep on Git Root' })
    kmap.set('n', '<leader>sr', ts_builtin.resume, { desc = '[S]earch [R]esume' })
    kmap.set('n', '<leader>st', ':TodoTelescope<CR>', { desc = '[S]earch [T]odos' })

    telescope.load_extension("fzf")
  end
}
