"" Theme
colorscheme pablo

"" Config
set number	" Show line numbers
set relativenumber " User relative line numbersz
set linebreak	" Break lines at word (requires Wrap lines)
set showbreak=+++	" Wrap-broken line prefix
set textwidth=111	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
set spell	" Enable spell-checking
set virtualedit=block	" Enable free-range cursor
set visualbell	" Use visual bell (no beeping)
 
set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally
 
set autoindent	" Auto-indent new lines
set shiftwidth=4	" Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set softtabstop=4	" Number of spaces per Tab
 
set ruler	" Show row and column ruler information
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour
 
"" Extra
syntax on # highlight syntax
let mapleader = ","

"" Mappings
" move vertically by visual line
nnoremap j gj
nnoremap k gk

" highlight last inserted text
nnoremap gV `[v`] 

" save session
nnoremap <leader>s :mksession<CR>

"" Functions
" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

"" Plugins (vim-plug)
call plug#begin()

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Tree explorer
Plug 'preservim/nerdtree'

" Floaterm
Plug 'voldikss/vim-floaterm'

" Surround.vim
Plug 'https://github.com/tpope/vim-surround.git'

" Repeat.vim
Plug 'https://github.com/tpope/vim-repeat.git'

" Theme
Plug 'tomasr/molokai'

" Color para
Plug 'kien/rainbow_parentheses.vim'

call plug#end()

"" Mappings (Plugins)

" FZF
nnoremap <leader><leader> :GFiles<CR>
nnoremap <leader>fi       :Files<CR>
nnoremap <leader>C        :Colors<CR>
nnoremap <leader><CR>     :Buffers<CR>
nnoremap <leader>fl       :Lines<CR>
nnoremap <leader>ag       :Ag! <C-R><C-W><CR>
nnoremap <leader>m        :History<CR>

" Easy Align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Nerd TREE
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Floaterm
nnoremap   <silent>   <F7>    :FloatermNew<CR>
tnoremap   <silent>   <F7>    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent>   <F8>    :FloatermPrev<CR>
tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <F9>    :FloatermNext<CR>
tnoremap   <silent>   <F9>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <F12>   :FloatermToggle<CR>
tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>
