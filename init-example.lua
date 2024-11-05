local g = vim.g
local o = vim.opt
local fn = vim.fn

-- Settings to set before loading plugins {{{1
g.python3_host_prog = '/usr/bin/python'
g.python_host_prog = '/usr/bin/python2'

g.qfenter_keymap = {
  vopen = { '<leader>v' },
}

-- Config files and plugins {{{1
require 'dotfiles.packages'

require('pqf').setup()
require('dd').setup()

require 'dotfiles.lsp'
require 'dotfiles.window'
require 'dotfiles.git'
require 'dotfiles.treesitter'
require 'dotfiles.telescope'
require 'dotfiles.comments'
require 'dotfiles.dressing'
require 'dotfiles.hooks'
require 'dotfiles.pounce'
require 'dotfiles.devicons'

_G.dotfiles = {
  completion = require 'dotfiles.completion',
  diagnostics = require 'dotfiles.diagnostics',
  package = require 'dotfiles.package',
  statusline = require 'dotfiles.statusline',
  winbar = require 'dotfiles.winbar',
  workspace = require 'dotfiles.workspace',
  abbrev = require 'dotfiles.abbrev',
  location_list = require 'dotfiles.location_list',
  maps = require 'dotfiles.maps',
  commands = require 'dotfiles.commands',
  pairs = require 'dotfiles.pairs',
  quickfix = require 'dotfiles.quickfix',
}

-- Colorscheme {{{1
vim.cmd 'color grey'

-- Code completion
-- o.pumheight = 30 -- Default 0: Max. number of items possible using full screen height.
-- o.completeopt = "menu" -- Default: menu,preview, meaning extra info is shown about currently selected option in preview window.
-- o.complete = { ".", "b" } -- Default: .,w,b,u,t, meaning Buffers in all windows, inc. unloaded buffers, and tags.
-- o.completefunc = "v:lua.dotfiles.completion.start" -- Some custom complete function.

-- Generic {{{1

-- o.colorcolumn = "80" -- Highlights a column number. Unsure why 80.

o.number = true -- Set linenumber on.
o.relativenumber = true -- Show relative line number.

-- o.ruler = false -- Shows line and column number, does not apply when statulsline is on (which it is). No need to set.
-- o.signcolumn = "yes" -- How to draw column for signs (modified, etc.). Defualt: auto (when there are signs).
-- o.synmaxcol = 256 -- Default: 3000, beyond which syntax items (text) is not
-- highlighted.
--
-- 1. teset testteset test teset testteset testteset testteset testteset testteset
--    testteset testteset testteset testteset testteset testteset testteset test

-- Must be on to show colors in Nvim.
o.termguicolors = true

-- Set absoute width of lines, similar to wrapmargin.
-- Wrapmargin is relative to screen width, whereas textwidth is absolute.
-- Wrapmargin is not used when textwidth is set.
-- textwidth only applies to newly inserted text, not existing text.
-- Use formatoptions to decide which type of code is broken with linewidth.
-- Prefer wrap or linebreak, which do NOT insert EOL, but just visually drops text to next line.
-- Use fomatoptions to decide which lines textwidth and "gq" applies to.
-- Default formatoptions is supposedly tcqj, but ours is magically set to: cqjrol.
-- Good: textwidth=90, formatoptions=cqjroln.
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
o.textwidth = 90
o.formatoptions = 'cqjroln'
-- Use literal string to avoid having to escape all parts of string, and escape special
-- characters in formatlistpat.
-- To set formatlistpat via ex-command: set ^\\s*\\(\\d\\\|\\*\\\|-\\)\\+[\\]:.)}\\t\ ]\\s*
o.formatlistpat = [[^\s*\(\d\|\*\|-\)\+[\]:.)}\t ]\s*]]

-- When lines are wider than window, wrap to next line. Just visual, does not add EOL character.
-- Default: true.
-- o.wrap = true

-- Highlights cursor column, useful for alignment.
o.cursorcolumn = true

o.cursorline = true
o.cursorlineopt = 'number'
o.backspace = 'indent,eol,start'
o.backupskip = '/tmp/*'
o.clipboard = 'unnamed'
o.diffopt = 'filler,vertical,internal,algorithm:patience,indent-heuristic,context:3'
o.lz = true
o.showcmd = false
o.pastetoggle = '<F2>'
o.splitright = true
o.title = false
o.mouse = ''
o.shortmess = 'atOIcF'
o.inccommand = 'nosplit'
o.scrollback = 1000
o.scrolloff = 2
o.updatetime = 1000
o.fillchars = {
  fold = ' ',
  diff = '╱',
  wbr = '─',
  msgsep = '─',
  horiz = ' ',
  horizup = '│',
  horizdown = '│',
  vertright = '│',
  vertleft = '│',
  verthoriz = '│',
}
o.regexpengine = 0
o.list = true
o.listchars = { tab = '  ', trail = '·', nbsp = '␣' }
o.winheight = 5

-- GUI {{{1
if fn['exists'] 'g:GtkGuiLoaded' == 1 then
  o.mouse = 'a'
  o.mousemodel = 'popup'

  fn['rpcnotify'](1, 'Gui', 'Font', 'SauceCodePro Nerd Font 8')
  fn['rpcnotify'](1, 'Gui', 'Linespace', '0')
  fn['rpcnotify'](1, 'Gui', 'Option', 'Popupmenu', 0)
  fn['rpcnotify'](1, 'Gui', 'Option', 'Tabline', 0)
  fn['rpcnotify'](1, 'Gui', 'Command', 'SetCursorBlink', '0')
end

-- Indentation {{{1
o.expandtab = true
o.shiftwidth = 4
o.shiftround = true
o.softtabstop = 4
o.tabstop = 4

-- Markdown {{{1
g.markdown_fenced_languages = { 'ruby', 'rust', 'sql', 'inko', 'yaml' }

-- netrw {{{1
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Rust {{{1
g.rust_recommended_style = 0

-- Searching {{{1
o.grepprg = 'rg --vimgrep'
o.grepformat = '%f:%l:%c:%m,%f:%l:%m'
o.incsearch = true
o.hlsearch = false

-- Statusline {{{1
o.statusline = '%!v:lua.dotfiles.statusline.render()'
o.laststatus = 3
g.qf_disable_statusline = true

-- RPM spec files {{{1
g.no_spec_maps = true

-- Window bar {{{1
o.winbar = '%!v:lua.dotfiles.winbar.render()'

-- Tabline {{{1
o.tabline = ''
o.showtabline = 0
