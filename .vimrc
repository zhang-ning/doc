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
Bundle 'Lokaltog/vim-powerline'
Bundle 'Shutnik/jshint2.vim'
Bundle 'mattn/emmet-vim'
Bundle 'kien/ctrlp.vim'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'maksimr/vim-jsbeautify'
"ultisnips
"Bundle 'SirVer/ultisnips'

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"

Bundle "godlygeek/tabular"

" Optional:
Bundle "honza/vim-snippets"
Bundle "pangloss/vim-javascript"
Bundle "moll/vim-node"

"自动检测文件类型并加载相应的设置
filetype plugin indent on     " required!
"set cindent shiftwidth=2

"智能对齐方式
set smartindent


" Ctrlp:
Bundle "kien/ctrlp.vim"

" Disable swapfile and backup {{{
set nobackup
set noswapfile

"remap leader key{{{
let mapleader=','

"set completeopt-=preview
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

colorscheme solarized
set background=dark
if has('gui_running')
  set background=light
else
  set background=dark
endif

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=l

"Fuffinder
"nmap <leader>f :FufCoverageFile <cr>
"let g:fuf_coveragefile_globPatterns = ['**/*.js', '**/*.html','**/*.css','**/*.json','**/*.md']
"let g:fuf_coveragefile_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|node_modules'

"NERDTree:
nmap <F2> :NERDTreeToggle <cr>

"CtrlP:
let g:ctrlp_map = '<leader>f'
let g:ctrlp_working_path_mode = 'c'

set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip     " MacOSX/Linux

"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

"Tabularize
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:<CR>
  vmap <Leader>a: :Tabularize /:<CR>
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



"youcompleteme tab issue with ultisnips
"let g:UltiSnipsExpandTrigger="<c-j>"
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"


"custome mapping

nmap <tab> :bn <cr>
nmap <s-tab> :bp <cr>
nmap <leader>v :e ~/.vimrc <cr>
nmap <leader>s :so ~/.vimrc <cr>


"autocommand for vim-node
autocmd User Node if &filetype == "javascript" | setlocal expandtab | endif
