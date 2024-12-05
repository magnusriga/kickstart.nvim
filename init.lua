--[[

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

What is Kickstart?

  Kickstart.nvim is *not* a distribution.

  Kickstart.nvim is a starting point for your own configuration.
    The goal is that you can read every line of code, top-to-bottom, understand
    what your configuration is doing, and modify it to suit your needs.

    Once you've done that, you can start exploring, configuring and tinkering to
    make Neovim your own! That might mean leaving Kickstart just the way it is for a while
    or immediately breaking it into modular pieces. It's up to you!

    If you don't know anything about Lua, I recommend taking some time to read through
    a guide. One possible example which will only take 10-15 minutes:
      - https://learnxinyminutes.com/docs/lua/

    After understanding a bit more about Lua, you can use `:help lua-guide` as a
    reference for how Neovim integrates Lua.
    - :help lua-guide
    - (or HTML version): https://neovim.io/doc/user/lua-guide.html

Kickstart Guide:

  TODO: The very first thing you should do is to run the command `:Tutor` in Neovim.

    If you don't know what this means, type the following:
      - <escape key>
      - :
      - Tutor
      - <enter key>

    (If you already know the Neovim basics, you can skip this step.)

  Once you've completed that, you can continue working through **AND READING** the rest
  of the kickstart init.lua.

  Next, run AND READ `:help`.
    This will open up a help window with some basic information
    about reading, navigating and searching the builtin help documentation.

    This should be the first place you go to look when you're stuck or confused
    with something. It's one of my favorite Neovim features.

    MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
    which is very useful when you're not exactly sure of what you're looking for.

  I have left several `:help X` comments throughout the init.lua
    These are hints about where to find more information about the relevant settings,
    plugins or Neovim features used in Kickstart.

   NOTE: Look for lines like this

    Throughout the file. These are for you, the reader, to help you understand what is happening.
    Feel free to delete them once you know what you're doing, but they should serve as a guide
    for when you are first encountering a few different constructs in your Neovim config.

If you experience any errors while trying to install kickstart, run `:checkhealth` for more info.

I hope you enjoy your Neovim journey,
- TJ

P.S. You can delete this when you're done too. It's your config now! :)
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
-- vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching, UNLESS \C or search term has one or more capital letters.
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- When jumping to quickfix items, e.g. after vimgrep, show buffer in new split window,
-- unless it is already open, in which case open window is used.
-- Do not open new splits, it is not efficient when rapidly going through list.
-- vim.opt.switchbuf:append { 'vsplit' }

-- Substitute all matches on each line, not just first, wihout having to specify /g.
-- `%/replaceMe/newText/c` will consider all matches in each line.
vim.opt.gdefault = true

-- When <tab> completion is used on wildcards, first show list, then autocomplete.
-- vim.opt.wildmode = 'list:full'

-- Wildcards, e.g. when used in {file}, should not expand into node_moduels.
-- **/node_modules/** works for all leves.
-- Dotfiles and folders are excluded from wildcard expansion list by default, but will be auto-completed if file starts with dot: .<tab>.
vim.opt.wildignore:append { '**/node_modules/**' }

-- Ignore case when completing file names and directories.
-- Has no effect when 'fileignorecase' is set.
-- Does not apply when the shell is used to expand wildcards, which happens when there are special characters.
vim.opt.wildignorecase = true

-- :find will start its search from path.
--
-- Default path value is .,, which means folder of current file, and current working directory (cwd, print with: pwd).
-- vim.opt.path:append { '**' }
vim.opt.path = '.,,**'

-- Allow indents to define folds automatically.
-- Start with all folds open.
-- foldlevelstart is ignored in diff mode, where all folds are closed by default.
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = 'indent'

-- Make vim diff windows vertical by default.
vim.opt.diffopt:append { 'vertical' }

-- Set absoute width of lines, similar to wrapmargin.
-- Wrapmargin is relative to screen width, whereas textwidth is absolute.
-- Wrapmargin is not used when textwidth is set.
-- textwidth only applies to newly inserted text, not existing text.
-- Use formatoptions to decide which type of code is broken with linewidth.
-- Prefer wrap or linebreak, which do NOT insert EOL, but just visually drops text to next line.
-- Use fomatoptions to decide which lines textwidth and "gq" applies to.
-- Default formatoptions is supposedly tcqj, but ours is magically set to: cqjrol.
-- Good: textwidth=90, formatoptions=cqjrol.
-- formatoptions options (:h fo-table):
-- t: Text.
-- c: Comments.
-- q: Allow formatting of comments with gq.
-- j: Remove comment leader when joining lines.
-- r: Automatically insert comment leader when hitting Enter in Insert mode.
-- o: Automatically insert comment leader when hitting o or O in Normal mode.
-- l: Lines are not broken when cursor gets to end of textwidth,
--    when they are already longer than textwidth when starting insert mode.
-- n: When formatting text (also comments), lists are recognized using
--    opt.formatlistpat, so indent is applied to next list matching indent of text
--    on first list line
vim.opt.textwidth = 90
vim.opt.formatoptions = 'cqjroln'

-- Use literal string to avoid having to escape all parts of string, and escape special
-- characters in formatlistpat.
vim.opt.formatlistpat = [[^\s*\(\d\|\*\|-\)\+[\]:.)}\t ]\s*]]

-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3

-- Increase ttimoutlen from 50ms to 100ms.
-- vim.opt.ttimeoutlen = 100
-- Winbar set automatically by plugins.
-- viv.opt.winbar = true

-- Make Vim auto-write buffer to file, whenever we are abandoning buffer.
-- With the less intrusive opt.autowrite, edit, quit, etc. will not cause auto-write.
-- Better than setting hidden to off, as Vim would then have to re-load file every time it is opened.
-- vim.opt.autowriteall = true

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps and settings.
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float, { desc = 'Open diagnostic float, twice to focus' })
vim.diagnostic.config { virtual_text = false, severity_sort = true }

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc.
-- Try your own mapping or just use <C-\><C-n> to exit terminal mode.
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Save session, and reopen when Vim starts.
vim.api.nvim_create_autocmd('VimLeave', {
  desc = 'Save session when Vim closes.',
  group = vim.api.nvim_create_augroup('save-session', { clear = true }),
  callback = function()
    vim.cmd 'mksession! ~/.vim/sessions/shutdown_session.vim'
  end,
})

-- Keymap to load previously saved session.
vim.keymap.set('n', '<F7>', ':source ~/.vim/shutdown_session.vim', { desc = 'Load previous session...' })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Set custom filetypes for specific files, by extension, filename, or pattern.
vim.filetype.add {
  filename = {
    ['.shrc'] = 'sh',
  },
}

-- Never request typescript-language-server for formatting
-- vim.lsp.buf.format {
--   filter = function(client)
--     return client.name ~= 'tsserver'
--   end,
-- }

-- Add fzf to runtimepath.
-- When nvim starts, it automatically runs files in certain folders within paths in the
-- runtimepath list. See `:h startup`.
-- As an example, when nvim starts it finds all `plugin` folders within paths in `runtimepath`,
-- then executes all `.lua` and `.vim` files within those `plugin` folders.
-- Thus, when the `fzf` folder is added to runtime path, `fzf/plugins/fzf.vim` is executed,
-- which runs the fzf shell command inside vim, I think? the is added to  f[older is added to runtimepath, the command `:ru[ntime][!] [where] {file}`,
-- i.e. ru init.lua, will call ex-commands or .lua files inside the fzf folder.
vim.opt.rtp:append '/home/linuxbrew/.linuxbrew/opt/fzf'

-- vim.lsp.set_log_level 'debug'

-- local eslint = {
--   lintCommand = 'eslint_d -f unix --stdin --stdin-filename ${INPUT}',
--   lintStdin = true,
--   lintFormats = { '%f:%l:%c: %m' },
--   lintIgnoreExitCode = true,
--   -- formatCommand = 'eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}',
--   -- formatStdin = true,
-- }

-- ============================================================================================
-- Helper Functions
-- ============================================================================================

-- Filter for `vim.lsp.format()`, ensuring only null_ls is used for formatting
-- buffers where typescript-tool is attached, as the other LSPs used for TS/JS
-- files do not have capabilities: formattingProvider | rangeFormattingProvider.
-- To check LSP clients attached to a buffer: `lua =vim.lsp.get_clients()`
-- To check capabilities of their respective LSP servers, look at filed:
-- `server_capabilities`.
-- Check attacked LSPs: `:checkhealth lsp` | `:LspInfo`.
local null_ls_filter = function(client)
  -- vim.print('in format filter, client.name is: ' .. client.name)
  return client.name ~= 'typescript-tools'
end

-- Function for formatting buffer, using all attached LSPs that supports
-- formatting, except `typescript-tools`, because `null_ls` should be used
-- instead for TS/JS formatting.
local lsp_formatting = function(bufnr)
  vim.lsp.buf.format {
    bufnr = bufnr,
    -- Restrict formatting to client with this id.
    -- Do not include `id = client_by_id.id`, because order LSPs attach is
    -- non-deterministic, `clear` in `nvim_create_autogroup` means autocommand
    -- is only added for the last attached LSPs, and `format()` should not
    -- simply use the last attached LSP.
    -- Thus, used filter instead, which picks the right LSP by name, i.e.
    -- null_lsp.
    -- id = client_by_id.id,
    -- async = false means format is done before buffer write is allowed to proceed,
    -- not in parallel. false is dafault, so setting to false is redundant.
    async = false,
    -- vim.lsp.buf.format normally runs formatting by all attached LSPs
    -- with formatting capabilities. Instead, add filter so vim.lsp.format()
    -- only runs formatting by null_ls, which is set up to use prettierd.
    filter = null_ls_filter,
  }
end

-- Cannot have clear = true, because attaching to new buffer, i.e. opening new
-- file, will cause the autocommand for a previously opened buffer to be deleted.
local augroup_lsp_format = vim.api.nvim_create_augroup('lsp-format', { clear = false })

-- Helper function that allows applying code action fix,
-- if there is only one code action with the specified title.
local apply_code_action_fix = function()
  vim.lsp.buf.code_action {
    filter = function(code_action)
      if vim.startswith(code_action.title, 'Apply suggested fix') then
        return true
      end
      return false
    end,
    apply = true,
  }
end

-- ============================================================================================
-- Lazy Plugins
-- ============================================================================================

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).

  -- Detect expandtab and shiftwidth automatically, by looking at existing indents in
  -- current file. If it is a new file, or indent info in current file is inconclusive,
  -- look at other files with same extension in current -and parent folder.
  -- Modelines and Editorconfig are respected.
  'tpope/vim-sleuth',

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.

  -- Use `opts = {}` to force a plugin to be loaded.

  -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded.
  -- Events can be normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `config` key, the configuration only runs
  -- after the plugin has been loaded:
  --  config = function() ... end

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      icons = {
        -- set icon mappings to true if you have a Nerd Font
        mappings = vim.g.have_nerd_font,
        -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        -- default whick-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },

      -- Document existing key chains
      spec = {
        { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      },
    },
  },

  -- NOTE: Plugins can specify dependencies.
  --
  -- The dependencies are proper plugin specifications as well - anything
  -- you do for a plugin at the top level, you can do for a dependency.
  --
  -- Use the `dependencies` key to specify the dependencies of a particular plugin

  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use Telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of `help_tags` options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in Telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- Telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- Custom action inside telescope, to open trouble list.
      -- Use this to add more results without clearing the trouble list
      -- local actions = require 'telescope.actions'
      -- local open_with_trouble = require('trouble.sources.telescope').open
      -- local add_to_trouble = require('trouble.sources.telescope').add

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        defaults = {
          -- mappings = {
          --   -- Map <c-t> inside a Telescope prompt to open the trouble list.
          --   i = { ['<c-t>'] = open_with_trouble },
          --   n = { ['<c-t>'] = open_with_trouble },
          -- },

          -- Decide arguments passed to rg, used under hood by Telescope.
          -- See defaults: :h telescope.setup() > vimgrep_arguments.
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden', -- Include hidden files, i.e. dotfiles.
            '--no-ignore', -- Include files/folders from: .gitignore, .ignore, etc.
            -- Exclude various files and folders from search.
            '--glob=!.git/*',
            '--glob=!.cache/*',
            '--glob=!.history/*',
            '--glob=!.rustup/*',
            '--glob=!.cargo/*',
            '--glob=!.next/*',
            -- '--glob=!.local/share/zsh/*',
            '--glob=!node_modules/*',
          },
        },
        --   mappings = {
        --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        --   },
        -- },
        pickers = {
          find_files = {
            -- Telescope uses rg and fd under hood, so by default does not search hidden files,
            -- i.e. dotfiles, or files/folders from .gitignore.
            -- Dotfiles can be included with --hidden.
            -- .gitignore files can be included with --no-ignore.
            hidden = true, -- Include hidden files, i.e. dotfiles.
            no_ignore = true, -- Include files/folders from: .gitignore, .ignore, etc.
            exclude = { 'node_modules', '.git', '.cache', '.history', '.rustup', '.cargo', '.next' },
            -- glob = { '!.git/*', '!.cache/*', '!.history/*', '!.rust*/*', '!.node_modules/*' },
          },
          -- lsp_document_symbols = {
          --   symbols = {
          --     'function',
          --     'method',
          --     ''
          --   },
          -- },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })

      -- Shortcuts for searching TODOs.
      vim.keymap.set('n', '<leader>stt', function()
        vim.cmd 'TodoTelescope keywords=TODO,FIX,BUG'
      end, { desc = '[S]earch [T]odos, [F]ixes, and [B]ugs' })

      vim.keymap.set('n', '<leader>stf', function()
        vim.cmd 'TodoTelescope keywords=FIX,BUG'
      end, { desc = '[S]earch [F]ixes and [B]ugs' })

      vim.keymap.set('n', '<leader>stn', function()
        vim.cmd 'TodoTelescope keywords=NOTE'
      end, { desc = '[S]earch [N]otes' })
    end,
  },

  -- LSP Plugins
  -- {
  --   -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
  --   -- used for completion, annotations and signatures of Neovim apis
  --   'folke/lazydev.nvim',
  --   ft = 'lua',
  --   opts = {
  --     library = {
  --       -- Load luvit types when the `vim.uv` word is found
  --       { path = 'luvit-meta/library', words = { 'vim%.uv' } },
  --     },
  --   },
  -- },

  -- { 'Bilal2453/luvit-meta', lazy = true },

  -- TypeScript LSP.
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
    config = function()
      -- opt table is passed into require('typescript-tools').setup(opt), but here we call it directly.
      -- Parameters passed to setup funciton are also passed to standard nvim-lspconfig
      -- server setup.
      -- local capabilities = vim.lsp.protocol.make_client_capabilities()
      -- capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
      require('typescript-tools').setup {
        -- capabilities = capabilities,
        -- No need to turn off these server capabilities here, as vim.lsp.format() is
        -- manually set to not use `typescript-tools`.
        -- on_attach = function(client)
        --   client.server_capabilities.documentFormattingProvider = false
        --   client.server_capabilities.documentRangeFormattingProvider = false
        -- end,
        settings = {
          jsx_close_tag = {
            enable = true,
            filetypes = { 'javascriptreact', 'typescriptreact' },
          },
        },
      }
    end,
  },

  {
    'nvimtools/none-ls.nvim',
    dependencies = {
      'nvimtools/none-ls-extras.nvim',
      'nvim-lua/plenary.nvim',
    },
    opts = {},
    config = function(_, opts)
      local null_ls = require 'null-ls'
      null_ls.setup {
        -- debug = true,
        sources = {
          require 'none-ls.diagnostics.eslint_d',
          require 'none-ls.code_actions.eslint_d',
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.shfmt.with {
            filetypes = {
              'sh',
              'zsh',
              'bash',
            },
          },
          null_ls.builtins.formatting.prettierd,
          -- null_ls and prettierd finds prettier config automatically,
          -- using root_dir, no need to specify PRETTIERD_DEFAULT_CONFIG here.
        },
      }
    end,
  },

  {
    -- Main LSP Configuration
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },

      -- Allows extra capabilities provided by nvim-cmp
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      -- Brief aside: **What is LSP?**
      --
      -- LSP is an initialism you've probably heard, but might not understand what it is.
      --
      -- LSP stands for Language Server Protocol. It's a protocol that helps editors
      -- and language tooling communicate in a standardized fashion.
      --
      -- In general, you have a "server" which is some tool built to understand a particular
      -- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc.). These Language Servers
      -- (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
      -- processes that communicate with some "client" - in this case, Neovim!
      --
      -- LSP provides Neovim with features like:
      --  - Go to definition
      --  - Find references
      --  - Autocompletion
      --  - Symbol Search
      --  - and more!
      --
      -- Thus, Language Servers are external tools that must be installed separately from
      -- Neovim. This is where `mason` and related plugins come into play.
      --
      -- If you're wondering about lsp vs treesitter, you can check out the wonderfully
      -- and elegantly composed help section, `:help lsp-vs-treesitter`

      -- This function gets run when an LSP attaches to a particular buffer.
      -- Meaning, every time a new file is opened that is associated with
      -- an lsp this function will be executed to configure the current buffer.
      -- It does not only run for lsp's installed via Lazy, but for all LSPs that
      -- attach to a buffer. Meaning, the autocommand applies to all LSPs.
      -- LSPs, including `typescript-tools`.
      -- Clear in `vim.api.nvim_create_augroup()`, means the autocommands in that group
      -- will be cleared if the group already exists, which is useful if the autocmd function
      -- runs more than once.
      -- In fact, here it will run every time an LSP attaches, and due to `clear` the
      -- previously added automcommands will be deleted.
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = function(event)
          local client_by_id = vim.lsp.get_client_by_id(event.data.client_id)
          local buffer_number = event.buf

          -- Return true if null-ls has an active source set with formatting,
          -- for the current buffer's filetype, otherwise return false.
          -- local function is_null_ls_formatting_enabled(bufnr)
          --   local file_type = vim.api.nvim_buf_get_option(bufnr, 'filetype')
          --   local generators = require('null-ls.generators').get_available(file_type, require('null-ls.methods').internal.FORMATTING)
          --   return #generators > 0
          -- end

          -- If null-ls attaches to buffer, but does NOT have a formatting method,
          -- then option `formatexpr` should not be set, to avoid breaking gq in those
          -- buffer. In other buffers, where null_ls is not attached, or where null_ls is
          -- attached with a formatting method, `formatexpr` can be set to its default `v:lua.vim.lsp.formatexpr()`.
          -- More information: https://github.com/nvimtools/none-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts#avoid-breaking-formatexpr-ie-gq
          -- if client_by_id.server_capabilities.documentFormattingProvider then
          --   if client_by_id.name == 'null-ls' and is_null_ls_formatting_enabled(buffer_number) or client_by_id.name ~= 'null-ls' then
          --     vim.bo[buffer_number].formatexpr = 'v:lua.vim.lsp.formatexpr()'
          --     -- vim.keymap.set('n', '<leader>gq', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', opts)
          --   else
          --     vim.bo[buffer_number].formatexpr = nil
          --   end
          -- end

          -- Format the current buffer on save, not using typescript-tools,
          -- meaning null_ls is used if the file is applicable.
          -- If another LSP attaches to same buffer, delete existing format-on-save autocommand
          -- to ensure only one of these autocommands are used per buffer.
          -- It does not matter which LSP registers the autocommand on the buffer.
          if client_by_id.supports_method 'textDocument/formatting' then
            vim.api.nvim_clear_autocmds {
              group = augroup_lsp_format,
              buffer = buffer_number,
            }
            vim.api.nvim_create_autocmd('BufWritePre', {
              group = augroup_lsp_format,
              buffer = buffer_number,
              callback = function()
                -- vim.print('writing, autocmd running for client: ' .. client_by_id.name .. ', and buffer number: ' .. buffer_number)
                lsp_formatting(buffer_number)
              end,
            })

            -- Remove format-on-save autocommand for buffer,
            -- when LSP detaches from that buffer.
            -- Only need one global version of this,
            -- as `nvim_clear_autocmds` operate on specific buffer.
            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
              callback = function(event2)
                vim.api.nvim_clear_autocmds {
                  group = augroup_lsp_format,
                  buffer = event2.buf,
                }
              end,
            })
          end

          -- Function to define mappings specific for LSP related items.
          -- Sets mode, buffer, description.
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Function to format current buffer.
          local format_current_buffer = function()
            lsp_formatting(buffer_number)
          end

          -- Even though these key maps are defined several times, for every LSP that attaches,
          -- newer ones overwrite old ones.
          map('<leader>f', format_current_buffer, '[F]ormat buffer')

          -- Note: Bindings below use telescope, because it shows list if there are more
          -- hits, otherwise, if there is only one match, it goes to the word under the
          -- cursor using standard lsp client methods: lsp.buf.hover(), lsp.buf.definition, etc.

          -- Jump to the definition of the word under your cursor.
          -- This is where a variable was first declared, or where a function is defined, etc.
          -- To jump back, press <C-t> | <C-o>.
          -- Go to definition is natively set to CTRL-], so do not add additional binding.
          -- See: :h lsp-defaults.
          -- map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          -- Find references for the word under your cursor, using a telescope window
          -- instead of quickfix window used by vim.buf.lsp.references().
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          -- Jump to the implementation of the word under your cursor.
          -- Useful when your language has ways of declaring types without an actual implementation.
          -- Uses telescope window instead of quickfix window used by
          -- vim.lsp.buf.implementation().
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

          -- Jump to the type of the word under your cursor.
          -- Useful when you're not sure what type a variable is and you want to see
          -- the definition of its *type*, not where it was *defined*.
          -- If only one match it jumps to it using lsp.buf.type_definition,
          -- otherwise shows all options in telescope window.
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

          -- Fuzzy find all the symbols in your current document.
          -- Symbols are things like variables, functions, types, etc.
          -- Uses telescope window, instead of quickfix window used by
          -- vim.lsp.buf.document_symbol().
          -- Symbol kinds: https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#textDocument_documentSymbol
          -- map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
          map('<leader>o', function()
            require('telescope.builtin').lsp_document_symbols(require('telescope.themes').get_dropdown {
              winblend = 10,
              previewer = false,
            })
          end, 'Symbols')

          -- Fuzzy find all symbols in the current workspace.
          -- Similar to document symbols, except searches over entire project.
          -- Workspace root is somehow set by
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

          -- Rename variable under cursor, using LSP.
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
          map('<leader>.', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
          map('<leader>cf', apply_code_action_fix, '[C]ode [A]ction Apply [F]ix.', { 'n', 'x' })

          -- Declaration is normally not used, prefer Definition.
          -- map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          -- See `:help CursorHold` for information about when this is executed.
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          -- The following code creates a keymap to toggle inlay hints in your
          -- code, if the language server in use supports them.
          -- This may be unwanted, since they displace some code.
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      -- LSP servers and clients are able to communicate to each other what features they support.
      -- By default, Neovim doesn't support everything that is in the LSP specification.
      -- When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
      -- So, we create new capabilities with nvim cmp, and then broadcast that to the servers.

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      -- Enable the following language servers
      --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
      --
      --  Add any additional override configuration in the following tables. Available keys are:
      --  - cmd (table): Override the default command used to start the server
      --  - filetypes (table): Override the default list of associated filetypes for the server
      --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
      --  - settings (table): Override the default settings passed when initializing the server.
      --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
      local servers = {
        -- clangd = {},
        -- gopls = {},
        -- pyright = {},
        -- rust_analyzer = {},
        -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
        --

        bashls = {
          filetypes = { 'sh', 'bash', 'zsh' },
          settings = {
            -- Uses fnmatch, which uses shell wildcard pattern: `man 7 glob`, `man fnmatch`.
            -- @(pattern-list): pattern matches if exactly one occurrence of any of patterns in pattern-list match input string.
            -- Instead of matching here, set specific filetypes to specific files, by filename, directly in vim.filetypes.add.
            -- globPattern = '**/*@(.sh|.inc|.bash|.zsh|.command|.shrc|.profile|.zshrc|.zprofile|.bashrc|.bash_profile|.bash_aliases|.bash_history|.bash_logout|.bash_login)',
          },
        },

        -- Some languages (like typescript) have entire language plugins that can be useful:
        -- https://github.com/pmizio/typescript-tools.nvim
        -- But for many setups, the LSP (`ts_ls`) will work just fine.
        -- ts_ls = {},

        -- efm = {
        --
        --   -- on_attach = function(client)
        --   --   client.server_capabilities.documentFormattingProvider = false
        --   --   client.server_capabilities.documentRangeFormattingProvider = false
        --   -- end,
        --   -- on_attach = function(client)
        --   --   client.resolved_capabilities.document_formatting = true
        --   --   client.resolved_capabilities.goto_definition = false
        --   -- end,
        --   -- root_dir = function()
        --   --   if not eslint_config_exists() then
        --   --     return nil
        --   --   end
        --   --   return vim.fn.getcwd()
        --   -- end,
        --   init_options = {
        --     documentFormatting = false,
        --     hover = true,
        --     documentSymbol = true,
        --     codeAction = true,
        --     completion = true,
        --   },
        --   settings = {
        --     rootMarkers = { '.git/' },
        --     languages = {
        --       javascript = { eslint },
        --       javascriptreact = { eslint },
        --       ['javascript.jsx'] = { eslint },
        --       typescript = { eslint },
        --       ['typescript.tsx'] = { eslint },
        --       typescriptreact = { eslint },
        --     },
        --   },
        --   filetypes = {
        --     'javascript',
        --     'javascriptreact',
        --     'javascript.jsx',
        --     'typescript',
        --     'typescript.tsx',
        --     'typescriptreact',
        --   },
        -- },

        -- eslint = {
        --   settings = {
        --     packageManager = 'pnpm',
        --     format = false,
        --   },
        --   -- flags = {
        --   --   allow_incremental_sync = false,
        --   --   debounce_text_changes = 1000,
        --   -- },
        -- },

        -- For: docker-compose.yaml.
        -- docker_compose_language_service = {},

        -- For: Dockerfile.
        -- dockerls = {},

        -- TODO: Check if needed.

        -- marksman = {},

        tailwindcss = {
          --   -- flags = {
          --   --   debounce_text_changes = 1000,
          --   -- },
        },

        html = {},
        cssls = {
          filetypes = { 'css' },
        },
        css_variables = {},
        cssmodules_ls = {},
        somesass_ls = {
          filtetypes = { 'scss', 'sass' },
        },

        -- For: .toml.
        taplo = {},

        lua_ls = {
          -- cmd = {...},
          -- filetypes = { ...},
          -- capabilities = {},
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              format = { enable = false },
              -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
      }

      -- Ensure the servers and tools above are installed
      --  To check the current status of installed tools and/or manually install
      --  other tools, you can run
      --    :Mason
      --
      --  You can press `g?` for help in this menu.
      require('mason').setup()

      -- You can add other tools here that you want Mason to install
      -- for you, so that they are available from within Neovim.
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Format Lua code.
        'prettierd', -- Format JavaScript and TypeScript code.
        -- 'prettier',
        'eslint_d',
        'shfmt',
        'shellcheck',
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for ts_ls)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})

            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },

  -- { -- Autoformat
  --   'stevearc/conform.nvim',
  --   event = { 'BufWritePre' },
  --   cmd = { 'ConformInfo' },
  --   keys = {
  --     {
  --       '<leader>f',
  --       function()
  --         require('conform').format { async = true, lsp_format = 'fallback' }
  --       end,
  --       mode = '',
  --       desc = '[F]ormat buffer',
  --     },
  --   },
  --   opts = {
  --     notify_on_error = false,
  --     format_on_save = function(bufnr)
  --       -- Disable "format_on_save lsp_fallback" for languages that don't
  --       -- have a well standardized coding style. You can add additional
  --       -- languages here or re-enable it for the disabled ones.
  --       local disable_filetypes = { c = true, cpp = true }
  --       local lsp_format_opt
  --       if disable_filetypes[vim.bo[bufnr].filetype] then
  --         lsp_format_opt = 'never'
  --       else
  --         lsp_format_opt = 'fallback'
  --       end
  --       return {
  --         timeout_ms = 1000,
  --         lsp_format = lsp_format_opt,
  --       }
  --     end,
  --     formatters_by_ft = {
  --       -- Conform can also run multiple formatters sequentially.
  --       -- You can use 'stop_after_first' to run the first available formatter from the list
  --       -- javascript = { 'prettierd', 'prettier', stop_after_first = true },
  --       -- typescript = { 'prettierd', 'prettier', stop_after_first = true },
  --       -- javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
  --       -- typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
  --       -- css = { 'prettierd', 'prettier', stop_after_first = true },
  --       -- html = { 'prettierd', 'prettier', stop_after_first = true },
  --       -- json = { 'prettierd', 'prettier', stop_after_first = true },
  --       -- yaml = { 'prettierd', 'prettier', stop_after_first = true },
  --       -- markdown = { 'prettierd', 'prettier', stop_after_first = true },
  --       -- graphql = { 'prettierd', 'prettier', stop_after_first = true },
  --       lua = { 'stylua' },
  --       bash = { 'shfmt' },
  --       zsh = { 'shfmt' },
  --       sh = { 'shfmt' },
  --       -- python = { 'isort', 'black' },
  --     },
  --     -- formatters = {
  --     --   prettierd = function(bufnr)
  --     --     return {
  --     --       command = 'prettierd',
  --     --       args = { vim.api.nvim_buf_get_name(bufnr) },
  --     --       stdin = true,
  --     --       env = {
  --     --         string.format('PRETTIERD_DEFAULT_CONFIG=%s', vim.fn.expand '~/nfront/.prettierrc.js'),
  --     --       },
  --     --     }
  --     --   end,
  --     -- },
  --   },
  -- },

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          -- See the README about individual language/framework/plugin snippets:
          -- https://github.com/rafamadriz/friendly-snippets
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip').filetype_extend('typescript', { 'javascript', 'tsdoc' })
              require('luasnip').filetype_extend('typescriptreact', { 'javascript', 'tsdoc' })
              require('luasnip').filetype_extend('javascript', { 'jsdoc' })
              require('luasnip').filetype_extend('javascriptreact', { 'javascript', 'jsdoc' })
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
      },
      'saadparwaiz1/cmp_luasnip',

      -- Autopairs.
      {
        'windwp/nvim-autopairs',
        opts = {
          map_bs = true, -- Map <BS> to delete a pair.
          map_c_h = true, -- Map <C-h> to delete a pair.
          map_c_w = true, -- Map <C-w> to delete a pair, if possible.
        },
      },

      -- Adds other completion capabilities.
      -- nvim-cmp does not ship with all sources by default. They are split
      -- into multiple repos for maintenance purposes.
      'hrsh7th/cmp-nvim-lsp',
      -- 'hrsh7th/cmp-path',
      -- 'onsails/lspkind.nvim',
    },
    config = function()
      -- See: `:help cmp`.
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      -- luasnip.config.setup {}
      -- local lspkind = require 'lspkind'

      -- Not needed when setting CR keymap in opts above.
      -- local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      -- cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        -- completion = { completeopt = 'menu,menuone,noinsert' },
        --   formatting = {
        --     fields = { cmp.ItemField.Abbr, cmp.ItemField.Menu },
        --     expandable_indicator = true,
        --     format = lspkind.cmp_format {
        --       mode = 'symbol', -- show only symbol annotations
        --       maxwidth = {
        --         -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        --         -- can also be a function to dynamically calculate max width such as
        --         -- menu = function() return math.floor(0.45 * vim.o.columns) end,
        --         menu = 50, -- leading text (labelDetails)
        --         abbr = 50, -- actual suggestion item
        --       },
        --
        --      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
        --      show_labelDetails = true, -- show labelDetails in menu. Disabled by default
        --
        --      -- The function below will be called before any actual modifications from lspkind
        --      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
        --      -- before = function (entry, vim_item)
        --      --   ...
        --      --   return vim_item
        --      -- end
        --    },
        --  },

        -- Keymaps matching Neovim native.
        -- See: `:help ins-completion`.
        mapping = cmp.mapping.preset.insert {
          -- Select [n]ext item
          ['<C-n>'] = cmp.mapping.select_next_item(),
          -- Select [p]revious item
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          -- Abort completion.
          ['<C-e>'] = cmp.mapping.abort(),

          -- Scroll the documentation window [b]ack / [f]orward
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),

          -- Accept ([y]es) the completion.
          --  This will auto-import if your LSP supports it.
          --  This will expand snippets if the LSP sent a snippet.
          ['<C-y>'] = cmp.mapping.confirm { select = true },

          -- If you prefer more traditional completion keymaps,
          -- you can uncomment the following lines
          --['<CR>'] = cmp.mapping.confirm { select = true },
          --['<Tab>'] = cmp.mapping.select_next_item(),
          --['<S-Tab>'] = cmp.mapping.select_prev_item(),

          -- Manually trigger a completion from nvim-cmp.
          -- Generally you don't need this, because nvim-cmp will display
          -- completions whenever it has completion options available.
          ['<C-Space>'] = cmp.mapping.complete {},

          -- Think of <c-l> as moving to the right of your snippet expansion.
          --  So if you have a snippet that's like:
          --  function $name($args)
          --    $body
          --  end
          --
          -- <c-l> will move you to the right of each of the expansion locations.
          -- <c-h> is similar, except moving you backwards.
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          -- Going back should be <C-h> to fully match Vim movement,
          -- but that would block native backspace with <C-h>,
          -- so assign snippet-back-jump to <C-j> instead.
          ['<C-j>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 's' }),

          -- Additional bindings to select choice node, and more:
          -- https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
        },
        sources = {
          {
            name = 'lazydev',
            -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
            group_index = 0,
          },
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          -- { name = 'path' },
        },
      }
    end,
  },

  -- Properly comment out code in JSX, and other languages.
  {
    'folke/ts-comments.nvim',
    opts = {},
    event = 'VeryLazy',
    enabled = vim.fn.has 'nvim-0.10.0' == 1,
  },

  -- Using features built into Typescript Tools,
  -- instead of nvim-ts-autotag.
  -- {
  --   'windwp/nvim-ts-autotag',
  --   opts = {
  --     opts = {
  --       -- Defaults
  --       enable_close = true, -- Auto close tags
  --       enable_rename = true, -- Auto rename pairs of tags
  --       enable_close_on_slash = false, -- Auto close on trailing </
  --     },
  --     -- Also override individual filetype configs, these take priority.
  --     -- Empty by default, useful if one of the "opts" global settings
  --     -- doesn't work well in a specific filetype
  --     -- per_filetype = {
  --     --   ['html'] = {
  --     --     enable_close = false,
  --     --   },
  --     -- },
  --   },
  -- },

  -- {
  --   'maxmx03/solarized.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   ---@type solarized.config
  --   opts = {},
  --   config = function(_, opts)
  --     vim.o.termguicolors = true
  --     vim.o.background = 'dark'
  --     require('solarized').setup(opts)
  --     vim.cmd.colorscheme 'solarized'
  --   end,
  -- },

  {
    'olimorris/onedarkpro.nvim',
    lazy = false,
    priority = 1000, -- Ensure it loads first
    opts = {
      colors = {
        onedark = { bg = '#16161D' }, -- yellow
        -- onedark = { bg = '#1F1F28' }, -- yellow
      },
    },
    config = function(_, opts)
      require('onedarkpro').setup(opts)
      vim.cmd.colorscheme 'onedark'
      -- Other custom highlight settings.
      -- vim.cmd [[ highlight DiagnosticUnderlineError cterm=undercurl gui=undercurl guifg=NONE guisp=#ef596f guibg=#181818 ]]
      -- vim.cmd [[ highlight DiagnosticUnderlineWarn cterm=undercurl gui=undercurl guifg=NONE guisp=yellow guibg=#3e3e3e ]]
      vim.cmd [[ highlight DiagnosticUnderlineError cterm=undercurl gui=undercurl guifg=NONE guisp=red guibg=#3e3e3e ]]
      vim.cmd [[ highlight DiagnosticUnderlineWarn cterm=undercurl gui=undercurl guifg=NONE guisp=yellow ]]
      vim.cmd [[ highlight DiagnosticUnderlineInfo cterm=undercurl gui=undercurl guifg=NONE guisp=LightBlue ]]
      vim.cmd [[ highlight DiagnosticUnderlineHint cterm=undercurl gui=undercurl guifg=NONE guisp=#2bbac5 ]]
      -- DiagnosticUnnecessary is used for unused variables, but links to highlightgroup Comment, by default.
      vim.cmd [[ highlight DiagnosticUnnecessary guifg=#495162 ]]
    end,
  },

  -- {
  --   'rebelot/kanagawa.nvim',
  --   lazy = false,
  --   priority = 1000, -- Ensure it loads first
  --   opts = {},
  --   config = function(_, opts)
  --     require('kanagawa').setup(opts)
  --     vim.cmd.colorscheme 'kanagawa'
  --     -- Other custom highlight settings.
  --     -- vim.cmd [[ highlight DiagnosticUnderlineError cterm=undercurl gui=undercurl guifg=NONE guisp=#ef596f guibg=#181818 ]]
  --     vim.cmd [[ highlight DiagnosticUnderlineError cterm=undercurl gui=undercurl guifg=NONE guisp=red guibg=#181818 ]]
  --     vim.cmd [[ highlight DiagnosticUnderlineWarn cterm=undercurl gui=undercurl guifg=NONE guisp=yellow guibg=#181818 ]]
  --     vim.cmd [[ highlight DiagnosticUnderlineInfo cterm=undercurl gui=undercurl guifg=NONE guisp=LightBlue ]]
  --     vim.cmd [[ highlight DiagnosticUnderlineHint cterm=undercurl gui=undercurl guifg=NONE guisp=#2bbac5 ]]
  --   end,
  -- },

  -- {
  --   'navarasu/onedark.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     -- style = 'darker',
  --   },
  --   config = function(_, opts)
  --     vim.o.termguicolors = true
  --     vim.o.background = 'dark'
  --     require('onedark').setup(opts)
  --     vim.cmd.colorscheme 'onedark'
  --   end,
  -- },
  -- {
  --   'catppuccin/nvim',
  --   lazy = false,
  --   name = 'catppuccin',
  --   priority = 1000,
  --   opts = {
  --     flavour = 'mocha',
  --     -- transparent_background = false,
  --     -- integrations = {
  --     --   gitsigns = true,
  --     --   -- cmp = true,
  --     --   nvimtree = true,
  --     --   telescope = true,
  --     --   -- notify = true,
  --     --   mini = true,
  --     --   treesitter = true,
  --     --   -- neogit = true,
  --     -- },
  --     -- semantic_tokens = false,
  --   },
  --   config = function(_, opts)
  --     require('catppuccin').setup(opts)
  --     vim.cmd.colorscheme 'catppuccin'
  --   end,
  -- },

  -- {
  --   'cpea2506/one_monokai.nvim',
  --   lazy = false,
  --   priority = 1000, -- Make sure to load this before all the other start plugins.
  --   config = function(_, opts)
  --     require('one_monokai').setup(opts)
  --     vim.cmd.colorscheme 'one_monokai'
  --   end,
  -- },

  -- {
  --   'sonph/onehalf',
  --   lazy = false,
  --   priority = 1000, -- Make sure to load this before all the other start plugins.
  --   config = function(plugin)
  --     vim.opt.rtp:append(plugin.dir .. '/vim')
  --     vim.cmd [[ colorscheme onehalfdark ]]
  --     -- or vim.cmd [[ colorscheme onehalflight ]] if you prefer light theme
  --   end,
  -- },

  -- {
  --   'BBaoVanC/onehalf',
  --   lazy = false,
  --   priority = 1000, -- Make sure to load this before all the other start plugins.
  --   branch = 'bbaovanc',
  --   config = function(plugin)
  --     vim.opt.rtp:append(plugin.dir .. '/vim')
  --     vim.cmd [[ colorscheme onehalfdark ]]
  --     vim.cmd [[ highlight NormalFloat guibg='#16161e' guifg='#c0caf5' ]]
  --     vim.cmd [[ highlight TreesitterContext guibg='#343a55' ]]
  --     vim.cmd [[ highlight WhichKey guifg='#7dcfff' ]]
  --     vim.cmd [[ highlight WhichKeyDesc guifg='#bb9af7' ]]
  --     vim.cmd [[ highlight WhichKeyGroup guifg='#7aa2f7' ]]
  --     vim.cmd [[ highlight WhichKeyNormal guibg='#16161e' ]]
  --     vim.cmd [[ highlight WhichKeySeparator guifg='#565f89' ]]
  --     vim.cmd [[ highlight WhichKeyValue guifg='#737aa2' ]]
  --
  --     -- WildMenu = {
  --     --   bg = "#283457"
  --     -- },
  --     -- or vim.cmd [[ colorscheme onehalflight ]] if you prefer light theme
  --   end,
  -- },

  -- { -- You can easily change to a different colorscheme.
  --   -- Change the name of the colorscheme plugin below, and then
  --   -- change the command in the config to whatever the name of that colorscheme is.ini
  --   --
  --   -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  --   'folke/tokyonight.nvim',
  --   priority = 1000, -- Make sure to load this before all the other start plugins.
  --   init = function()
  --     -- Load the colorscheme here.
  --     -- Like many other themes, this one has different styles, and you could load
  --     -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
  --     vim.cmd.colorscheme 'tokyonight-night'
  --
  --     -- You can configure highlights by doing something like:
  --     -- vim.cmd.hi 'Comment gui=none'
  --   end,
  -- },

  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      -- keywords recognized as todo comments
      keywords = {
        FIX = {
          icon = ' ', -- icon used for the sign, and in search results
          color = 'error', -- can be a hex color, or a named color (see below)
          alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' }, -- a set of other keywords that all map to this FIX keywords
          -- signs = false, -- configure signs for some keywords individually
        },
        TODO = { icon = ' ', color = 'info' },
        HACK = { icon = ' ', color = 'warning' },
        WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX' } },
        PERF = { icon = ' ', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
        NOTE = { icon = '󰙏 ', color = 'hint', alt = { 'INFO' } },
        TEST = { icon = '⏲ ', color = 'test', alt = { 'TESTING', 'PASSED', 'FAILED' } },
      },

      gui_style = {
        fg = 'BOLD', -- The gui style to use for the fg highlight group.
        bg = 'BOLD', -- The gui style to use for the bg highlight group.
      },
      -- list of named colors where we try to extract the guifg from the
      -- list of highlight groups or use the hex color if hl not found as a fallback
      colors = {
        error = { '#e06c75' },
        -- warning = { 'DiagnosticWarn', 'WarningMsg', '#FBBF24' },
        -- info = { 'Structure', 'Question', 'Special', '#2563EB' },
        info = { '#61afef', 'Special', '#2563EB' },
        hint = { '#98c379', 'Title', '#98c379' },
        -- default = { 'Identifier', '#7C3AED' },
        -- test = { 'Identifier', '#FF00FF' },
      },
    },
  },

  {
    'folke/twilight.nvim',
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

  {
    'folke/zen-mode.nvim',
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      -- plugins = {
      --   wezterm = {
      --     enabled = true,
      --     -- can be either an absolute font size or the number of incremental steps
      --     font = '+4', -- (10% increase per step)
      --   },
      -- },
    },
  },

  -- Pretty list for diagnostics, references, telescope results, quickfix, location list.
  {
    'folke/trouble.nvim',
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },

  -- {
  --   'nvim-lualine/lualine.nvim',
  --   dependencies = { 'nvim-tree/nvim-web-devicons', 'folke/trouble.nvim' },
  --   opts = {
  --     options = {
  --       icons_enabled = true,
  --       -- theme = 'auto',
  --       -- theme = 'gruvbox',
  --       component_separators = { left = '', right = '' },
  --       section_separators = { left = '', right = '' },
  --       disabled_filetypes = {
  --         statusline = {},
  --         winbar = {},
  --       },
  --       ignore_focus = {},
  --       always_divide_middle = true,
  --       always_show_tabline = true,
  --       globalstatus = false,
  --       refresh = {
  --         statusline = 100,
  --         tabline = 100,
  --         winbar = 100,
  --       },
  --     },
  --     sections = {
  --       lualine_a = { 'mode' },
  --       lualine_b = { 'branch', 'diff', 'diagnostics' },
  --       lualine_c = {
  --         {
  --           'filename',
  --           file_status = true, -- displays file status (readonly, modified, etc)
  --
  --           -- path:
  --           -- 0: Just the filename
  --           -- 1: Relative path
  --           -- 2: Absolute path
  --           -- 3: Absolute path, with tilde as the home directory
  --           -- 4: Filename and parent dir, with tilde as the home directory
  --           path = 1,
  --         },
  --       },
  --       lualine_x = { 'encoding', 'fileformat', 'filetype' },
  --       lualine_y = { 'progress' },
  --       lualine_z = { 'location' },
  --     },
  --     inactive_sections = {
  --       lualine_a = {},
  --       lualine_b = {},
  --       lualine_c = { 'filename' },
  --       lualine_x = { 'location' },
  --       lualine_y = {},
  --       lualine_z = {},
  --     },
  --     -- tabline = {
  --     --   lualine_a = { 'buffers' },
  --     --   lualine_b = { 'branch' },
  --     --   lualine_c = { 'filename' },
  --     --   lualine_x = {},
  --     --   lualine_y = {},
  --     --   lualine_z = { 'tabs' },
  --     -- },
  --     -- winbar = {
  --     -- lualine_a = {
  --     --   {
  --     --     'filename',
  --     --     file_status = true, -- displays file status (readonly, modified, etc)
  --     --     path = 1,
  --     --   },
  --     -- },
  --     -- lualine_b = {},
  --     -- lualine_c = {},
  --     --   lualine_x = {},
  --     -- },
  --     inactive_winbar = {},
  --     extensions = {},
  --   },
  --   config = function(_, opts)
  --     local trouble = require 'trouble'
  --     local symbols = trouble.statusline {
  --       mode = 'lsp_document_symbols',
  --       groups = {},
  --       title = false,
  --       filter = { range = true },
  --       format = '{kind_icon}{symbol.name:Normal}',
  --       -- format = '{kind_icon}{symbol.name:red}',
  --       -- The following line is needed to fix the background color
  --       -- Set it to the lualine section you want to use
  --       hl_group = 'lualine_b_normal',
  --       -- hl_group = 'LineNr',
  --     }
  --     -- table.insert(opts.winbar.lualine_x, {
  --     --   symbols.get,
  --     --   cond = symbols.has,
  --     -- })
  --     require('lualine').setup(opts)
  --   end,
  -- },
  --
  -- {
  --   'akinsho/bufferline.nvim',
  --   version = '*',
  --   dependencies = 'nvim-tree/nvim-web-devicons',
  --   opts = {
  --     options = {
  --       mode = 'buffers', -- set to "tabs" to only show tabpages instead
  --       -- style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
  --       -- themable = true | false, -- allows highlight groups to be overriden i.e. sets highlights as default
  --       numbers = 'buffer_id',
  --       -- close_command = "bdelete! %d",       -- can be a string | function, | false see "Mouse actions"
  --       -- right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
  --       -- left_mouse_command = "buffer %d",    -- can be a string | function, | false see "Mouse actions"
  --       -- middle_mouse_command = nil,          -- can be a string | function, | false see "Mouse actions"
  --       indicator = {
  --         -- icon = '▎', -- this should be omitted if indicator style is not 'icon'
  --         style = 'underline',
  --       },
  --       -- buffer_close_icon = '󰅖',
  --       -- modified_icon = '● ',
  --       -- close_icon = ' ',
  --       -- left_trunc_marker = ' ',
  --       -- right_trunc_marker = ' ',
  --       -- --- name_formatter can be used to change the buffer's label in the bufferline.
  --       -- --- Please note some names can/will break the
  --       -- --- bufferline so use this at your discretion knowing that it has
  --       -- --- some limitations that will *NOT* be fixed.
  --       -- name_formatter = function(buf)  -- buf contains:
  --       --       -- name                | str        | the basename of the active file
  --       --       -- path                | str        | the full path of the active file
  --       --       -- bufnr               | int        | the number of the active buffer
  --       --       -- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
  --       --       -- tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
  --       -- end,
  --       -- max_name_length = 18,
  --       -- max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
  --       -- truncate_names = true, -- whether or not tab names should be truncated
  --       -- tab_size = 18,
  --       diagnostics = 'nvim_lsp',
  --       -- diagnostics_update_in_insert = false, -- only applies to coc
  --       diagnostics_update_on_event = true, -- use nvim's diagnostic handler
  --       -- -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
  --       diagnostics_indicator = function(count, level, diagnostics_dict, context)
  --         local s = ' '
  --         for e, n in pairs(diagnostics_dict) do
  --           local sym = e == 'error' and ' ' or (e == 'warning' and ' ' or ' ')
  --           s = s .. n .. sym
  --         end
  --         return s
  --       end,
  --       -- -- NOTE this will be called a lot so don't do any heavy processing here
  --       -- custom_filter = function(buf_number, buf_numbers)
  --       --     -- filter out filetypes you don't want to see
  --       --     if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
  --       --         return true
  --       --     end
  --       --     -- filter out by buffer name
  --       --     if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
  --       --         return true
  --       --     end
  --       --     -- filter out based on arbitrary rules
  --       --     -- e.g. filter out vim wiki buffer from tabline in your work repo
  --       --     if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
  --       --         return true
  --       --     end
  --       --     -- filter out by it's index number in list (don't show first buffer)
  --       --     if buf_numbers[1] ~= buf_number then
  --       --         return true
  --       --     end
  --       -- end,
  --       -- offsets = {
  --       --     {
  --       --         filetype = "NvimTree",
  --       --         text = "File Explorer" | function ,
  --       --         text_align = "left" | "center" | "right"
  --       --         separator = true
  --       --     }
  --       -- },
  --       -- color_icons = true | false, -- whether or not to add the filetype icon highlights
  --       -- get_element_icon = function(element)
  --       --   -- element consists of {filetype: string, path: string, extension: string, directory: string}
  --       --   -- This can be used to change how bufferline fetches the icon
  --       --   -- for an element e.g. a buffer or a tab.
  --       --   -- e.g.
  --       --   local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
  --       --   return icon, hl
  --       --   -- or
  --       --   local custom_map = {my_thing_ft: {icon = "my_thing_icon", hl}}
  --       --   return custom_map[element.filetype]
  --       -- end,
  --       -- show_buffer_icons = true | false, -- disable filetype icons for buffers
  --       -- show_buffer_close_icons = true | false,
  --       show_close_icon = false,
  --       -- show_tab_indicators = true | false,
  --       -- show_duplicate_prefix = true | false, -- whether to show duplicate buffer prefix
  --       -- duplicates_across_groups = true, -- whether to consider duplicate paths in different groups as duplicates
  --       -- persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
  --       -- move_wraps_at_ends = false, -- whether or not the move command "wraps" at the first or last position
  --       -- -- can also be a table containing 2 custom separators
  --       -- -- [focused and unfocused]. eg: { '|', '|' }
  --       separator_style = 'slant',
  --       -- enforce_regular_tabs = false | true,
  --       -- always_show_bufferline = true | false,
  --       -- auto_toggle_bufferline = true | false,
  --       -- hover = {
  --       --   enabled = true,
  --       --   delay = 200,
  --       --   reveal = { 'close' },
  --       -- },
  --       -- sort_by = 'insert_after_current' |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
  --       --     -- add custom logic
  --       --     local modified_a = vim.fn.getftime(buffer_a.path)
  --       --     local modified_b = vim.fn.getftime(buffer_b.path)
  --       --     return modified_a > modified_b
  --       -- end
  --     },
  --   },
  -- },

  -- { -- Collection of various small independent plugins/modules
  --   'echasnovski/mini.nvim',
  --   config = function()
  --     -- Better Around/Inside textobjects
  --     --
  --     -- Examples:
  --     --  - va)  - [V]isually select [A]round [)]paren
  --     --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
  --     --  - ci'  - [C]hange [I]nside [']quote
  --     -- require('mini.ai').setup { n_lines = 500 }
  --
  --     -- Add/delete/replace surroundings (brackets, quotes, etc.)
  --     --
  --     -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
  --     -- - sd'   - [S]urround [D]elete [']quotes
  --     -- - sr)'  - [S]urround [R]eplace [)] [']
  --     require('mini.surround').setup()
  --
  --     -- Simple and easy statusline.
  --     --  You could remove this setup call if you don't like it,
  --     --  and try some other statusline plugin
  --     -- local statusline = require 'mini.statusline'
  --     -- set use_icons to true if you have a Nerd Font
  --     -- statusline.setup { use_icons = vim.g.have_nerd_font }
  --
  --     -- You can configure sections in the statusline by overriding their
  --     -- default behavior. For example, here we set the section for
  --     -- cursor location to LINE:COLUMN
  --     -- ---@diagnostic disable-next-line: duplicate-set-field
  --     -- statusline.section_location = function()
  --     --   return '%2l:%-2v'
  --     -- end
  --
  --     -- ... and there is more!
  --     --  Check out: https://github.com/echasnovski/mini.nvim
  --   end,
  -- },

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context',
    },
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'javascript', 'typescript', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
      incremental_selection = {
        disable = {},
        enable = true,
        keymaps = {
          init_selection = '<leader>css',
          node_incremental = '{',
          node_decremental = '}',
          -- node_incremental = '<leader>csi',
          -- node_decremental = '<leader>csd',
          scope_incremental = '<leader>csc',
        },
        module_path = 'nvim-treesitter.incremental_selection',
      },
      textobjects = {
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          -- Overwrite built-in [a, which goes to next argument list file, often passed in
          -- when vim is started.
          goto_next_start = {
            [']f'] = { query = '@function.outer', query_group = 'textobjects', desc = 'Next function start' },
            [']a'] = { query = '@parameter.inner', query_group = 'textobjects', desc = 'Next function argument start' },
            [']o'] = { query = '@object.outer', query_group = 'textobjects', desc = 'Next object start' },
            [']s'] = { query = '@local.scope', query_group = 'locals', desc = 'Next scope start' },
            -- [']]'] = { query = '@class.outer', desc = 'Next class start' },

            -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queries.
            -- [']o'] = '@loop.*',
            -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }

            -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path, defaulting to 'textobjects'.
            -- Below example nvim-treesitter's `folds.scm`. They also provide locals.scm, highlights.scm and indent.scm.
            -- [']z'] = { query = '@fold', query_group = 'folds', desc = 'Next fold' },
          },
          goto_next_end = {
            [']F'] = { query = '@function.outer', query_group = 'textobjects', desc = 'Next function end' },
            [']A'] = { query = '@parameter.inner', query_group = 'textobjects', desc = 'Next function argument end' },
            [']S'] = { query = '@local.scope', query_group = 'locals', desc = 'Next scope end' },
            [']O'] = { query = '@object.outer', query_group = 'textobjects', desc = 'Next object end' },
            -- [']['] = '@class.outer',
          },

          goto_previous_start = {
            ['[f'] = { query = '@function.outer', query_group = 'textobjects', desc = 'Previous function start' },
            ['[a'] = { query = '@parameter.inner', query_group = 'textobjects', desc = 'Previous function argument start' },
            ['[o'] = { query = '@object.outer', query_group = 'textobjects', desc = 'Previous object start' },
            ['[s'] = { query = '@local.scope', query_group = 'locals', desc = 'Previous scope start' },
            -- ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[F'] = { query = '@function.outer', query_group = 'textobjects', desc = 'Previous function end' },
            ['[A'] = { query = '@parameter.inner', query_group = 'textobjects', desc = 'Previous function argument end' },
            ['[S'] = { query = '@local.scope', query_group = 'locals', desc = 'Previous scope end' },
            ['[O'] = { query = '@object.outer', query_group = 'textobjects', desc = 'Previous object end' },
            -- ['[]'] = '@class.outer',
          },

          -- Below will go to either the start or the end, whichever is closer.
          -- Use if you want more granular movements
          -- Make it even more gradual by adding multiple queries and regex.
          -- goto_next = {
          --   [']d'] = '@conditional.outer',
          -- },
          --
          -- goto_previous = {
          --   ['[d'] = '@conditional.outer',
          -- },
        },
        select = {
          enable = true,

          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',

            ['ac'] = '@class.outer',

            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',

            -- You can optionally set descriptions to the mappings (used in the desc parameter of
            -- nvim_buf_set_keymap) which plugins like which-key display
            ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class region' },
            -- You can also use captures from other query groups like `locals.scm`
            ['as'] = { query = '@local.scope', query_group = 'locals', desc = 'Select language scope' },
          },
          -- You can choose the select mode (default is charwise 'v')
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * method: eg 'v' or 'o'
          -- and should return the mode ('v', 'V', or '<c-v>') or a table
          -- mapping query_strings to modes.
          selection_modes = {
            ['@parameter.outer'] = 'v', -- charwise
            ['@function.outer'] = 'V', -- linewise
            ['@class.outer'] = '<c-v>', -- blockwise
          },
          -- If you set this to `true` (default is `false`) then any textobject is
          -- extended to include preceding or succeeding whitespace. Succeeding
          -- whitespace has priority in order to act similarly to eg the built-in
          -- `ap`.
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * selection_mode: eg 'v'
          -- and should return true or false
          -- include_surrounding_whitespace = true,
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>csa'] = { query = '@parameter.inner', query_group = 'textobjects', desc = 'Swap next parameter' },
          },
          swap_previous = {
            ['<leader>csA'] = { query = '@parameter.inner', query_group = 'textobjects', desc = 'Swap previous parameter' },
          },
        },
        lsp_interop = {
          enable = true,
          border = 'none',
          floating_preview_opts = {},
          peek_definition_code = {
            ['<leader>df'] = '@function.outer',
            ['<leader>dF'] = '@class.outer',
          },
        },
      },
      -- context = {
      --   enable = false, -- Enable this plugin (Can be enabled/disabled later via commands)
      --   multiwindow = false, -- Enable multiwindow support.
      --   max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
      --   min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
      --   line_numbers = true,
      --   multiline_threshold = 20, -- Maximum number of lines to show for a single context
      --   trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
      --   mode = 'cursor', -- Line used to calculate context. Choices: 'cursor', 'topline'
      --   -- Separator between context and content. Should be a single character string, like '-'.
      --   -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
      --   separator = nil,
      --   zindex = 20, -- The Z-index of the context window
      --   on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
      -- },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
      -- Use bash parser for zsh filetypes.
      -- Filetype is added based on filename, elsewhere via vim api.
      vim.treesitter.language.register('bash', { 'zsh' })
      require('treesitter-context').setup {
        enable = true,
        mode = 'cursor',
        multiline_threshold = 2,
        -- max_lines = 5,
        -- trim_scope = 'outer',
      }

      -- Jump to context (upwards only).
      -- Use [z instead.
      -- vim.keymap.set('n', '[c', function()
      --   require('treesitter-context').go_to_context(vim.v.count1)
      -- end, { silent = true })

      -- Repeat movement with ; and ,
      local ts_repeat_move = require 'nvim-treesitter.textobjects.repeatable_move'
      -- vim way: ; goes to the direction you were moving.
      vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move)
      vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_opposite)
      -- Make builtin f, F, t, T use Treesitter, so we can keep its repeat behavior (since we
      -- overwrite it above).
      vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f_expr, { expr = true })
      vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F_expr, { expr = true })
      vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t_expr, { expr = true })
      vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T_expr, { expr = true })
    end,
    -- config = function(_, opt)
    --   require('nvim-treesitter.configs').setup(opt)
    --   -- require('treesitter-context')
    -- end,

    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },

  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  -- {
  --   'OlegGulevskyy/better-ts-errors.nvim',
  --   dependencies = { 'MunifTanjim/nui.nvim' },
  --   opts = {
  --     keymaps = {
  --       toggle = '<leader>dd', -- default '<leader>dd'
  --       go_to_definition = '<leader>dx', -- default '<leader>dx'
  --     },
  --   },
  -- },

  ---@type LazySpec
  {
    'mikavilpas/yazi.nvim',
    event = 'VeryLazy',
    keys = {
      -- 👇 in this section, choose your own keymappings!
      {
        '<leader>-',
        '<cmd>Yazi<cr>',
        desc = 'Open yazi at the current file',
      },
      {
        -- Open in the current working directory
        '<leader>cw',
        '<cmd>Yazi cwd<cr>',
        desc = "Open the file manager in nvim's working directory",
      },
      {
        -- NOTE: this requires a version of yazi that includes
        -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
        '<c-up>',
        '<cmd>Yazi toggle<cr>',
        desc = 'Resume the last yazi session',
      },
    },
    ---@type YaziConfig
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = true,
      keymaps = {
        show_help = '<f1>',
      },
    },
  },

  {
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },

  -- { 'github/copilot.vim' },

  -- Avante is like cursor AI, for neovim.

  -- {
  --   'yetone/avante.nvim',
  --   event = 'VeryLazy',
  --   lazy = false,
  --   version = false, -- set this if you want to always pull the latest change
  --   opts = {
  --     -- add any opts here
  --   },
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   build = 'make',
  --   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  --   dependencies = {
  --     'nvim-treesitter/nvim-treesitter',
  --     'stevearc/dressing.nvim',
  --     'nvim-lua/plenary.nvim',
  --     'MunifTanjim/nui.nvim',
  --     --- The below dependencies are optional,
  --     'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
  --     'zbirenbaum/copilot.lua', -- for providers='copilot'
  --     {
  --       -- support for image pasting
  --       'HakonHarnes/img-clip.nvim',
  --       event = 'VeryLazy',
  --       opts = {
  --         -- recommended settings
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           -- required for Windows users
  --           use_absolute_path = true,
  --         },
  --       },
  --     },
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       'MeanderingProgrammer/render-markdown.nvim',
  --       opts = {
  --         file_types = { 'markdown', 'Avante' },
  --       },
  --       ft = { 'markdown', 'Avante' },
  --     },
  --   },
  -- },

  -- The following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- place them in the correct locations.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
  --
  --  Here are some example plugins that I've included in the Kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.lint',
  -- require 'kickstart.plugins.neo-tree', -- Use yatzi instead.
  -- require 'kickstart.plugins.gitsigns', -- Adds gitsigns recommend keymaps.
  -- require 'kickstart.plugins.indent_line',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  -- { import = 'custom.plugins' },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
