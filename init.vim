set relativenumber
set number

set statusline+=\ %F\ %M\ %R
set statusline+=%{wordcount().words}\ words

set hlsearch

set spell

set wrap

set showcmd

set ic

set scrolloff=25

set nohlsearch

set laststatus=0

syntax on

filetype on
filetype plugin on

call plug#begin("~/.vim/plugged")
"Vim surround
	Plug 'tpope/vim-surround'

"Typst
	Plug 'chomosuke/typst-preview.nvim', {'tag': 'v1.*'}

"Latex
	Plug 'lervag/vimtex'
	Plug 'lervag/vimtex', { 'tag': 'v2.15' }

"Snippets
	Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.4.0', 'do': 'make install_jsregexp'}
	
"Vim games
	Plug 'vuciv/golf'
	Plug 'ThePrimeagen/vim-be-good'

"Fuzzy finder? why do i have this again?
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

"Section dimming
	Plug 'junegunn/limelight.vim'

"Sick borders
	Plug 'junegunn/goyo.vim'

"Themes
	Plug 'arcticicestudio/nord-vim'
	"Plug 'danihek/hellwal-vim'
	"Plug 'sainnhe/everforest'
call plug#end()

colorscheme nord

let mapleader = " "
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>q <cmd>wqa<cr>
nnoremap <leader>t <cmd>Limelight!! 0.7<cr>
nnoremap <leader>g <cmd>Goyo 94%x98%<cr>
nnoremap <leader>gg <cmd>Goyo!<cr>
noremap <leader>p <cmd>TypstPreviewToggle<cr>
nnoremap <leader>l :TeXpresso %

vnoremap <leader>c g<C-g>2gs
xnoremap <leader>c g<C-g>2gs

nnoremap : ;
nnoremap ; :

vnoremap : ;
vnoremap ; :

xnoremap : ;
xnoremap ; :

inoremap <C-l> <Right>
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-h> <Left>

inoremap <C-w> <C-Right>
inoremap <C-b> <C-Left>
inoremap <C-e> <esc>ea

inoremap <C-a> <End>
" inoremap <C-i> <esc><S-i> " TODO: fix this one, somehow doesn't work?
inoremap <C-u> <esc>ui

:command Q :q!
" Use Tab to expand and jump through snippets
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

" Use Shift-Tab to jump backwards through snippets
imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'

lua require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})

lua require("typst-preview").setup({open_cmd = 'qutebrowser %s'}) 

"lua require('neoscroll').setup({mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>','<C-y>', '<C-e>', 'zt', 'zz', 'zb'},hide_cursor = true,stop_eof = true,respect_scrolloff = false,cursor_scrolls_alone = true,easing = 'linear',pre_hook = nil,post_hook = nil,performance_mode = false,ignored_events = {'WinScrolled', 'CursorMoved'},})

autocmd VimEnter * Limelight!! 0.7

let g:goyo_linenr = 1
autocmd VimEnter * Goyo 94%x98%
