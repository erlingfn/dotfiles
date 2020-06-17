
" General settings------------------------------------------------------------
  syntax on                                         " turn on syntax
  let mapleader = ","                               " map leader to ','
  filetype indent on                                " indent based on file type
  set number                                        " normal line numbers
  set mouse=a                                       " enable mouse movements
  set nowrap                                        " lines don't wrap
  set noswapfile                                    " no stupid .swp file
  set autoindent                                    " turns on auto indent
  set smartindent                                   " does (mostly) right indenting
  set tabstop=2                                     " tabs are at proper location
  set expandtab                                     " tabs are actually spaces
  set smarttab                                      " tabs fit with tabstops
  set hlsearch                                      " highlight all matching text
  set incsearch                                     " enable incremental search
  set ignorecase                                    " /the -> the/The/THE/tHe
  set smartcase                                     " goes together with ignorecase
  set hidden                                        " open new buffer without saving
  set updatetime=300                                " update diagnostic messages more often
  set shortmess+=c                                  " dont give ins-completion menu messages                                  

" General mappings------------------------------------------------------------
  nmap <silent> <leader>b :noh<CR>
  map <leader>l :setlocal spell! spelllang=en_us<CR>
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
  inoremap <C-l> <esc>%%a
  inoremap << <><left>
  vnoremap > >gv
  vnoremap < <gv
  vnoremap . :normal .<CR>
  vnoremap ' :normal @a<CR>

" fix copy/paste from outside of vim
  vnoremap <C-c> "+y

" Vundel plugin manager config------------------------------------------------
  set nocompatible                                  " required for vundle
  filetype off                                      " required for vundle
  set rtp+=~/.vim/bundle/Vundle.vim                 " runtime path
  call vundle#begin('~/.vim/bundle')                " START ADDING PLUGgNS
  Plugin 'VundleVim/Vundle.vim'                     " main vundle plugin
  Plugin 'tpope/vim-sleuth'                         " automatic tab width
  Plugin 'morhetz/gruvbox'                          " colourscheme
  Plugin 'sainnhe/gruvbox-material'                 " colourscheme
  Plugin 'pangloss/vim-javascript'                  " better javascript highlighting
  Plugin 'sheerun/vim-polyglot'                     " syntax
  Plugin 'vim-airline/vim-airline'                  " statusline
  Plugin 'vim-airline/vim-airline-themes'           " themes for statusline
  Plugin 'Raimondi/delimitMate'                     " autocomplete for paranthesis and brackets
  Plugin 'scrooloose/nerdtree'                      " document tree
  Plugin 'jistr/vim-nerdtree-tabs'                  " document tree tabs
  Plugin 'Xuyuanp/nerdtree-git-plugin'              " git flags
  Plugin 'mbbill/undotree'                          " list all undos you can do
  Plugin 'airblade/vim-gitgutter'                   " show vim diff in gutter
  Plugin 'w0rp/ale'                                 " support linting
  Plugin 'alvan/vim-closetag'                       " html autoclosing
  Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " use fzf in vim
  Plugin 'junegunn/fzf.vim'                          
  Plugin 'neoclide/coc.nvim', {'branch': 'release'} " Autocomplete
  call vundle#end()                                 " STOP ADDING PLUGINS
  filetype plugin indent on                         " turn back on again
" ----------------------------------------------------------------------------
"
" Airline
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#ale#enabled = 1
  let g:airline#extensions#coc#enabled = 1

" Theme settings
  if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  endif
  syntax enable
  let g:gruvbox_material_disable_italic_comment = 1
  set background=dark
  colorscheme gruvbox-material
  let g:airline_theme = "gruvbox_material"

" Using vim tree to make vim more user friendly-------------------------------
  map <LEADER>, :NERDTreeTabsToggle<CR>
  map <leader>g :NERDTreeFind<cr>
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
  let g:gitgutter_sign_added = '+'
  let g:gitgutter_sign_modified = '~'
  let g:gitgutter_sign_removed = '-'
  let g:gitgutter_sign_priority = 0
  let g:gitgutter_sign_column_highlight = 0
  highlight GitGutterAdd    guifg=#009900 guibg=#282828 ctermfg=2
  highlight GitGutterChange guifg=#bbbb00 guibg=#282828 ctermfg=3
  highlight GitGutterDelete guifg=#ff2222 guibg=#282828 ctermfg=1
  highlight GitGutterChangeDelete guifg=#ff2222 guibg=#282828 ctermfg=4
  highlight SignColumn guibg=#282828

" Ale settings---------------------------------------------------------------
  let g:ale_fixers = {
    \  'c': ['clang-format'],
    \  'javascript': ['prettier'],
    \  'typescript': ['prettier'],
    \  'python': ['black', 'isort', 'autopep8'],
    \  'markdown': ['prettier'],
    \  'java': ['google_java_format'],
    \}
  let g:ale_linters = {
    \ 'javascript': ['eslint'], 
    \ 'typescript': ['eslint'], 
    \ 'python': ['flake8'],
    \ 'markdown': ['mdl'],
    \}
  let g:ale_fix_on_save = 1
  let g:ale_lint_on_save = 1
  let g:ale_sign_column_always = 1
  let g:ale_lint_on_text_changed = 'never'
  let g:ale_linters_explicit = 1
  let g:ale_sign_error = '●'
  let g:ale_sign_warning = '●'
  highlight ALEErrorSign guibg=#282828 guifg=red
  highlight ALEWarningSign guibg=#282828 guifg=yellow

" Autocomplete  
  autocmd FileType json syntax match Comment +\/\/.\+$+
	function! s:check_back_space() abort
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~ '\s'
	endfunction

	inoremap <silent><expr> <Tab>
					\ pumvisible() ? "\<C-n>" :
					\ <SID>check_back_space() ? "\<Tab>" :
					\ coc#refresh()

" Vim javascript
  let g:javascript_plugin_flow = 1


" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
  nnoremap <leader>f :CocCommand document.renameCurrentWord

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
  let delimitMate_matchpairs = "(:),[:],{:}"

" Fzf / ripgrep settings
    nnoremap <LEADER>s :GFiles<CR>
    nnoremap <LEADER>r :Rg<CR>
        command! -bang -nargs=* Rg
        \ call fzf#vim#grep(
        \   'rg --color always --line-number --column --line-number --hidden --glob !flow-typed/* --glob !*.lock --glob !.git/* --ignore-case '.shellescape(<q-args>), 1,
        \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
        \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
        \   <bang>0) 

