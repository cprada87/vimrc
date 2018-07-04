" VIM Christian Prada:
" Version: 20180615
" Author: Christian Prada <cprada87@gmail.com> - http://github.com/cprada87
" Main Source: Juanmi Taboada <juanmi@juanmitaboada.com> - http://www.juanmitaboada.com
set termguicolors
set encoding=utf-8

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

call plug#begin('~/.vim/plugged')

Plug 'arielrossanigo/dir-configs-override.vim'
Plug 'motemen/git-vim'
Plug 'fisadev/fisa-vim-colorscheme'
Plug 'rosenfeld/conque-term'
Plug 'jeetsukumaran/vim-indentwise' "revisar funcionalidad
Plug 'davidhalter/jedi-vim'
Plug 'honza/vim-snippets'
Plug 'mhinz/vim-signify'
Plug 'lilydjwg/colorizer'
Plug 'mileszs/ack.vim'
Plug 'w0rp/ale'
Plug 'terryma/vim-multiple-cursors'
Plug 'chriskempson/base16-vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'justmao945/vim-clang'
Plug 'plasticboy/vim-markdown'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-repeat'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'szw/vim-tags'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'SirVer/ultisnips'
Plug 'djmoch/vim-makejob'
Plug 'tpope/vim-commentary'
Plug 'leafgarland/typescript-vim'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/xoria256.vim'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-dispatch'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-airline/vim-airline'
"Plug 'powerline/powerline'

if has('python')
    " YAPF formatter for Python
    Plug 'pignacio/vim-yapf-format'
endif
call plug#end()

" ============================================================================
" Install plugins the first time vim runs

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

" ============================================================================
" no vi-compatible
set nocompatible
 colorscheme base16-classic-dark

" === CHEATSHEET ===
"
" *                 Search forward word under the cursor    [ vim ]
" n                 Search next word using same criteria    [ vim ]
" <Shift>+n         Search previous word using same criteria[ vim ]
" #                 Search backward word under the cursor   [ vim ]
" K                 Search for the word inside the help     [ vim ]
" gd                Go to first definition                  [ vim ]
" <F2>              NERD Tree (on/off)                      [ nerdtree ]
" <F3>              Save current session on current folder  [ vim ]
" <F8>              Tagbar panel (on/off)                   [ tagbar ]
" <Alt>+<up>        Show all buffers                        [ BufferExplorer ]
" <Alt>+<down>      Close current buffer                    [ vim ]
" <Alt>+<left>      Move to previous buffer                 [ vim ]
" <Alt>+<right>     Move to next buffer                     [ vim ]
" <Ctrl>+<up>       Move current line/block up              [ vim ]
" <Ctrl>+<down>     Move current line/block down            [ vim ]
" <Ctrl>+<right>    Indent current line/block one level     [ vim ]
" <Ctrl>+<left>     Unindent current line/block one level   [ vim ]
" <Enter>           Go to function definition               [ vim ]
" <Backspace>       Go back from function definion          [ vim ]
"
" Ultisnips:
" :help ultisnips
" <Control+b> to move to next element
" <Control+z> to move to the previous element
" You write a tag and hit <F4>, possible tags are:
" if        if without else
" ife       if $1 else $2
" eif       else if ($1) { .. }
" el        else ..
" wh        while (cond) ...
" class     class ...
" def       def ...

"Type :ConqueTerm <command> to run your command in vim, for example:

":ConqueTerm bash
":ConqueTerm mysql -h localhost -u joe -p sock_collection
":ConqueTerm Powershell.exe
":ConqueTerm C:\Python27\python.exe
"
" Comentary:
" To comment from line 7 to 17 both included, use:
" :7,17Commentary
"
" ACK:
" To search everywhere for the word "colors" use:
" :Ack colors
"
" CtrlP:
" To search for files with the word "colors" use:
" <Ctrl+P> colors

