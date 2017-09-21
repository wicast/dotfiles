" General settings
set number

set showcmd

set autoread

set smartcase

set hidden

set fileencodings=utf-8,sjis,cp936,gb18030,big5,cp1251,euc-jp,latin1

set title

set mouse=a
set foldcolumn=1

set pastetoggle=<F10>

set colorcolumn=81

set foldmethod=syntax
set foldlevelstart=20

" Clipboard
set clipboard+=unnamedplus

let mapleader=","

" Tab key setup
set tabstop=4 shiftwidth=4
" Different tab of filetypes
autocmd FileType c,cpp,cc setl tabstop=2 shiftwidth=2 expandtab
autocmd FileType java setl tabstop=4 shiftwidth=4 expandtab

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

" vim -b : edit binary using xxd-format!
augroup Binary
  au!
  au BufReadPre  *.bin let &bin=1
  au BufReadPost *.bin if &bin | %!xxd
  au BufReadPost *.bin set ft=xxd | endif
  au BufWritePre *.bin if &bin | %!xxd -r
  au BufWritePre *.bin endif
  au BufWritePost *.bin if &bin | %!xxd
  au BufWritePost *.bin set nomod | endif
augroup END

" split windows
noremap <leader>s <C-w>v<C-w>l
" move between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" Tab navigation
nnoremap th  :bfirst<CR>
nnoremap tj  :bprev<CR>
nnoremap tk  :bnext<CR>
nnoremap tl  :blast<CR>
nnoremap tt  :bedit<Space>
nnoremap tn  :bnew<CR>
nnoremap tm  :bm<Space>
nnoremap td  :bn<cr>:bd #<cr>:bp<cr>
" Alternatively use
"nnoremap th :tabnext<CR>
"nnoremap tl :tabprev<CR>
"nnoremap tn :tabnew<CR>


"Plugins List
call plug#begin('~/.local/share/nvim/plugged')

Plug 'flazz/vim-colorschemes'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1

" Comment toggle
Plug 'tomtom/tcomment_vim'

Plug 'luochen1990/rainbow'
  let g:rainbow_active = 1
  let g:rainbow_conf = {
  \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
  \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
  \   'operators': '_,_',
  \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
  \   'separately': {
  \       '*': {},
  \       'tex': {
  \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
  \       },
  \       'lisp': {
  \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
  \       },
  \       'vim': {
  \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
  \       },
  \       'html': {
  \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
  \       },
  \       'css': 0,
  \   }
  \}

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

Plug 'ctrlpvim/ctrlp.vim'

Plug 'mhinz/vim-startify'

Plug 'vim-scripts/fcitx.vim'

" Show a diff via Vim sign column
Plug 'mhinz/vim-signify'

Plug 'tpope/vim-surround'

Plug 'Yggdroot/indentLine'

Plug 'scrooloose/nerdtree'
  " let NERDTreeQuitOnOpen=1
  nmap <leader>e :NERDTreeToggle<CR>
  let g:NERDTreeMouseMode=3

Plug 'Xuyuanp/nerdtree-git-plugin'


" Snips
Plug 'SirVer/ultisnips'
  let g:UltiSnipsExpandTrigger='<M-CR>'
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
  let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records',
        \ 't:tests'
    \ ]
\ }

" Remember last poistion
Plug 'dietsche/vim-lastplace'

Plug 'critiqjo/lldb.nvim'

Plug 'eugen0329/vim-esearch'

Plug 'KabbAmine/zeavim.vim'

Plug 'neomake/neomake'
  autocmd! BufWritePost * Neomake
  let g:neomake_cpp_enabled_makers = ['clang']
  let g:neomake_cpp_clang_args = ["-std=c++11", "-Wextra", "-Wall", "-fsanitize=undefined","-g"]

" Plug 'scrooloose/syntastic'
"   set statusline+=%#warningmsg#
"   set statusline+=%{SyntasticStatuslineFlag()}
"   set statusline+=%*
"
"   let g:syntastic_always_populate_loc_list = 1
"   let g:syntastic_auto_loc_list = 1
"   " let g:syntastic_check_on_open = 1
"   let g:syntastic_check_on_wq = 0
"
" " let g:syntastic_cpp_checkers = ['clang_check']
"   let g:syntastic_cpp_compiler = 'clang++'
"   let g:syntastic_cpp_compiler_options = '-std=c++11'
"
"   let g:syntastic_python_checkers = ['python']

Plug 'jiangmiao/auto-pairs'
  " let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"' , '`':'`' , '<':'>'}

Plug 'elixir-lang/vim-elixir'
Plug 'thinca/vim-ref'
" Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }

" Alignment
Plug 'junegunn/vim-easy-align'
  " Start interactive EasyAlign in visual mode (e.g. vipga)
  xmap ga <Plug>(EasyAlign)

  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)

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
  let g:deoplete#sources#clang#sort_algo = "priority"
  " let g:deoplete#sources#clang#clang_complete_database = "~/testdb"
"
" Plug 'kiddos/deoplete-cpp'
"   let g:deoplete#sources#cpp#arduino_path = '/usr/share/arduino'

Plug 'zchee/deoplete-jedi'

Plug 'mileszs/ack.vim'
  if executable('ag')
    let g:ackprg = 'ag --vimgrep'
  endif

Plug 'mjakl/vim-asciidoc'
  let g:vim_asciidoc_initial_foldlevel=20

Plug 'artur-shaik/vim-javacomplete2'
  autocmd FileType java setlocal omnifunc=javacomplete#Complete
  nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
  imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
  nmap <F5> <Plug>(JavaComplete-Imports-Add)
  imap <F5> <Plug>(JavaComplete-Imports-Add)
  nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
  imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
  nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
  imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)

" Languages
" Plug 'beyondmarc/opengl.vim'
Plug 'tikhomirov/vim-glsl'

" Plug 'arakashic/chromatica.nvim'
"   let g:chromatica#libclang_path='/usr/lib/libclang.so'
"   let g:chromatica#enable_at_startup = 1
"   " let g:chromatica#responsive_mode=1

" Elixir
Plug 'slashmili/alchemist.vim', {'tag': '*'}


call plug#end()

" Color
" colorscheme antares
  colorscheme railscasts
" highlight Normal ctermbg=none

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | wincmd p | endif
" " autocmd vimenter * NERDTree | wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
