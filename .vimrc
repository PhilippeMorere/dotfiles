filetype indent on

filetype off                  " required
set nocompatible              " be iMproved, required
set modelines=0               " against security exploits

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugin for nice code folding
Plugin 'tmhedberg/SimpylFold'

" Plugin for proper indentation
Plugin 'vim-scripts/indentpython.vim'

" Plugin to autocomplete functions and vars in Python
Plugin 'https://github.com/Valloric/YouCompleteMe.git'

" Plugin for Python syntax check
Plugin 'scrooloose/syntastic'

" Plugin for Pep8 format checking
Plugin 'nvie/vim-flake8'

" Plugin to list files in working folder
Plugin 'scrooloose/nerdtree'

" Plugin for super search in Vim with <ctrl>-P
Plugin 'kien/ctrlp.vim'

" Plugin for git integration
Plugin 'tpope/vim-fugitive'

" Plugin for commenting code easily
Plugin 'scrooloose/nerdcommenter'

" Plugin to add Powerline status bar
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Plugin for airline status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" For Latex
Plugin 'lervag/vimtex'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required

call pathogen#infect()
call pathogen#helptags()

let python_highlight_all=1
" map \\ :NERDTreeToggle
filetype plugin indent on    " required
syntax on

" Set default python to python3
let g:pymode_python = 'python3'

" Handy stuff
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
" set undofile " persistent undo

" For searching/moving
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" Reveal invisible characters
set list
set listchars=tab:▸\ ,eol:¬

" Learning to use hjkl
"	nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>

" Sane j and k motion
nnoremap j gj
nnoremap k gk

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

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" #### From http://www.alexeyshmalko.com/2014/using-vim-as-c-cpp-ide/
"
" This option forces Vim to source .vimrc file if it present in working
" directory
set exrc
" This option will restrict usage of some commands in non-default .vimrc
" files; commands that write to file or execute shell commands are not allowed
" and map commands are displayed.
set secure

" set indentation rules
set tabstop=2
set softtabstop=2
set shiftwidth=2
set noexpandtab

" keep my lines 110 chars at most
" highlight column number 110 with color.
set colorcolumn=79
highlight ColorColumn ctermbg=darkgray

" Bind make to F5
nnoremap <F5> :make!<cr>

" Set airline theme to solarized
let g:airline_theme='solarized'

" Change font & colorscheme
syntax enable
colorscheme solarized
if has("gui_running")
  set background=light
  let g:airline_solarized_bg='light'
  set guifont=Inconsolata\ 11
else
  set background=dark
  let g:airline_solarized_bg='dark'
  set guifont=Inconsolata\ for\ Powerline\ Medium\ 11
endif

" Show line numbers
set nu!

" Enable 256 colors in terminal
set t_Co=256

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
" See docstring for folded code
let g:SimpylFold_docstring_preview=1

" Auto-indent python files
au BufNewFile,BufRead *.py;
	\ set tabstop=4
	\ set softtabstop=4
	\ set shiftwidth=4
	\ set textwidth=79
	\ set expandtab
	\ set autoindent
	\ set fileformat=unix

" Color extra white space as bad
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
     au!
         au BufReadPost *
                 \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" Make sure YouCompleteMe window goes away
let g:ycm_autoclose_preview_window_after_completion=1
" Shortcut to just to YouCompleteMe definition: <space>-g
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Get nerdTree to ignore *.pyc files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTreelet NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Access OS clipboard
set clipboard=unnamed

" Start NerdTree on Vim startup
" autocmd vimenter * NERDTree

" Toogle NerdTree with F3
map <F3> :NERDTreeToggle<CR>
" Open ConqueTerminal with F4
map <F4> :below :6sp <bar> wincmd J <bar> :res 6 <bar> :ConqueTerm bash<CR>

" Automatically displays all buffer names
let g:airline#extensions#tabline#enabled = 1

" Airline Conf
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
let g:airline#extensions#readonly#symbol   = '⊘'
let g:airline#extensions#linecolumn#prefix = '¶'
let g:airline#extensions#paste#symbol      = 'ρ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Get rid of error/warning in bottom right corner
let g:airline_section_warning = ''
let g:airline_section_error = ''


" Suggested config for Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:syntastic_quiet_messages = { "regex": 'invalid-name\|missing-docstring' }
" Limit Syntastic window size to height 8
function! SyntasticCheckHook(errors)
	if !empty(a:errors)
		let g:syntastic_loc_list_height = min([len(a:errors), 8])
	endif
endfunction

" Disable VIM toolbar and menubar
:set guioptions-=T
:set guioptions-=m
:set guioptions-=L " Makes NerdTree not mess layout on open
:set guioptions-=r " Removes scrollbars

" NERDCommenter settings
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Enable trimming of trailing whitespace when uncommenting
"let g:NERDTrimurailingWhitespace = 1

" So that closing buffer doesn't close split (\q to close buffer)
map <leader>q :bp<bar>vsp<bar>bn<bar>bd<CR>.

" Make latex file editing not laggy
au FileType tex setlocal nocursorline
au FileType tex :NoMatchParen
