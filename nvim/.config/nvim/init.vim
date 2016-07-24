" General settings
set number

set showcmd

set autoread

set smartcase

set fileencodings=utf-8,sjis,cp936,gb18030,big5,cp1251,euc-jp,latin1

set title

set pastetoggle=<F10>

set colorcolumn=81

" Clipboard
set clipboard+=unnamedplus

let mapleader=","

" Tab key setup
set tabstop=4 shiftwidth=4
" Different tab of filetypes
autocmd FileType c,cpp setl tabstop=2 shiftwidth=2 expandtab

" Multibyte
if has('multi_byte')
  " set listchars=trail:·,tab:\|\ ,eol:¶,extends:→,precedes:←,nbsp:×
  set listchars=trail:·,tab:\·\ ,extends:→,precedes:←,nbsp:×
  set list
  " Vertical split chars
  set fillchars=stl:\ ,stlnc:\ ,vert:│
  if has('patch-7.4.338')
    let &sbr = nr2char(8618).' ' " Show ↪ at the beginning of wrapped lines
    set breakindent
    set breakindentopt=sbr
  endif
endif

" split windows
noremap <leader>s <C-w>v<C-w>l
" move between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" Tab navigation
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnew<CR>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
" Alternatively use
"nnoremap th :tabnext<CR>
"nnoremap tl :tabprev<CR>
"nnoremap tn :tabnew<CR>


"Plugins List
call plug#begin('~/.config/nvim/plugged')

Plug 'flazz/vim-colorschemes'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1

" Comment toggle
Plug 'tomtom/tcomment_vim'

Plug 'luochen1990/rainbow'
  let g:rainbow_active = 1

" Plug 'kien/rainbow_parentheses.vim'
"   let g:rbpt_colorpairs = [
"       \ ['brown',       'RoyalBlue3'],
"       \ ['Darkblue',    'SeaGreen3'],
"       \ ['darkgray',    'DarkOrchid3'],
"       \ ['darkgreen',   'firebrick3'],
"       \ ['darkcyan',    'RoyalBlue3'],
"       \ ['darkred',     'SeaGreen3'],
"       \ ['darkmagenta', 'DarkOrchid3'],
"       \ ['brown',       'firebrick3'],
"       \ ['gray',        'RoyalBlue3'],
"       \ ['black',       'SeaGreen3'],
"       \ ['red',         'firebrick3'],
"       \ ['darkmagenta', 'DarkOrchid3'],
"       \ ['Darkblue',    'firebrick3'],
"       \ ['darkgreen',   'RoyalBlue3'],
"       \ ['darkcyan',    'SeaGreen3'],
"       \ ['darkred',     'DarkOrchid3'],
"       \ ]
"   let g:rbpt_max = 16
"   let g:rbpt_loadcmd_toggle = 0
"   au VimEnter * RainbowParenthesesToggle

Plug 'jszakmeister/vim-togglecursor'

Plug 'mhinz/vim-startify'

Plug 'vim-scripts/fcitx.vim'

" Show a diff via Vim sign column
Plug 'mhinz/vim-signify'

Plug 'tpope/vim-surround'

Plug 'scrooloose/nerdtree'
  let NERDTreeQuitOnOpen=1
  nmap <leader>e :NERDTreeToggle<CR>

" Snips
Plug 'SirVer/ultisnips'
  let g:UltiSnipsExpandTrigger='<tab><cr>'
  let g:UltiSnipsJumpForwardTrigger='<c-b>'
  let g:UltiSnipsJumpBackwardTrigger='<c-f>'

  let g:UltiSnipsEditSplit="vertical"
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

Plug 'mbbill/undotree'
  if has("persistent_undo")
    set undodir=~/.config/nvim/undodir/
    set undofile
  endif
  nnoremap <F5> :UndotreeToggle<cr>

Plug 'majutsushi/tagbar'
  nmap <leader>t :TagbarToggle<CR>

" Remember last poistion
Plug 'dietsche/vim-lastplace'

Plug 'critiqjo/lldb.nvim'

Plug 'eugen0329/vim-esearch'

Plug 'KabbAmine/zeavim.vim'

"Plug 'neomake/neomake'
Plug 'scrooloose/syntastic'
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0

" let g:syntastic_cpp_checkers = ['clang_check']
  let g:syntastic_cpp_compiler = 'clang++'
  let g:syntastic_cpp_compiler_options = '-std=c++11'

  let g:syntastic_python_checkers = ['python']

Plug 'jiangmiao/auto-pairs'
  " let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"' , '`':'`' , '<':'>'}

Plug 'Shougo/deoplete.nvim'
  let g:deoplete#enable_at_startup = 1

  autocmd CompleteDone * pclose!

"  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"  function! s:my_cr_function() abort
"    return deoplete#close_popup() . "\<CR>"
"  endfunction

"Plug 'Rip-Rip/clang_complete', { 'do': 'nvim -c \"r! git ls-files autoload bin doc plugin\" -c \"$$,$$d _\" -c \"%MkVimball! $@ .\" -c \"q!\" && nvim &< -c \"so %\" -c \"q\"' }
"  let g:clang_library_path = "/usr/lib/libclang.so"
"  let g:clang_use_library = 1
"  let g:clang_complete_auto = 0
"  let g:clang_auto_select = 0
"  let g:clang_omnicppcomplete_compliance = 0
"  let g:clang_make_default_keymappings = 0
"
Plug 'zchee/deoplete-clang'
  let g:deoplete#sources#clang#libclang_path = "/usr/lib/libclang.so"
  let g:deoplete#sources#clang#clang_header ="/usr/include/clang/"
  let g:deoplete#sources#clang#std = {'c': 'c11', 'cpp': 'c++11', 'objc': 'c11', 'objcpp': 'c++1z'}
"
" Plug 'kiddos/deoplete-cpp'
"   let g:deoplete#sources#cpp#arduino_path = '/usr/share/arduino'

Plug 'zchee/deoplete-jedi'

" Languages
" Plug 'beyondmarc/opengl.vim'
Plug 'tikhomirov/vim-glsl'

call plug#end()



" Color
" colorscheme antares
colorscheme railscasts
" highlight Normal ctermbg=none
