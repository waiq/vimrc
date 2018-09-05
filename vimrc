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

  " vim shell
  Plug 'Shougo/vimshell.vim'

  Plug 'Shougo/vimproc.vim', {'do' : 'make'}

  " Run external commands
  Plug 'skywind3000/asyncrun.vim'

  " Go debugging 
  Plug 'sebdah/vim-delve' 

  " Python auto format
  Plug 'tell-k/vim-autopep8'

  " Asynchronous Lint Engine
  Plug 'w0rp/ale'

  "Java completion
  Plug 'artur-shaik/vim-javacomplete2' 

  " Git 
  Plug 'tpope/vim-fugitive'

  " Vim Colorchemes theme
  Plug 'flazz/vim-colorschemes'

  " show git symbols in NeardTree
  Plug 'Xuyuanp/nerdtree-git-plugin'

  " Integrate tmux and vim
  Plug 'christoomey/vim-tmux-navigator'

  " You compelete me, code complete
  " This will install all:
  " cd ~/.vim/bundle/YouCompleteMe
  " ./install.py --all
  Plug 'Valloric/YouCompleteMe'

  "Plug 'Shougo/deoplete.nvim'
  "Plug 'roxma/nvim-yarp'
  "Plug 'roxma/vim-hug-neovim-rpc'

  " Misc handling, used by easytags
  Plug 'xolox/vim-misc'

  " Ctags handling, used by Tagbar
  "Plug 'xolox/vim-easytags'
  
  " Ctags navigation
  Plug 'ludovicchabant/vim-gutentags'

  " Tagbar
  Plug 'majutsushi/tagbar'

  " Ack 
  Plug 'mileszs/ack.vim'

  " shows a git diff in the 'gutter' 
  Plug 'airblade/vim-gitgutter'

  " Snippets.
  Plug 'SirVer/ultisnips'

  "  Android dev in vim
  Plug 'hsanson/vim-android'

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
  set statusline=\:\%f\
  set statusline+=%m      "modified flag 
  set statusline+=%r      "read only flag"
  set statusline+=%=
  set statusline+=Buffer:\%n "Buffer number
  set statusline+=\ Line%l/%L   "cursor line/total lines
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

  " ================ Commands =======================

  " Pritty formats Json in current buffer
  command PrittyJson :execute '%!python -m json.tool'

  " search or tselect's word under cursor, in tags
  command TselectWord :execute 'tselect '.expand('<cword>')

  " ================ Tags =======================
  " local project tag file, locate in git folder.
  "
  let g:easytags_dynamic_files = 1

  " ================ KayBindings ====================
  " Ack
  nnoremap <Leader>a :Ack!<Space>
  if executable('ag')
    let g:ackprg = 'ag --vimgrep'
  endif

  " Open NERDTree
  nnoremap <Leader>n :NERDTreeToggle<CR>

  " Find current file in NERDTree
  nnoremap <Leader>hf :NERDTreeFind<CR>

  " Open tagbar
  nnoremap <Leader>v :TagbarToggle<CR>

  " Show open buffers
  nnoremap <Leader>j :CtrlPBuffer<CR>

  " CtrP seach in tags
  nnoremap <leader>pt :CtrlPTag<cr>

  " Tags search (TSelect) word under cursor
  nnoremap <silent><leader>f :TselectWord<CR>

  " Regenerate ctags
  nnoremap <Leader>rt :!ctags --exclude=.git --extra=+f -R *<CR><CR>

  " Show list symbles
  nnoremap <silent><leader>li :set list!<CR>

  " Show Line Numbers
  nnoremap <silent><Leader>l :set rnu!<CR>

  " Save all changes
  nnoremap <silent><leader>w :wa<CR>

  " Quit
  nnoremap <silent><leader>q :q<CR>

  " No highlight 
  nnoremap <silent><leader>h :noh<CR>

  " Easier window navigation
  nnoremap <C-J> <C-W>j
  nnoremap <C-K> <C-W>k
  nnoremap <C-H> <C-W>h
  nnoremap <C-L> <C-W>l


  " ================== Gutentags ===================== 
  let g:gutentags_ctags_tagfile = '.tags'
  set tags+=.tags;/

  " ================ AsyncRun Settings =======================
  let g:asyncrun_open = 8 

  " ================ ALE Settings =======================
  let g:ale_linters = {
        \  'go': ['go build','gofmt', 'golint', 'go vet', 'gosimple', 'staticcheck'],
        \  'java': ['checkstyle']
        \}

  "   'go':  ['go build', 'gofmt', 'golint', 'gosimple', 'go vet', 'staticcheck']
  " ================ vim-autoclose =======================
  " Fix dubble esc 
  let g:AutoClosePumvisible = {"ENTER": "", "ESC": ""}

  " ================ GoLang =======================
  let g:go_fmt_command = "goimports"

  au FileType go nmap <leader>b <Plug>(go-build)
  au FileType go nmap <leader>t <Plug>(go-test)
  au FileType go nmap <leader>ta :GoAlternate<CR>
  au FileType go nmap <leader>s <Plug>(go-implements)
  au FileType go nmap <leader>i <Plug>(go-info)
  au FileType go nmap <leader>e <Plug>(go-rename)
  au FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
  au FileType go nmap <Leader>d <Plug>(go-doc)

  let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment']

  let g:go_highlight_string_spellcheck = 1
  let g:go_highlight_format_strings = 1
  filetype plugin on    " Enable filetype-specific plugins


  " ================ Python =======================
  autocmd FileType python set equalprg=autopep8\ -

  " ================ Ruby =======================
  let g:ruby_path = system('rvm current')

  autocmd FileType ruby compiler ruby
  autocmd FileType ruby set re=1
  filetype on           " Enable filetype detection
  filetype indent on    " Enable filetype-specific indenting
  filetype plugin on    " Enable filetype-specific plugins

  " ================ Java Android =======================
  au FileType java setlocal omnifunc=javacomplete#Complete

  au FileType java nmap <Leader>b :AsyncRun gradle Readly:compileDebugJavaWithJavac<CR>
  au FileType java nmap <Leader>i :AsyncRun gradle Readly:installDebug<CR>

  " Emulator
  au FileType java nmap <Leader>eo :silent exec "!$ANDROID_HOME/emulator/emulator -avd <cword> 1>/dev/null 2>&1 &" <CR> :redraw! <CR>
  au FileType java nmap <Leader>el :AsyncRun $ANDROID_HOME/emulator/emulator -list-avds<CR>
  

  let g:JavaComplete_BaseDir ='~/.cache'
  let g:JavaComplete_LibsPath ='/usr/local/share/android-sdk/platforms/android-27/android.jar'
  let g:android_adb_tool='/usr/local/share/android-sdk/platform-tools/adb'
  let g:gradle_path='/usr/local/Cellar/gradle/4.7'

  " ================ Gitgutter =======================
  let g:gitgutter_eager = 0
  let g:gitgutter_realtime = 0


  " ================ Snippets =======================
  " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
  let g:UltiSnipsExpandTrigger="<c-j>"
  let g:UltiSnipsJumpForwardTrigger="<c-b>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"

  " If you want :UltiSnipsEdit to split your window.
  let g:UltiSnipsEditSplit="vertical"

  " ================ YCM =======================
  let g:ycm_semantic_triggers =  {
        \   'c' : ['->', '.'],
        \   'objc' : ['->', '.'],
        \   'cpp,objcpp' : ['->', '.', '::'],
        \   'perl' : ['->'],
        \   'php' : ['->', '::'],
        \   'cs,java,javascript,d,vim,ruby,python,perl6,scala,vb,elixir,go' : ['.'],
        \   'lua' : ['.', ':'],
        \   'erlang' : [':'],
        \ }

  " ================ VIM custom =======================
  " Diff mode config
  if &diff
    " Diff key binings

    " Close all
    nnoremap <silent><leader>q :qa<CR>

    colorscheme evening
    set cursorline
    map ] ]c
    map [ [c
  endif
