" this file is managed by my personal theme management script.

set background=dark 
colorscheme oxocarbon
hi MyNormalMode guibg=#33b1ff guifg=#161616
hi MyInsertMode guibg=#42be65 guifg=#161616
hi MyVisualMode guibg=#be95ff guifg=#161616
hi MyDefaultMode guibg=#FF7EB6 guifg=#161616
hi CustomErrorHl guifg=#FF7EB6 guibg=#262626
hi CustomWarnHl guifg=#FFE97B guibg=#262626
hi tabActive guibg=#FF7EB6 guifg=#161616
hi tabInactive guibg=#3c3836 guifg=#dde1e6
hi tabSepActive guibg=#262626 guifg=#FF7EB6
hi tabSepActive2 guifg=#FF7EB6 guibg=#3c3836
hi tabSepInactive guibg=#262626 guifg=#3c3836
hi tabSepInactive2 guifg=#3c3836 guibg=#262626
hi tabSepSpecial guifg=#FF7EB6 guibg=#262626
hi tabSepSpecial2 guifg=#262626 guibg=#262626
hi tabSepSpecial3 guifg=#262626 guibg=#262626
hi StatusLine guifg=#f2f4f8 guibg=#262626
hi GitSignsAdd guifg=#42be65
hi GitSignsChange guifg=#33b1ff
hi GitSignsDelete guifg=#ee5396
hi GitSignsTopDelete guifg=#ee5396
hi GitSignsChangeDelete guifg=#ee5396
hi GitSignsUntracked guifg=#be95ff
luafile ~/.config/nvim/lua/core/statusline.lua
luafile ~/.config/nvim/lua/core/tabline.lua
