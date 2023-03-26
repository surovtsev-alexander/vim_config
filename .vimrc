"=====================================================
"" Vundle settings
"=====================================================
"" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'rosenfeld/conque-term'
"Plugin 'klen/python-mode'               " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
Plugin 'davidhalter/jedi-vim'           " Jedi-vim autocomplete plugin
Plugin 'mitsuhiko/vim-jinja'            " Jinja support for vim
Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim
Plugin 'tmhedberg/SimpylFold'

call vundle#end()                       " required
filetype on
filetype plugin on
filetype plugin indent on
let b:colorcolumn_state = 0
let b:cursor_state = 0
let b:hl_state = 0

execute pathogen#infect()
call plug#begin()
call plug#end()
"let NERDTreeDirArrows=0
let g:NERDTreeWinPos = "right"

function! CR()
  let current_date=strftime("%m/%d/%Y")
  execute "normal i\<CR>"
  execute "normal i/* " . current_date . " CR [AS] Block start. */\<CR>"
  execute "normal i/* " . current_date . " CR:DISCUSS [AS] Comment. */\<CR>"
  execute "normal i/* " . current_date . " CR [AS] Block end. */\<CR>"
endfunction

function! Handle_new_buffer_creation()
  call setbufvar(str2nr(expand('<abuf>')), "colorcolumn_state", 0)
  call setbufvar(str2nr(expand('<abuf>')), "cursor_state", 0)
  call setbufvar(str2nr(expand('<abuf>')), "hl_state", 0)
endfunction

function! Toggle_colorcolumn()
  if b:colorcolumn_state == 0
    let b:colorcolumn_state = 1
    set colorcolumn=101
  elseif b:colorcolumn_state == 1
    let b:colorcolumn_state = 2
    set colorcolumn=
  else
    let b:colorcolumn_state = 0
    set colorcolumn=81
  endif
endfunction

function! Toggle_cursor()
  if b:cursor_state == 0
    let b:cursor_state = 1
    set cursorcolumn
    set cursorline
  else
    let b:cursor_state = 0
    set nocursorcolumn
    set nocursorline
  endif
endfunction

function! Trim()
  %s/\s\+$//g
endfunction

set nocompatible
autocmd BufCreate * call Handle_new_buffer_creation()
"filetype plugin indent on
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
"let &t_EI.="\e[1 q"
"let &t_SI.="\e[5 q"
"let &t_te.="\e[0 q"
"let &t_ti.="\e[1 q"
map <F2> :call Toggle_colorcolumn()<CR>
map <F3> :call Toggle_cursor()<CR>
map <F4> :tab split<CR>
map <F5> :tabnew<CR>
map <F6> :cp<CR>
map <F7> :cn<CR>
:nnoremap <silent> <F9> :exe "let HlUnderCursor=exists(\"HlUnderCursor\")?HlUnderCursor*-1+1:1"<CR>
map <F10> :set hlsearch!<CR>
map <F11> :<Up><CR>
map <F12> :w !cat \| putclip<CR><CR>
map q <Nop>
map Q <Nop>
map <F8> :NERDTreeToggle<CR>
map :E<CR> :Explore<CR>
match ErrorMsg /\s\+$/
:nnoremap <A-down> :set hlsearch!<CR>
:nnoremap <silent> <A-up>   :exe "let HlUnderCursor=exists(\"HlUnderCursor\")?HlUnderCursor*-1+1:1"<CR>
:nnoremap <A-left> :cp<CR>
:nnoremap <A-right> :cn<CR>
:nnoremap <C-left> zc<CR>
:nnoremap <C-right> zo<CR>
set autoindent
set backspace=indent,eol,start
set colorcolumn=101
set confirm
set encoding=utf-8
set expandtab
set fileencodings=utf-8
set fileencoding=utf-8
set fileformat=unix
set history=4096
set ignorecase
set incsearch
set mouse=a
set nobackup
set nohlsearch
set noswapfile
set ruler
set shiftwidth=2
set showcmd
set smartindent
set cindent
set smarttab
set softtabstop=8
set tabstop=8
set t_Co=256
set undodir=~/.vim/undodir
set undofile
set undolevels=8192
set undoreload=65536
set wrap
syntax on
hi ColorColumn cterm=bold ctermbg=55
hi CursorColumn cterm=bold ctermbg=8
hi CursorLine cterm=bold ctermbg=8

"Use TAB to complete when typing words, else inserts TABs as usual.
""Uses dictionary and source files to find matching words to complete.

"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
""Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
      return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"
:autocmd CursorMoved * exe exists("HlUnderCursor")?HlUnderCursor?printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\')):'match none':""

set wildignore+=.svn/**
set wildignore+=tests/**
set wildignore+=doc/**
set wildignore+=build/**
set wildignore+=devtools/**
set number


"colorscheme slate
"colorscheme gruvbox
"colorscheme new-railscasts
"colorscheme afterglow
"colorscheme desert
"colorscheme jellybeans
"colorscheme tequila-sunrise
"colorscheme darkluma
"colorscheme dark_purple
"colorscheme molokai
colorscheme xcodedark

