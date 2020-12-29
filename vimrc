set nocompatible              " be iMproved, required
filetype off                  " required
" Space the final frontier
let mapleader = ","
" Save key stroke
nnoremap ; :
nnoremap / :/


" avoid ESC
" :imap <Leader>f <Esc>
" :imap <Leader>w <Esc>:w<CR>

vnoremap <C-c> <Esc>
nnoremap <C-c> :w<CR>
inoremap <C-c> <Esc>:w<CR>

nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>
inoremap <Leader>w <Esc>:w<cr>
inoremap <Leader>s <Esc>:w<cr>

" align-current-paragraph-with-leader-a
noremap <leader>a =ip
" toggle-paste-mode
set pastetoggle=<leader>z

" cd to the directory containing the file in the buffer. Both the local
" and global flavors.
nmap <leader>cd :cd %:h<CR>
nmap <leader>lcd :lcd %:h<CR>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'xolox/vim-misc'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/webapi-vim'
Plugin 'groenewege/vim-less'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-commentary'
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'yegappan/mru'
Plugin 'skwp/greplace.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'fatih/vim-go'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/asyncomplete.vim'


""""""""""""""""""""""""""""""
" vim-powerline symbols
let g:airline_theme             = 'badwolf'
let g:airline#extensions#syntastic#enabled = 1

let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'

:nnoremap <CR> :nohlsearch<CR><CR>

"tagbar related settings
 set tags=./tags;,~/.vimtags
+" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" Disable the scrollbars
set guioptions-=r
set guioptions-=L



" General

set nu
set numberwidth=3
set mouse=a
syntax on
set autoread

syntax enable
set background=dark
colorscheme solarized
if has('gui_running')
    let g:scheme_bg = "light"
    set background=light
else
    let g:scheme_bg = "light"
    set background=light
endif

" change gitgutter color to work with solarized better
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow

" toggle theme
function! ToggleDark()
  if g:scheme_bg == "dark"
    set background=light
    let g:scheme_bg = "light"
  else
    set background=dark
    let g:scheme_bg = "dark"
  endif

  " change gitgutter color to work with solarized better
  highlight clear SignColumn
  highlight GitGutterAdd ctermfg=green
  highlight GitGutterChange ctermfg=yellow
  highlight GitGutterDelete ctermfg=red
  highlight GitGutterChangeDelete ctermfg=yellow
endfunction
map <F3> :call ToggleDark()<CR>

function! ShowTabNumber()
  if has('gui_running')
    set guitablabel=⌘%N@%M%t
  endif
endfunction
map <F2> :call ShowTabNumber()<CR>

set antialias
" Whitespace

set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
" set scrolloff=999               " Minimum lines to keep above and below cursor
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set splitbelow
set splitright
set visualbell

:nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>

" }

" Formatting {

set autoindent " Copy indent from last line when starting new line.
set colorcolumn=120 " mark col 80
set cursorline " Highlight current line
set cursorcolumn
set diffopt=filler " Add vertical spaces to keep right and left aligned
set diffopt+=iwhite " Ignore whitespace changes (focus on code changes)
set encoding=utf-8 nobomb " BOM often causes trouble
set esckeys " Allow cursor keys in insert mode.
set expandtab " Expand tabs to spaces
set hidden " When a buffer is brought to foreground, remember undo history and marks.
set history=100 " Increase history from 20 default to 1000
set laststatus=2 " Always show status line
set magic " Enable extended regexes.
set nocompatible " Make vim more useful
set noerrorbells " Disable error bells.
set nostartofline
set noshowmode
set report=0 " Show all changes.
set ruler " Show the cursor position
set title " Show the filename in the window titlebar.
set ttyfast " Send more characters at a given time.
set wildchar=<TAB> " Character for CLI expansion (TAB-completion).
set wildmenu " Hitting TAB in command mode will show possible completions above command line.
set wildmode=list:longest " Complete only until point of ambiguity.


set nowrap
set textwidth=79
set formatoptions=qrn1


" We do utf-8
scriptencoding utf-8
set encoding=utf-8

" Tagbar related settings
nmap <F8> :TagbarToggle<CR>


" Add the virtualenv's site-packages to vim path
if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif

" Load up virtualenv's vimrc if it exists
if filereadable($VIRTUAL_ENV . '/vimrc')
    source $VIRTUAL_ENV/vimrc
endif



if &term == 'xterm' || &term == 'screen'
  set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
endif

" CtrlP related settings
let g:ctrlp_working_path_mode = ''
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc,tmp,*.scssc,*.pyc,tags
let g:ctrlp_custom_ignore = 'node_modules\|bower_components'
set wildmenu


" Gist related settings

let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_clip_command = 'pbcopy'
let g:gist_post_private = 1
let g:gist_get_multiplefile = 1


" Configuration
let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "
let g:DoxygenToolkit_blockHeader="-------------------------------"
let g:DoxygenToolkit_blockFooter="---------------------------------"
let g:DoxygenToolkit_authorName="Vinit Kumar"


