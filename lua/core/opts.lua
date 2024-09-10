local opt = vim.opt
 
opt.expandtab = true
opt.smarttab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.shiftround = true

opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.splitbelow = true
opt.splitright = true
opt.wrap = false
opt.scrolloff = 5
opt.fileencoding = 'utf-8'
opt.termguicolors = true

opt.relativenumber = true
opt.cursorline = true
opt.number = true

opt.spelllang = { 'en_us' }
opt.background = 'light'

opt.updatetime = 50

opt.clipboard = "unnamedplus"

opt.title = true
opt.titlelen = 0

opt.laststatus = 3
opt.showtabline = 2
opt.signcolumn = 'auto:2'

opt.showbreak = '⤷  ' -- ↪	⤷
opt.listchars = {
	tab = '  ',
	extends = '⟫',
	precedes = '⟪',
	conceal = '',
	nbsp = '␣',
	trail = '·'
}

border_style = 'rounded'
