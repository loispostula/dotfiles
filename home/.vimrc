set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

"let vundle manage vundle
"required
Plugin 'gmarik/vundle'

"Bundles
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim'}
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'klen/python-mode'
Plugin 'davidhalter/jedi-vim'
Plugin 'msanders/snipmate.vim'
Plugin 'vim-scripts/TaskList.vim'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'kien/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'rodjek/vim-puppet'
Plugin 'Absolight/vim-bind'
Plugin 'lukerandall/haskellmode-vim'
Plugin 'tpope/vim-rails'
Plugin 'terryma/vim-expand-region'
filetype plugin indent on



"for haskell
let g:haddock_browser="/usr/bin/google-chrome"
augroup vimrc_autocmds
    autocmd!
    "highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Yellow
    autocmd FileType python match Excess /\%80v.*/
    autocmd FileType python set nowrap
augroup END
"Make vim recognize .md as markdown
au BufRead,BufNewFile *.md set filetype=markdown
"Ctrlp
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/](\.(git|hg|svn)|\_site)$',
    \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
    \}
let g:ctrlp_working_oath_mode = 'r'
nmap <leader>p :CtrlP<cr>

"Change leader to space
let mapleader = "\<Space>"
"Set save to leader w
nnoremap <Leader>w :w<CR>
"using vim expand region to ameliorate the expension with v and ctrl v
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)


nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

"Buffergator
let g:buffergator_viewport_split_policy = 'R'
let g:buffergator_suppress_keymaps = 1
"goto previous open buffer
nmap <leader>jj :BuffergatorMruCyclePrev<cr>
"goto nex open buffer
nmap <leader>kk :BuffergatorMruCycleNext<cr>
"view list of open buffer
nmap <leader>bl :BuffergatorOpen<cr>
"tabnew
nmap <leader>T :enew<cr>
"close buffer
nmap <leader>bq :bp <BAR> bd #<cr>


"Powerline setup
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set laststatus=2

"NerdTree Mapping
map <F2> :NERDTreeToggle<CR>

"TaskList
map <leader>td <Plug>TaskList

"Python-Mod Configuration
" Python-mode
" " Activate rope
" " Keys:
" " K             Show python docs
" " <Ctrl-Space>  Rope autocomplete
" " <Ctrl-c>g     Rope goto definition
" " <Ctrl-c>d     Rope show documentation
" " <Ctrl-c>f     Rope find occurrences
" " <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" " [[            Jump on previous class or function (normal, visual, operator
" modes)
" " ]]            Jump on next class or function (normal, visual, operator
" modes)
" " [M            Jump on previous class or method (normal, visual, operator
" modes)
" " ]M            Jump on next class or method (normal, visual, operator
" modes)
"
let g:pymode_rope = 0

"Doc
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
"Auto check on save
let g:pymode_lint_write = 1

let g:pymode_virtualenv = 1
"Breakpoint
let g:pymode_breakmode = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0
set foldmethod=indent
set foldlevel=99

"Vim Own config

nmap <leader>l :set list!<CR>

set autochdir

set tabstop=4
set shiftwidth=4
set expandtab

if has ('gui_running')
    highlight Pmenu guibg=#cccccc gui=bold
endif

"Navigate through tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

"Save session
map <F3> :mksession! ~/.vim_session <cr>
map <F4> :source ~/.vim_session <cr>

colorscheme koehler
set gfn=Source\ Code\ Pro\ 12
ima kj <ESC> 
set colorcolumn=+1,+10,+20

set smartindent
set autoindent
filetype indent on
