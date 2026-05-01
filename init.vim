set relativenumber
set number

set tabstop=4
set shiftwidth=4
set expandtab

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

set completeopt=menuone,noselect,popup

set pumheight=4
set pumborder=shadow

syntax on

filetype on
filetype plugin on

call plug#begin("~/.vim/plugged")
"Cursor smearing - tbd if i like it or not
	Plug 'sphamba/smear-cursor.nvim'

"Vim surround
	Plug 'tpope/vim-surround'

"Typst
	Plug 'chomosuke/typst-preview.nvim', {'tag': 'v1.*'}
	Plug 'wellle/targets.vim'

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
	Plug 'folke/twilight.nvim'

"Sick borders
	Plug 'junegunn/goyo.vim'
	Plug 'xiyaowong/transparent.nvim'

" Package manager/LSP/DAP/linter/formatter
    Plug 'mason-org/mason.nvim'

" LSP
    Plug 'neovim/nvim-lspconfig'

"Themes
	"Plug 'arcticicestudio/nord-vim'
	"Plug 'danihek/hellwal-vim'
	Plug 'sainnhe/everforest'
	"Plug 'binarylinuxx/graphite-nvim'
	"Plug 'metalelf0/black-metal-theme-neovim'
	Plug 'chriskempson/base16-vim'
call plug#end()

colorscheme everforest
"colorscheme base16-grayscale-dark

let mapleader = " "
nnoremap <leader>tf <cmd>Telescope find_files<cr>
nnoremap <leader>f vip gq
nnoremap <leader>q <cmd>wqa<cr>
" nnoremap <leader>t <cmd>Limelight!! 0.7<cr>
nnoremap <leader>t <cmd>TransparentToggle<cr>
nnoremap <leader>g <cmd>Goyo 90%x98%<cr>
noremap <leader>p <cmd>TypstPreviewToggle<cr>
noremap <leader>s <cmd>lua require("typst-preview").setup({open_cmd = 'qutebrowser %s'})<cr> <cmd>TypstPreviewToggle<cr>
nnoremap <leader>l :TeXpresso %
" accept first autocorrect suggestion
nnoremap <leader>z 1z=	

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
" inoremap <C-u> <esc>ui

" inoremap <expr> <cr> pumvisible() ? '<c-y>' : '<cr>'

:command Q :q!
" Use Tab to expand and jump through snippets
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

" Use Shift-Tab to jump backwards through snippets
imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'

lua require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})

lua require("typst-preview").setup({open_cmd = 'librewolf %s'}) 

lua require("smear_cursor").enabled = true

"this is mostly to increase visual queueing for big jumps. the faster preset
"from the git repo looks pretty nice and does most of what i want, so i've
"changed it a little here and i'll probably forget about it unless it really
"annoys me for some reason.
lua require("smear_cursor").setup({
	\stiffness = 0.6,
	\trailing_stiffness = 0.6,
	\distance_stop_animating = 0.5
	\})

lua require("mason").setup()

"autocmd VimEnter * Limelight!! 0.7
"autocmd VimEnter * Twilight

let g:goyo_linenr = 1
autocmd VimEnter * Goyo 90%x98%

lua <<EOF
    vim.lsp.config('clangd', {
        on_attach = function(client, bufnr)
        local chars = {}; 
        for i = 32, 126 do 
            table.insert(chars, string.char(i)) 
        end
        client.server_capabilities.completionProvider.triggerCharacters = chars
        vim.lsp.completion.enable(true, client.id, bufnr, {autotrigger = true})
        end
    })

--      vim.lsp.enable('clangd', '--background-index', '--clang-tidy', '--log=verbose')
    require("core.lsp")
EOF
