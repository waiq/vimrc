  call plug#begin('~/.vim/plugged')

  " NERDTree
  Plug 'scrooloose/nerdtree'

  " NERD Commenter
  " <leader>cc ,NERDComComment
  " <leader>c<space>, NERDComToggleComment: Toggle comment on selected lines
  " <leader>cs ,NERDComSexyComment
  " <leader>c$ ,NERDComEOLComment: Add comment to end off line
  " <leader>cu ,NERDComUncommentLine
  Plug 'scrooloose/nerdcommenter'

  " Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
  Plug 'https://github.com/kien/ctrlp.vim'

  " Go (golang) support for Vim
  Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

  " Asynchronous Lint Engine
  Plug 'w0rp/ale'

  " Git 
  Plug 'tpope/vim-fugitive'

  " Vim Colorchemes theme
  Plug 'flazz/vim-colorschemes'

  " show git symbols in NeardTree
  Plug 'Xuyuanp/nerdtree-git-plugin'

  " Integrate tmux and vim
  Plug 'christoomey/vim-tmux-navigator'

  " You compelete me, code complete
  Plug 'Valloric/YouCompleteMe'

  " Misc handling, used by easytags
  Plug 'xolox/vim-misc'

  " Ctags handling, used by Tagbar
  Plug 'xolox/vim-easytags'

  " Tagbar
  Plug 'majutsushi/tagbar'

  " Ack 
  Plug 'mileszs/ack.vim'

  " shows a git diff in the 'gutter' 
  Plug 'airblade/vim-gitgutter'

  " True Sublime Text style multiple selections for Vim
  " C-n mark word under currsor, C-n again will match the next one.
  Plug 'terryma/vim-multiple-cursors'

  " For deleting, changing, and adding surroudings
  " Change Surroundings, from " to '
  " Press cs"'
  " Change Surrounding Tag from <derp>..</derp> to "
  " Press cst"
  " Delete Surrounding "
  " Press ds"
  Plug 'tpope/vim-surround'

  " auto-close will e.g automatically insert a ')' to close '('
  Plug 'Townk/vim-autoclose'

  " Ruby support 
  Plug 'vim-ruby/vim-ruby'

  " snippets.
  Plug 'SirVer/ultisnips'

  " Snippets are separated from the engine.
  Plug 'honza/vim-snippets'

  call plug#end()

  let mapleader = ";"
  let maplocalleader = "'"

  syntax on

  " ================ Theme ============================
  silent! colorscheme hybrid_material
  

  " ================ General Config ===================
  set background=dark                                 " Set background to dark
  set t_Co=256                                        " Set 256 colors
  set nowrapscan                                      " do not wrap around
  set ruler
  set cc=80
  set listchars=tab:▸\ ,eol:¬,trail:·
  set hidden
  set cursorline                                      " highlight current line  :set hlsearch
  set ignorecase
  set laststatus=2
  set wildmenu
  set exrc
  set smartindent
  set secure
  set backspace=indent,eol,start
  set pastetoggle=<F2>
  set autoread
  set encoding=utf-8
  set timeoutlen=500 ttimeoutlen=0
  set ttyfast
  set lazyredraw
  set hlsearch
  set incsearch

  " ================ Turn Off Swap Files ==============
  set noswapfile
  set nobackup
  set nowb

  " ================ Indentation ======================
  set shiftwidth=2
  set softtabstop=2
  set tabstop=2
  set expandtab
  set smartindent
  set nofoldenable

  " ================ Completion =======================
  set wildmode=list:full
  "stuff to ignore when tab completing
  set wildignore=*.gitignore*
  set wildignore=*.o,*.obj,*~
  set wildignore+=*vim/backups*
  set wildignore+=*sass-cache*
  set wildignore+=*cache*
  set wildignore+=*logs*
  set wildignore+=*node_modules/**
  set wildignore+=*DS_Store*
  set wildignore+=*.gem
  set wildignore+=log/**
  set wildignore+=tmp/**
  set wildignore+=*.png,*.jpg,*.gif


  " ================ KayBindings ====================
  " Ack
  nnoremap <Leader>a :Ack!<Space>
  if executable('ag')
    let g:ackprg = 'ag --vimgrep'
  endif
 
  " open NERDTree
  nnoremap <Leader>n :NERDTreeToggle<CR>
  " find current file in NERDTree
  nnoremap <Leader>hf :NERDTreeFind<CR>

  " open tagbar
  nnoremap <Leader>v :TagbarToggle<CR>

  " show open buffers
  nnoremap <Leader>j :CtrlPBuffer<CR>

  " show list symbles
  nmap <silent><leader>l :set list!<CR>
  " save all changes
  nmap <silent><leader>w :wa<CR>
  " quit
  nmap <silent><leader>q :q<CR>
  " no highlight 
  nmap <silent><leader>h :noh<CR>

  nmap <leader>f :execute 'tselect '.expand('<cword>')<CR>

  " Easier window navigation
  nmap <C-h> <C-w>h
  nmap <C-j> <C-w>j
  nmap <C-k> <C-w>k
  nmap <C-l> <C-w>l

  " ================ vim-autoclose =======================
  " Fix dubble esc 
  let g:AutoClosePumvisible = {"ENTER": "", "ESC": ""}

  " ================ GoLang =======================
  let g:go_fmt_command = "goimports"

  au FileType go nmap <leader>r <Plug>(go-run)
  au FileType go nmap <leader>b <Plug>(go-build)
  au FileType go nmap <leader>t <Plug>(go-test)
  au FileType go nmap <leader>c <Plug>(go-coverage)
  au FileType go nmap <leader>ds <Plug>(go-def-split)
  au FileType go nmap <leader>dv <Plug>(go-def-vertical)
  au FileType go nmap <leader>dt <Plug>(go-def-tab)
  au FileType go nmap <leader>gd <Plug>(go-doc)
  au FileType go nmap <leader>gv <Plug>(go-doc-vertical)
  au FileType go nmap <leader>gb <Plug>(go-doc-browser)
  au FileType go nmap <leader>s <Plug>(go-implements)
  au FileType go nmap <leader>i <Plug>(go-info)
  au FileType go nmap <leader>e <Plug>(go-rename)
  au FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

  " ================ Ruby =======================
  let g:ruby_path = system('rvm current')

  " ================ Snippets =======================
  
  " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
  let g:UltiSnipsExpandTrigger="<c-x>"
  let g:UltiSnipsJumpForwardTrigger="<c-f>"
  let g:UltiSnipsJumpBackwardTrigger="<c-b>"
