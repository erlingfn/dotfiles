
" General settings------------------------------------------------------------
  syntax on                                         " turn on syntax
  let mapleader = ","                               " map leader to ','
  filetype indent on                                " indent based on file type
  set encoding=utf8                                 " UTF8 encoding of file
  set number                                        " normal line numbers
  set ttimeoutlen=10                                " used for key code delays
  set scrolloff=10                                  " always keep lines at end
  set mouse=a                                       " enable mouse movements
  set nowrap                                        " lines don't wrap
  set noswapfile                                    " no stupid .swp file
  set autoindent                                    " turns on auto indent
  set smartindent                                   " does (mostly) right indenting
  set tabstop=2                                     " tabs are at proper location
  set shiftwidth=4                                  " one tab are 4 spaces
  set expandtab                                     " tabs are actually spaces
  set smarttab                                      " tabs fit with tabstops
  set hlsearch                                      " highlight all matching text
  set incsearch                                     " enable incremental search
  set ignorecase                                    " /the -> the/The/THE/tHe
  set smartcase                                     " goes together with ignorecase
  set hidden                                        " open new buffer without saving

" General mappings------------------------------------------------------------
  nmap <silent> <leader>b :noh<CR>
  map <leader>s :setlocal spell! spelllang=en_us<CR>
  noremap <leader><space> :Buffers<CR>
  noremap! <C-BS> <C-w>
  noremap! <C-h> <C-w>
  noremap <Up> <NOP>
  noremap <Down> <NOP>
  noremap <Left> <NOP>
  noremap <Right> <NOP>
  noremap <C-l> :bn<CR>
  noremap <C-h> :bp<CR>
  noremap <C-j> :bp<cr>:bd #<cr>
  noremap dl d$
  noremap dh d0
  noremap el $
  noremap eh 0<left>
  noremap yl y$
  noremap yh y0
  inoremap <C-l> <esc>%%a
  inoremap << <><left>
  vnoremap > >gv
  vnoremap < <gv
  vnoremap . :normal .<CR>
  vnoremap ' :normal @a<CR>


  

" fix copy/paste outside of vim
  vnoremap <C-c> "+y


" Vundel plugin manager config------------------------------------------------
  set nocompatible                                  " required for vundle
  filetype off                                      " required for vundle
  set rtp+=~/.vim/bundle/Vundle.vim                 " runtime path
  call vundle#begin('~/.vim/bundle')                " START ADDING PLUGINS
  Plugin 'jremmen/vim-ripgrep'                      " ripgrep support in vim
  Plugin 'VundleVim/Vundle.vim'                     " main vundle plugin
  Plugin 'kristijanhusak/vim-hybrid-material'       " colourscheme
  Plugin 'pangloss/vim-javascript'                  "better javascript highlighting
  Plugin 'sheerun/vim-polyglot'                     " syntax
  Plugin 'vim-airline/vim-airline'                  " statusline
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'Raimondi/delimitMate'                     " autocomplete for paranthesis and brackets
  Plugin 'scrooloose/nerdtree'                      " document tree
  Plugin 'jistr/vim-nerdtree-tabs'                  " document tree tabs
  Plugin 'Xuyuanp/nerdtree-git-plugin'              " git flags
  Plugin 'mbbill/undotree'                          " list all undos you can do
  Plugin 'airblade/vim-gitgutter'                   " show vim diff in gutter
  Plugin 'mxw/vim-jsx'                              " allow jsx syntax
  Plugin 'w0rp/ale'                                 " support linting
  Plugin 'alvan/vim-closetag'                       " html tag completion
  Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " use fzf in vim
  Plugin 'junegunn/fzf.vim'                          

  Plugin 'Shougo/deoplete.nvim'                     " autocomplete
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
  Plugin 'deoplete-plugins/deoplete-jedi'           
  call vundle#end()                                 " STOP ADDING PLUGINS
  filetype plugin indent on                         " turn back on again
" ----------------------------------------------------------------------------
"
" Airline
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_section_z = ''
  let g:airline#extensions#ale#enabled = 1

" Theme settings
  set background=dark
  colorscheme hybrid_material
  let g:airline_theme = "hybrid"
  
" Using vim tree to make vim more user friendly-------------------------------
  map <LEADER>, :NERDTreeTabsToggle<CR>
  map <leader>r :NERDTreeFind<cr>
  let NERDTreeMinimalUI = 1
  let NERDTreeDirArrows = 1
  let g:NERDTreeShowIgnoredStatus = 1
  let g:NERDTreeWinSize = 30
  let NERDTreeShowHidden = 1
  let NERDTreeQuitOnOpen = 0
  map <leader>r :NERDTreeFind<cr>
  autocmd vimenter * NERDTree
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Puts you in insertmode when file is gitcommit
  autocmd FileType gitcommit  exec 'au VimEnter * startinsert'

" Map undotree button
  nnoremap <F5> :UndotreeToggle<cr>

" Git gutter settings
  let g:gitgutter_sign_added = '|'
  let g:gitgutter_sign_modified = '|'
  let g:gitgutter_sign_removed = '|'
  let g:gitgutter_sign_removed_first_line = '__'
  let g:gitgutter_sign_modified_removed = '__'

" Ale settings---------------------------------------------------------------
  let g:ale_fixers = {
    \  'javascript': ['prettier'],
    \  'typescript': ['prettier'],
    \  'python': ['yapf'], 
    \}
  let g:ale_linters = {
    \ 'javascript': ['eslint'], 
    \ 'typescript': ['eslint'], 
    \ 'python': ['pylint'],
    \}
  let g:ale_fix_on_save = 1
  let g:ale_sign_column_always = 1
  let g:ale_lint_on_text_changed = 'never'
  let g:ale_linters_explicit = 1
  let g:ale_sign_error = '●'
  let g:ale_sign_warning = '●'
  highlight ALEErrorSign ctermbg=NONE ctermfg=red
  highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

" Autocomplete
  let g:deoplete#enable_at_startup = 1
  let g:neosnippet#enable_completed_snippet = 1
  inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
  set completeopt-=preview

" better java highlighting
  let g:java_highlight_functions = 1

" make vim use pyxversion3
  set pyxversion=3                                                                     

" Other stuff
  hi VertSplit ctermbg=234 ctermfg=234

" html completion
  let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.js'

" delimitMate
  let delimitMate_expand_space = 1 "turns on expand space
  let delimitMate_expand_cr = 1 "turns on expand cr

 

