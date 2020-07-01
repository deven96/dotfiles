set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" If installed using git
set rtp+=~/.fzf
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mattn/emmet-vim'
Plugin 'prettier/vim-prettier',
Plugin 'dracula/vim'
Plugin 'kaicataldo/material.vim'
Plugin 'luochen1990/rainbow'
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'altercation/vim-colors-solarized'
Plugin 'haya14busa/incsearch.vim'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'pangloss/vim-javascript'
Plugin 'dense-analysis/ale'
Plugin 'fatih/vim-go'
Plugin 'mzlogin/vim-markdown-toc'
Plugin 'kristijanhusak/vim-carbon-now-sh'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'grvcoelho/vim-javascript-snippets'
Plugin 'Valloric/YouCompleteMe'
Plugin 'christoomey/vim-system-copy'
Plugin 'vim-airline/vim-airline'
Plugin 'mileszs/ack.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'zivyangll/git-blame.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"Copy Paste techniques"
let g:system_copy#copy_command='xclip -sel clipboard'
let g:system_copy#paste_command='xclip -sel clipboard -o'
" NERDTree Config
let g:NERDTreeWinPos = "left"
let g:nerdtree_tabs_open_on_console_startup=1
map <Leader><Tab> <plug>NERDTreeTabsToggle<CR>
" NERD commenter Config
let g:NERDDefaultAlign = 'start'
" Allow NERDTree to change CD
let g:NERDTreeChDirMode=2
"Javascript vim"
let g:javascript_plugin_jsdoc = 1
" Editor Configuration
set nu
" Set relative line numbering
set relativenumber
" show existing tab with 4 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab
set omnifunc=syntaxcomplete#Complete
" replace internal grep
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
" Fluid Edit my .vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" git blame edit
nnoremap <Leader>gb :<C-u>call gitblame#echo()<CR>
" Map javascipt autocomplete to ctrl-J"
imap <C-J> <esc>a<Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger
" Remap esc
inoremap jk <esc>
inoremap <esc> <nop>
" Use space to move
nnoremap <space><space> <c-w>
" Copy and paste from system clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p
" nerd tree mappings
" close vim if only NERDTree buffer is left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <Leader>n :NERDTreeToggle<CR>
"git mappings"
nnoremap <Leader>gs :G<CR>
nnoremap <Leader>gj :diffget //3<CR>
nnoremap <Leader>gf :diffget //2<CR>
" FZF mappings
" Leader P for searching for files
nnoremap <Leader>p :Files<CR>
" Leader F for searching within file
nnoremap <Leader>f :Rg<CR>
" Set this variable to 1 to fix files when you save them.
let g:ale_fixers = {
      \ 'python': ['isort', 'autopep8'], 
      \ 'javascript': ['prettier', 'eslint'],
      \}
let g:ale_linters = {'python': ['pylint'], 'javascript': ['eslint']}
"let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1

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
  call NERDTreeHighlightFile('py', 'Magenta', 'none', '#ff00ff', '#151515')

function! MarkWindowSwap()
      let g:markedWinNum = winnr()
    endfunction

function! DoWindowSwap()
  "Mark destination
  let curNum = winnr()
  let curBuf = bufnr( "%" )
  exe g:markedWinNum . "wincmd w"
  "Switch to source and shuffle dest->source
  let markedBuf = bufnr( "%" )
  "Hide and open so that we aren't prompted and keep history
  exe 'hide buf' curBuf
  "Switch to dest and shuffle source->dest
  exe curNum . "wincmd w"
  "Hide and open so that we aren't prompted and keep history
  exe 'hide buf' markedBuf 
endfunction

noremap <silent> <Leader>mw :call MarkWindowSwap()<CR>
noremap <silent> <Leader>pw :call DoWindowSwap()<CR>
