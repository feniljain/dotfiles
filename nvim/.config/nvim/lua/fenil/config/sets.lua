vim.o.guicursor="" -- Reset the gui cursor options, for more details just press K on it.

vim.o.undofile=true -- Save undos after file closes

vim.o.undodir = os.getenv("HOME") .. "/.vim/undo"
vim.o.undolevels = 1000
vim.o.undoreload = 10000

-- set clipboard=unnamed       " Use system clipboard
vim.o.backspace = "indent,eol,start"
vim.o.number = true
-- set modifiable " allows modifying buffers like quickfixlist " after edit save the buffer using: :cgetbuffer
vim.o.relativenumber = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.linebreak = true
-- set bg=light
vim.o.background = "dark"
vim.o.hidden = true
vim.o.history = 1000
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.shiftround = true
vim.o.smarttab = true
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.termguicolors = true
vim.o.colorcolumn = "80"
vim.o.autoread = true
vim.o.encoding = "utf-8"
vim.o.showmode = false
vim.o.autowrite = true
vim.o.emoji = true
vim.o.lazyredraw = true
-- set nowrap
vim.o.wrap = true
vim.opt.display:append("lastline")
vim.cmd("syntax on")

-- Make search easier
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.smartcase = true
vim.o.ignorecase = true

vim.o.wildmenu = true
vim.o.title = true
vim.o.confirm = true

vim.o.backupdir = os.getenv("HOME") .. "/.cache/vim"

-- Visual indication of line your cursor is on, works in normal and visual mode
vim.o.cursorline = true
vim.o.signcolumn = "yes:1" -- Do not mess with this, unless you want your editor window dancing
vim.o.mouse = ""
-- set updatetime=300
vim.o.wildmode = "longest,list,full"

-- https://github.com/neovim/neovim/pull/14537
-- https://www.reddit.com/r/neovim/comments/ym6x7y/enable_new_diff_option_linematch_14537/
vim.opt.diffopt:append("vertical")
vim.opt.diffopt:append("linematch:60")

vim.opt.shortmess:append("c")

vim.o.scrolloff = 4

-- set splits to be done below and right rather than defaults
vim.o.splitbelow = true
vim.o.splitright = true

vim.o.inccommand = "split"

-- How should quickfix list decide which
-- window to open `Enter`ed entry in
vim.o.switchbuf = "useopen,usetab"
-- set winbar=%f " Uncomment this once it is fully released

-- https://github.com/neovim/neovim/pull/20750
vim.o.foldtext = ""
-- set fillchars=fold:\ " ugly

vim.o.updatetime = 250

-- enable list mode
-- set list
-- displaying tabs become annoying in Go codebases
-- display indicators for different chars
-- set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸\

-- Nvim 0.8.0 features
-- Using tree sitter based spell checker, this only checks comments in code
-- set spell " ughh...this is annoying

vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")

-- Disable status line completely: https://github.com/neovim/neovim/issues/18965
vim.o.laststatus = 0
vim.cmd("hi! link StatusLine Normal")
vim.cmd("hi! link StatusLineNC Normal")
vim.o.statusline = "%{repeat('─',winwidth('.'))}"

-- https://neovim.io/doc/user/news-0.11.html
vim.o.completeopt = "fuzzy"

-- set messagesopt=wait:5000,history:500 " https://www.reddit.com/r/neovim/comments/1h8q8ih/goodbye_to_the_press_enter_in_messages/ " I find hitting enter easier 😅

vim.o.cmdheight = 0

vim.o.winborder = "rounded"

-- https://github.com/mhinz/vim-galore#disable-audible-and-visual-bells
vim.o.errorbells = false
vim.o.visualbell = false

-- https://github.com/mhinz/vim-galore#smarter-cursorline
vim.api.nvim_create_autocmd({"InsertLeave", "WinEnter"}, {
  pattern = "*",
  command = "set cursorline",
})
vim.api.nvim_create_autocmd({"InsertEnter", "WinLeave"}, {
  pattern = "*",
  command = "set nocursorline",
})

-- use rg for vimgrep
vim.o.grepprg = "rg --vimgrep"
vim.opt.grepformat:prepend("%f:%l:%c:%m")

vim.o.exrc = true
