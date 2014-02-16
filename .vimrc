set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My bundles here:
"
" original repos on GitHub
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non-GitHub repos
"Bundle 'git://git.wincent.com/command-t.git'

Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
" has too many bug
"Bundle 'fholgado/minibufexpl.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'endel/vim-github-colorscheme'
" as the aire line comes
" Bundle 'Lokaltog/vim-powerline'
Bundle 'Shutnik/jshint2.vim'
Bundle 'mattn/emmet-vim'
Bundle 'kien/ctrlp.vim'
Bundle 'maksimr/vim-jsbeautify'
"ultisnips
Bundle 'SirVer/ultisnips'

" Syntax // copyed from https://github.com/tlikai/dotfiles/blob/master/.vimrc
Bundle 'groenewege/vim-less'
Bundle 'plasticboy/vim-markdown'
Bundle 'tlikai/phpvim'
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'markwu/vim-laravel4-snippets'
Bundle 'xsbeats/vim-blade'
" Syntax end

" Misc copyed from https://github.com/tlikai/dotfiles/blob/master/.vimrc
Bundle 'Shougo/unite.vim'
Bundle 'bling/vim-airline'
Bundle 'matchit.zip'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'stephpy/vim-php-cs-fixer'
"Bundle 'Yggdroot/indentLine'
Bundle 'terryma/vim-expand-region'
Bundle 'terryma/vim-multiple-cursors'
" Mics end

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"

Bundle "godlygeek/tabular"
Bundle "pangloss/vim-javascript"
"Bundle "moll/vim-node"
" Ctrlp:
Bundle "kien/ctrlp.vim"
Bundle "tomasr/molokai"

"SingleCompile
Bundle "vim-scripts/SingleCompile"

"supertab
Bundle "ervandew/supertab"

"surround
Bundle "tpope/vim-surround"

"youcompleteme
Bundle  'Valloric/YouCompleteMe'

"tern_for_vim
Bundle 'marijnh/tern_for_vim'

"taghighlight
Bundle "magic-dot-files/TagHighlight"

"tmuxline
Bundle "edkolev/tmuxline.vim"

"tagbar
Bundle "majutsushi/tagbar"

"自动检测文件类型并加载相应的设置
filetype plugin indent on     " required!
"set cindent shiftwidth=2

"智能对齐方式
set smartindent
set cursorline cursorcolumn


" Disable swapfile and backup {{{
set nobackup
set noswapfile

"remap leader key{{{
let mapleader=','

"自动缩进
set autoindent
"一个tab是2个字符
set tabstop=2 " tab width is 4 spaces
set shiftwidth=2     "
"按一次tab是2个字符
set softtabstop=2
set expandtab
set textwidth=300
set t_Co=256
set number
set hidden
set showmatch
set autoread
set title
set ruler
syntax on
set incsearch
set hls
set laststatus=2
set encoding=utf-8
set wildmenu
set tags+=./tags
set ignorecase

"Style
set t_Co=256
set linespace=4
colorscheme solarized
if has('gui_running')
  set background=dark
  set guioptions-=m
  set guioptions-=T
  set guioptions-=r
  set guioptions-=l
else
  set background=dark
endif



set path=~/Documents/first

"Fuffinder
"nmap <leader>f :FufCoverageFile <cr>
"let g:fuf_coveragefile_globPatterns = ['**/*.js', '**/*.html','**/*.css','**/*.json','**/*.md']
"let g:fuf_coveragefile_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|node_modules'

"NERDTree:
nmap <F2> :NERDTreeToggle <cr>

"CtrlP:
let g:ctrlp_map = '<leader>f'
"let g:ctrlp_working_path_mode = 'c'

set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip     " MacOSX/Linux

"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

"Tabularize
if exists(":Tabularize")
  nmap <leader>a= :Tabularize /=<CR>
  vmap <leader>a= :Tabularize /=<CR>
  nmap <leader>a: :Tabularize /:<CR>
  vmap <leader>a: :Tabularize /:<CR>
endif

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

"powerline setting
let g:Powerline_symbols = 'fancy'
set guifont=Ubuntu\ Mono\ for\ Powerline\ 12

"airline setting
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" old vim-powerline symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

"airline: buf view
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '⮀'
let g:airline#extensions#tabline#left_alt_sep = '⮁'

"tmuxline settin
let g:tmuxline_preset = 'full'
let g:tmuxline_separators = {
    \ 'left' : '⮀',
    \ 'left_alt': '⮁',
    \ 'right' : '⮂',
    \ 'right_alt' : '⮃',
    \ 'space' : ' '}


"UltiSnips setting
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"SingleCompile setting
nmap <F9> :SCCompile<cr>
nmap <F10> :SCCompileRun<cr>

"Quick start tarbar
nmap <F8> :TagbarToggle<CR>


"""""""""""syntastic"""""
"set error or warning signs
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '☢ '


""""""""""""YCM""""""""""""""'
"change you complete me plugin default mappings"{{{
""refer to this blog post :http://0x3f.org/blog/make-youcompleteme-ultisnips-compatible/
let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-S-TAB>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-Tab>'

nmap <tab> :bn <cr>
nmap <s-tab> :bp <cr>
nmap <leader>rc :e ~/.vimrc <cr>
noremap <silent><Leader>/ :nohls<CR>

"easy resize window resize with arrowkey  from www.vimbits.com 
noremap <s-j> <c-w>+
noremap <s-k> <c-w>-
noremap <s-h> <c-w><
noremap <s-l> <c-w>>

" automatically reload vimrc when it's saved
"au BufWritePost .vimrc so ~/.vimrc
set dictionary+=/usr/share/dict/words
"Pressing ,ss will toggle and untoggle spell checking
map ,ss :setlocal spell!<cr>

"Resize Vsplits on window resize
au VimResized * exe "normal! \<c-w>="


"autocommand for vim-node
"autocmd User Node if &filetype == "javascript" | setlocal expandtab | endif
