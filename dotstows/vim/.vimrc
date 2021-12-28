"" Required
set encoding=utf-8

"" Functions
" Check if plugin has loaded
function! PlugLoaded(name)
  return (
    \ has_key(g:plugs, a:name) &&
    \ isdirectory(g:plugs[a:name].dir) &&
    \ stridx(&rtp, g:plugs[a:name].dir) >= 0)
endfunction

" Toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --java-completer --ts-completer
  endif
endfunction

"" Config
set number            " Show line numbers
set relativenumber    " User relative line numbersz
set linebreak         " Break lines at word (requires Wrap lines)
set showbreak=+++     " Wrap-broken line prefix
set textwidth=111     " Line wrap (number of cols)
set showmatch         " Highlight matching brace
set spell             " Enable spell-checking
set virtualedit=block " Enable free-range cursor
set visualbell        " Use visual bell (no beeping)

set hlsearch   " Highlight all search results
set smartcase  " Enable smart-case search
set ignorecase " Always case-insensitive
set incsearch  " Searches for strings incrementally

" (plugin for auto indent settings in use, these are defaults)
set autoindent    " Auto-indent new lines
set shiftwidth=2  " Number of auto-indent spaces
set smartindent   " Enable smart-indent
set smarttab      " Enable smart-tabs
set softtabstop=4 " Number of spaces per Tab

set ruler                      " Show row and column ruler information
set undolevels=1000            " Number of undo levels
set backspace=indent,eol,start " Backspace behaviour

" allow mouse
set mouse=a

" natural split openings
set splitbelow
set splitright

"" Extra
syntax on # highlight syntax
let mapleader = ","

"" Cursor
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI.="\e[6 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[2 q" "EI = NORMAL mode (ELSE)

"" Mappings
" move vertically by visual line
nnoremap j gj
nnoremap k gk

" highlight last inserted text
nnoremap gV `[v`]

" save session
nnoremap <leader>s :mksession<CR>

" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"" Plugins (vim-plug)
call plug#begin()

" Start screen
Plug 'mhinz/vim-startify'

" Indentation aid
Plug 'tpope/vim-sleuth'

" Dev icons
Plug 'ryanoasis/vim-devicons'

" Surround
Plug 'tpope/vim-surround'

" YCM (Tabnine fork)
Plug 'tabnine/YouCompleteMe', { 'do': function('BuildYCM') }

" Git
Plug 'tpope/vim-fugitive'

" Git gutter (diff)
Plug 'airblade/vim-gitgutter'

" Context (clause bar)
Plug 'wellle/context.vim'

" Prettier 4 Vim
Plug 'prettier/vim-prettier'

" TMUX + vim
Plug 'preservim/vimux'

" Syntastic
Plug 'vim-syntastic/syntastic'

" Auto pop complete
Plug 'vim-scripts/AutoComplPop'

" Commenter
Plug 'preservim/nerdcommenter'

" Editor Config
Plug 'editorconfig/editorconfig-vim'

" Ack Vim
Plug 'mileszs/ack.vim'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" NERD Tree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Floaterm
Plug 'voldikss/vim-floaterm'

" Surround.vim
Plug 'https://github.com/tpope/vim-surround.git'

" Repeat.vim
Plug 'https://github.com/tpope/vim-repeat.git'

"" Themes
Plug 'morhetz/gruvbox'
Plug 'jacoborus/tender.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'https://github.com/cocopon/iceberg.vim'
Plug 'bluz71/vim-moonfly-colors'

" Color para
Plug 'kien/rainbow_parentheses.vim'

call plug#end()

"" Mappings (Plugins)

" FZF
nnoremap <leader>f    :Files<CR>
nnoremap <leader>fg   :GFiles<CR>
nnoremap <leader>fc   :Colors<CR>
nnoremap <leader><CR> :Buffers<CR>
nnoremap <leader>fl   :Lines<CR>
nnoremap <leader>ag   :Ag! <C-R><C-W><CR>
nnoremap <leader>fh   :History<CR>

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
map <leader>r :NERDTreeFind<cr>

" Show hidden files for nerd
let NERDTreeShowHidden=1

" Floaterm
nnoremap   <silent>   <F7>    :FloatermNew<CR>
tnoremap   <silent>   <F7>    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent>   <F8>    :FloatermPrev<CR>
tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <F9>    :FloatermNext<CR>
tnoremap   <silent>   <F9>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <F12>   :FloatermToggle<CR>
tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"" Post commands (Plugins)

" Theme
syntax enable
colorscheme pablo

" Gruvbox our real default
colorscheme gruvbox

" Highlight insert mode
:autocmd InsertEnter,InsertLeave * set cul!

" Force transparency
hi Normal guibg=NONE ctermbg=NONE
