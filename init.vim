 call plug#begin('~/.config/nvim/plugged')


" @see https://www.gregjs.com/vim/2016/neovim-deoplete-jspc-ultisnips-and-tern-a-config-for-kickass-autocompletion/
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'padawan-php/deoplete-padawan', { 'do': 'composer install' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install', 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern', 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug '1995eaton/vim-better-javascript-completion'
Plug 'joshdick/onedark.vim'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'Yggdroot/indentLine'
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'
Plug 'valloric/matchtagalways'
Plug 'mattn/emmet-vim'
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'wesQ3/vim-windowswap'
Plug 'crusoexia/vim-monokai'
Plug 'mklabs/split-term.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'roxma/nvim-completion-manager'
Plug 'w0rp/ale'
Plug 'cohama/lexima.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mhartington/oceanic-next'
Plug 'valloric/youcompleteme'
Plug 'christoomey/vim-system-copy'
Plug 'pangloss/vim-javascript'
call plug#end()

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)

 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')


" GENERAL COMMANDS
"
" @see http://stackoverflow.com/questions/2001190/adding-a-command-to-vim	
"

" save as sudo
ca w!! w !sudo tee "%"

" remove hidden characters '^M' from Windows® docs
command AdjustEndOfLine execute '%s/\r\(\n\)/\1/g' 

" Tabs to spaces
command Tabs2Spaces execute ':1,$s/\t/  /g'

" 2 spaces to 4 spaces
command TwoSpaces2FourSpaces execute ':%s/^\s*/&&/g'



imap <C-J> <esc>a<Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger



" NERDTress Ctrl+n
map <C-x> :NERDTreeToggle<CR>
" NERDTress File highlighting


"
"
" GENERAL CONFIGS
" 	
"
" UTF-8 encoding
set encoding=utf-8

" Change <Leader>

" Use dash in autocomplete
set iskeyword+=\-

" Store swap files in fixed location, not current directory
" http://stackoverflow.com/a/4331812/922143
set dir=~/.config/nvim/swap//,/tmp//,.

" Vertical splits open to the right
set splitright

" Don't break lines in the middle of words
set linebreak

" TABs
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Line numbers
set number
set relativenumber

" Identing
set autoindent
set tabstop=4
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab


" Search

    " Incremental search
    set incsearch
    
    " Ignore case in search
    set ignorecase
 
    " Highlighted search results
    set hlsearch

    " Highlighted search results; press Space to turn off highlighting
    :nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Highlight actual line
set cursorline

" When scrolling, keep cursor 5 lines away from screen border
set scrolloff=5

" Folding and unfolding
"
" za : toggle folding
" zM : fold everything
" zR : unfold everything
" zm & zr : get those folds just right
"
" http://stackoverflow.com/a/10644424/922143
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=0         "this is just what i use"

    " Don't screw up folds when inserting text that might affect them,
    " until leaving insert mode. Foldmethod is local to the window.
    " http://vim.wikia.com/wiki/Keep_folds_closed_while_inserting_text
    autocmd InsertEnter * let w:last_fdm=&foldmethod | setlocal foldmethod=manual
    autocmd InsertLeave * let &l:foldmethod=w:last_fdm

" Sort selected linesvvnoremap <F9> :sort<CR>

" Easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

"Theme

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme OceanicNext
syntax on
  let g:oceanic_next_terminal_bold = 1
  let g:oceanic_next_terminal_italic = 1
  colorscheme OceanicNext
"colorscheme monokai


"my settign
set hidden

set termguicolors

"set mouse=a

set inccommand=split
set clipboard=unnamed

set expandtab
set shiftwidth=2

let mapleader="\<space>"

nnoremap <leader>; A;<esc>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <c-p> :Files<cr>
nnoremap <c-f> :Ag<space>

let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir = '~/.config/nvim/UltiSnips'


nnoremap <leader>b A__<esc>
nnoremap <leader>s :w <esc>
nnoremap <leader>v iλ <esc>


"others
"
"
"
" Cosmetics
highlight LineNr ctermfg=grey

