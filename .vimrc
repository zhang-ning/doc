set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"let Vundle manage Vundle
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
Bundle 'Valloric/YouCompleteMe'
Bundle 'SirVer/ultisnips'
Bundle 'maksimr/vim-jsbeautify'

filetype plugin indent on     " required!
filetype indent on
set cindent shiftwidth=2


" Disable swapfile and backup {{{
set nobackup
set noswapfile

"remap leader key{{{
let mapleader=','

"set completeopt-=preview
set autoindent
set tabstop=2 " tab width is 4 spaces
set shiftwidth=2     "
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

"mapping
nmap <F2> :NERDTreeToggle <cr>
"Fuffinder
"nmap <leader>f :FufCoverageFile <cr>
let g:fuf_coveragefile_globPatterns = ['**/*.js', '**/*.html','**/*.css','**/*.json','**/*.md']
let g:fuf_coveragefile_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|node_modules'
"ctrlp
"let g:ctrlp_map = ',f'
nmap <leader>f :CtrlP <cr>

set wildignore+=*/node_modules/*,*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

"tab to next buffer
"nmap <tab> :bn <cr>
"nmap <s-tab> :bp <cr>
nmap <leader>v :e ~/.vimrc <cr>
nmap <leader>s :so ~/.vimrc <cr>

"youcompleteme tab issue with ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