"Nerdtree
nmap <C-u> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', 'node_modules']

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Spell check always on
"set spell spelllang=en_us

" Ruby
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2

" Python Specific settings
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4
"
" Typescript Specific settings
autocmd FileType typescript set sw=2
autocmd FileType typescript set ts=2
autocmd FileType typescript set sts=2

" JavaScript
autocmd FileType javascript set sw=2
autocmd FileType javascript set ts=2
autocmd FileType javascript set sts=2
au BufNewFile,BufRead *.es6 set filetype=javascript
" syntax hightlighting for jsx
let g:javascript_enable_domhtmlcss = 1
let g:jsx_ext_required = 0
let g:javascript_plugin_flow = 1

" html
autocmd FileType html set sw=2
autocmd FileType html set ts=2
autocmd FileType html set sts=2

" No backup
set nobackup
set noswapfile

" Paste large amount of text in vim
set pastetoggle=<F2>


" Shortcut to edit the vimrc
nmap <silent> <leader>vimrc :e ~/.vimrc<CR>

" Shortcut to yanking to the system clipboard
set clipboard=unnamed
map <leader>y "*y
map <leader>p "*p
nnoremap Y y$

" MRU
map <leader>m :MRU<CR>

" Command to write as root if we dont' have permission
cmap w!! %!sudo tee > /dev/null %

" AutoCMDs

" Clear whitespace at the end of lines automatically
autocmd BufWritePre * :%s/\s\+$//e


" Vim-Go related Settings
let g:go_errcheck_bin="/Users/vinitkumar/go/bin/errcheck"
let g:go_golint_bin="/Users/vinitkumar/go/bin/golint"
let g:go_fmt_autosave = 1
let g:github_upstream_issues = 1
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim

autocmd filetype crontab setlocal nobackup nowritebackup

" copy current filename into system clipboard - mnemonic: (c)urrent(f)ilename
" this is helpful to paste someone the path you're looking at
nnoremap <silent> <leader>cf :let @* = expand("%:~")<CR>
nnoremap <silent> <leader>cn :let @* = expand("%:t")<CR>
" Ag
let g:ackprg = 'ag --nogroup --nocolor --column'





function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction
inoremap <tab> <c-r>=Smart_TabComplete()<CR>
"the above block used to use tab to autocomplete



" gitgutter
let g:gitgutter_highlight_lines = 0
let g:gitgutter_override_sign_column_highlight = 0

" Alt ruby
nnoremap <leader>at :AlternateToggle<cr>
nnoremap <leader>av :AlternateVerticalSplit<cr>
nnoremap <leader>as :AlternateHorizontalSplit<cr>

" greplace
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

" autocompleted {}
" inoremap { {}<ESC>ha
" inoremap ( ()<ESC>ha


if has("gui_macvim")

  " Switch to specific tab numbers with Command-number
  noremap <D-1> :tabn 1<CR>
  noremap <D-2> :tabn 2<CR>
  noremap <D-3> :tabn 3<CR>
  noremap <D-4> :tabn 4<CR>
  noremap <D-5> :tabn 5<CR>
  noremap <D-6> :tabn 6<CR>
  noremap <D-7> :tabn 7<CR>
  noremap <D-8> :tabn 8<CR>
  noremap <D-9> :tabn 9<CR>
  " Command-0 goes to the last tab
  noremap <D-0> :tablast<CR>
  set guifont=Monaco:h14     " OSX.
endif

" ale

"let g:ale_completion_enabled = 1
" Fix files with prettier, and then ESLint.
" " Equivalent to the above.
let b:ale_fixers = {'javascript': ['prettier', 'jslint']}
let b:ale_fixers = {'es6': ['prettier', 'eslint']}
let g:airline#extensions#ale#enabled = 1


" Golang 
au filetype go inoremap <buffer> . .<C-x><C-o>
let g:go_fmt_command = "goimports"    # Run goimports along gofmt on each save     
let g:go_auto_type_info = 1           # Automatically get signature/type info for object under cursor     

" Show vim tab number

fu! MyTabLabel(n)
let buflist = tabpagebuflist(a:n)
let winnr = tabpagewinnr(a:n)
let string = fnamemodify(bufname(buflist[winnr - 1]), ':t')
return empty(string) ? '[unnamed]' : string
endfu

fu! MyTabLine()
let s = ''
for i in range(tabpagenr('$'))
" select the highlighting
    if i + 1 == tabpagenr()
    let s .= '%#TabLineSel#'
    else
    let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    "let s .= '%' . (i + 1) . 'T'
    " display tabnumber (for use with <count>gt, etc)
    let s .= ' '. (i+1) . ' ' 

    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '

    if i+1 < tabpagenr('$')
        let s .= ' |'
    endif
endfor
return s
endfu
set tabline=%!MyTabLine()

nnoremap <C-j> gT
nnoremap <C-k> gt
" END Show vim tab number
