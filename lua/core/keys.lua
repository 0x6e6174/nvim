vim.g.mapleader = " "
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.keymap.set

keymap('t', '<S-Esc>', '<C-\\><C-n>', { noremap = true })

-- window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- window resizing
keymap("n", "<C-S-k>", ":resize -2<CR>", opts)
keymap("n", "<C-S-j>", ":resize +2<CR>", opts)
keymap("n", "<C-S-h>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-S-l>", ":vertical resize +2<CR>", opts)

-- buffer navigation
keymap("n", "<C-8>", ":bnext<CR>", opts)
keymap("n", "<C-9>", ":bprevious<CR>", opts)

-- move selection up or down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- don't exit visual mode
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "p", '"_dP', opts)

-- Move text up and down
keymap("x", "J", ":m '>+1<CR>gv=gv", opts)
keymap("x", "K", ":m '<-2<CR>gv=gv", opts)
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- force me to use vim keys
keymap('n', '<Up>', '<Nop>', opts)
keymap('n', '<Down>', '<Nop>', opts)
keymap('n', '<Left>', '<Nop>', opts)
keymap('n', '<Right>', '<Nop>', opts)

keymap('i', '<Up>', '<Nop>', opts)
keymap('i', '<Down>', '<Nop>', opts)
keymap('i', '<Left>', '<Nop>', opts)
keymap('i', '<Right>', '<Nop>', opts)

keymap('i', '<A-h>', '<Left>', opts)
keymap('i', '<A-j>', '<Down>', opts)
keymap('i', '<A-k>', '<Up>', opts)
keymap('i', '<A-l>', '<Right>', opts)

keymap('x', '<Up>', '<Nop>', opts)
keymap('x', '<Down>', '<Nop>', opts)
keymap('x', '<Left>', '<Nop>', opts)
keymap('x', '<Right>', '<Nop>', opts)

-- split windows
keymap('n', '<C-s>v', ':vsplit<CR>', opts)
keymap('n', '<C-s>h', ':split<CR>', opts)

keymap('n', '<A-l>', ':nohlsearch<CR>', opts)

keymap('n', '<C-space>s', ':lua if vim.o.spell then vim.o.spell = false else vim.o.spell = true end<CR>',
  { noremap = true, silent = true })
keymap('n', '<C-space>c', ':ColorizerToggle<CR>', opts)

-- Tabs
keymap('n', '<C-t>', ':tabnew<CR>', opts)
keymap('n', '<C-w>', ':tabclose<CR>', opts)
keymap('n', '<A-j>', ':tabp<CR>', opts)
keymap('n', '<A-k>', ':tabn<CR>', opts)

-- Trouble.lua
keymap('n', '<C-space>t', ':TroubleToggle<CR>', opts)

-- lsp diagnostic movement
keymap('n', '>d', ':lua vim.diagnostic.goto_next()<CR>', opts)
keymap('n', '<d', ':lua vim.diagnostic.goto_prev()<CR>', opts)

-- source init
keymap('n', 'ri', ':luafile ~/.config/nvim/init.lua<CR>', opts) -- ri: reload init