set completeopt=menuone
set tabstop=4
set tw=0                            " Don't wrap lines at 80 columns
set linebreak                       " Don't wrap words by default
set textwidth=0                     " Don't wrap lines by default 
set viminfo='20,\"50                " Read/write a .viminfo file, don't store more than
set history=100                     " Keep 100 lines of command line history
set ruler                           " Show the cursor position all the time
set showcmd                         " Show (partial) command in status line.
set showmatch                       " Show matching brackets.
set incsearch                       " Incremental search
set nu                              " Number of lines
set cursorline
set cursorcolumn
set shiftwidth=4
set hlsearch
set hidden
set mouse=r                         " Enable mouse usage (all modes)
set autowrite                       " Automatic writing
set autoread                        " Reload file if changed
set laststatus=2
set ignorecase                      " Do case insensitive matching

" Show tabs and end of line
set softtabstop=4
set hardtabs=4
set expandtab
set list
set lcs=extends:$,tab:/.,eol:$
set showmatch
ab usetab :set noet ci pi sts=0 sw=4 ts=4 " Show tab character

" Remember last position
if has("autocmd")
    autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe "normal `\"" | endif
endif

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:deoplete#enable_at_startup = 1

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
" let g:javascript_plugin_flow = 1

" default folding settings
" set foldmethod=marker   " Using markers: {{{1  ...  }}}1
set foldmethod=indent   " Just perfect for Python
set foldnestmax=10
set nofoldenable
set foldlevel=1

" Tagbar and NERDTree Toggle
nmap <F8> :TagbarToggle<CR>
imap <F8> <Esc>:TagbarToggle<CR>
map <F2> :NERDTreeToggle<CR>
imap <F2> <Esc>:NERDTreeToggle<CR>

" Ultisnipts controls
let g:UltiSnipsExpandTrigger="<F4>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" ctags controls
" for ctags to work you must make a "tags" file inside some of your projects
" folder from the list of vim-tags plugin: [".git", ".hg", ".svn", ".bzr", "_darcs", "CVS"]
let g:vim_tags_use_language_field = 1
map <cr> <c-]>
map <bs> <c-t>

" Buffer management management
map  <A-Up> :BufExplorer<CR>
map! <A-Up> <Esc>:BufExplorer<CR>
map  <A-Right> :bnext<CR>
map! <A-Right> <Esc>:bnext<CR>
map  <A-Left> :bprevious<CR>
map! <A-Left> <Esc>:bprevious<CR>
map  <A-Down> :bd<CR>
map! <A-Down> <Esc>:bd<CR>

" move lines up and down from grendel-arsenal.googlecode.com
nnoremap <C-Down> :m+<CR>==
nnoremap <C-Up> :m-2<CR>==
inoremap <C-Down> <Esc>:m+<CR>==gi
inoremap <C-Up> <Esc>:m-2<CR>==gi
vnoremap <C-Down> :m'>+<CR>gv=gv
vnoremap <C-Up> :m-2<CR>gv=gv
" move lines right and left several times
nnoremap <C-Left> v<<Esc>
nnoremap <C-Right> v><Esc>
inoremap <C-Left> <Esc>v<<Esc>gi
inoremap <C-Right> <Esc>v><Esc>gi
vnoremap <C-Left> <gv
vnoremap <C-Right> >gv
vnoremap < <gv
vnoremap > >gv

" Save session
nmap <F3> :mks! .session.vim<CR>

" YouCompleteMe
nmap <C-Space> (g:ycm_key_invoke_completion)

" Jedi-Vim
let g:synaptic_python_flake8_args='--ignore=F821,E302,E501'
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "D"
let g:jedi#documentation_command = "<C-K>"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

" ALE configuration (Asynchronous Linter Engine)
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_python_pycodestyle_options = '--ignore=E501,E302'
nmap <silent> <C-S-Left> <Plug>(ale_previous_wrap) nmap <silent> <C-S-Right> <Plug>(ale_next_wrap)

" Show messages in a different manner
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Add support for prospector
autocmd FileType python setlocal makeprg=prospector\ -8\ -o\ pylint\ % errorformat=%f:%l:\ %m
let g:makejob_hide_preview_window = 1
map  <C-x> :MakeJob<CR>:copen<CR><C-w><Up>
map! <C-x> <Esc>:MakeJob<CR>:copen<CR><C-w><Up>

" Powerline

let g:powerline_pycmd = "py3"
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.whitespace = 'Ξ'

" " airline symbols
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''

