-- .Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal current directory', silent = true },
  },
  opts = {
    -- add_blank_line_at_top = true, -- Add a blank line at the top of the tree.
    -- auto_clean_after_session_restore = false, -- Automatically clean up broken neo-tree buffers saved in sessions
    close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
    default_source = 'last', -- you can choose a specific source `last` here which indicates the last used source
    source_selector = {
      winbar = true,
      statusline = false,
    },
    filesystem = {
      filtered_items = {
        visible = true, -- When true, they will just be displayed differently than normal items.
        show_hidden_count = true, -- when true, the number of hidden items in each folder will be shown as the last entry
        hide_dotfiles = false,
        -- hide_gitignored = true,
        hide_hidden = false, -- Only works on Windows for hidden files/directories.
        -- never_show = {}, -- remains hidden even if visible is toggled to true, this overrides always_show.
        -- hide_by_name = {
        --   -- '.DS_Store',
        --   -- 'thumbs.db',
        --   "node_modules",
        --   ".history"
        -- },
      },
      -- find_command = 'fd', -- this is determined automatically, you probably don't need to set it
      find_args = function(cmd, path, search_term, args)
        if cmd ~= 'fd' then
          return args
        end
        -- Include files from: .gitignore, .ignore, etc.
        -- table.insert(args, '--no-ignore')
        -- Include hidden files, i.e. dotfiles.
        table.insert(args, '--hidden')
        -- Exclude .git files.
        table.insert(args, '--exclude')
        table.insert(args, '.git')
        -- Exclude .history files.
        table.insert(args, '--exclude')
        table.insert(args, '.history')
        -- Exclude .next files.
        table.insert(args, '--exclude')
        table.insert(args, '.next')
        -- Exclude .turbo files.
        table.insert(args, '--exclude')
        table.insert(args, '.turbo')
        -- Exclude node_modules
        table.insert(args, '--exclude')
        table.insert(args, 'node_modules')
        -- Exclude more for short search terms, or vary based on the directory.
        -- if string.len(search_term) < 4 and path == '~' then
        --   table.insert(args, '--exclude')
        --   table.insert(args, 'Library')
        -- end
        return args
      end,
      -- find_args = { -- you can specify extra args to pass to the find command.
      --   fd = {
      --     '--hidden',
      --     '--exclcude',
      --     '.git', -- Do not show .git files.
      --     -- 'no-ignore'
      --   },
      -- },
      follow_current_file = {
        -- This will find and focus the file in the active buffer every time
        -- the current file is changed while the tree is open.
        enabled = false,

        -- `false` closes auto expanded dirs, such as with `:Neotree reveal`.
        leave_dirs_open = true,

        -- This will use the OS level file watchers to detect changes
        -- instead of relying on nvim autocmd events.
        use_libuv_file_watcher = true,
      },
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },
}
