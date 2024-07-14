"necessary on some Linux distros for pathogen to properly load bundles
filetype on

"turn on syntax highlighting
syntax on

" Set encoding to UTF-8
set encoding=utf-8

set background=dark
colorscheme neverland2

" temprorary files
set backup
set backupdir=~/.tmpvim,/tmp
set directory=~/.tmpvim,/tmp
set dir=~/.tmpvim,/tmp
set undodir=~/.tmpvim,/tmp

set undofile                " Save undos after file closes
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

"pathogen for includeing bundles
execute pathogen#infect()

"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

"store lots of :cmdline history
set history=200

set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default
set ignorecase
set smartcase

" Improve the scrolling performance
set lazyredraw
set regexpengine=1

" Enable mouse wheel scrolling
set mouse=a

" Set to auto read when a file is changed from the outside
set autoread

"Remove search highlight pressing space
nnoremap <silent> <Space> :nohl<Bar>:echo<CR>

set number      "add line numbers
set showbreak=...
set wrap linebreak nolist

"mapping for command key to map navigation thru display lines instead
"of just numbered lines
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^

"add some line space for easy reading
set linespace=4

"disable visual bell
set visualbell t_vb=

"try to make possible to navigate within lines of wrapped lines
nmap <Down> gj
nmap <Up> gk

"recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

"indent settings
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set tabstop=4
set smarttab
set fileformat=unix
set textwidth=120

"folding settings
set foldmethod=syntax
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default


set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~,.* "stuff to ignore when tab completing
set wildignore+=*/vendor/*,*/node_modules/*

set formatoptions-=o "dont continue comments when pushing o/O

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

"load ftplugins and indent files
filetype plugin on
filetype indent on
filetype plugin indent on

"hide buffers when not displayed
set hidden

silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>
nnoremap <silent> <C-f> :call FindInNERDTree()<CR>
nnoremap <silent> <C-d> :call PhpDocSingle()<CR>
nnoremap <silent> <C-b> :BufExplorerHorizontalSplit<CR>

autocmd FileType php noremap <buffer>  <F8> :call PhpCsFixerFixFile()<cr>
autocmd FileType python noremap <buffer>  <F8> :call Autopep8()<cr>

"make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

"map Q to something useful
noremap Q gq

"make Y consistent with C and D
nnoremap Y y$

let g:ragtag_global_maps = 1

"mark syntax errors with :signs
let g:syntastic_enable_signs=1

"key mapping for vimgrep result navigation
map <A-o> :copen<CR>
map <A-q> :cclose<CR>
map <A-j> :cnext<CR>
map <A-k> :cprevious<CR>

"autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

"key mapping for window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"key mapping for saving file
nmap <C-s> :w<CR>
imap <C-s> :w<CR>
imap <C-j> <ESC><ESC>
nmap <C-j> <PageDown>
vmap <C-j> <PageDown>
nmap <C-k> <PageUp>
vmap <C-k> <PageUp>

imap <c-k> <Plug>snipMateTrigger

" autocomplete
set complete=""
" current buffer
set complete+=.
" dictionary
set complete+=k
" other open buffers
set complete+=b
" from tags
set complete+=t
" other loaded windows
set complete+=w
" included files
set complete+=i

" Setting dictionaries for complete
autocmd FileType python set dictionary=$HOME/.vim/dict/python
autocmd FileType php set dictionary=$HOME/.vim/dict/php

" mappings for NERDCommenter
map ,ca           <Plug>NERDCommenterAltDelims
map ,cu           <Plug>NERDCommenterUncomment
map ,cb           <Plug>NERDCommenterAlignBoth
map ,cl           <Plug>NERDCommenterAlignLeft
map ,cy           <Plug>NERDCommenterYank
map ,cs           <Plug>NERDCommenterSexy
map ,ci           <Plug>NERDCommenterInvert
map ,c$           <Plug>NERDCommenterToEOL
map ,cn           <Plug>NERDCommenterNested
map ,cm           <Plug>NERDCommenterMinimal
map ,c<Space>     <Plug>NERDCommenterToggle
map ,cc           <Plug>NERDCommenterComment

" hide files in NERDTree
nnoremap <silent> <C-f> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '\.class$']

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКІЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкіегмцчня;abcdefghijklmnopqrstuvwxyz

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Auto close pairs
"inoremap " ""<left>
"inoremap ' ''<left>
"inoremap ` `` <left>
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>
"inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O

" PHP settings
" checking php synax
set makeprg=php\ -l\ %

" Error format
set errorformat=%m\ in\ %f\ on\ line\ %l

let g:pdv_cfg_Uses = 1
let php_folding = 1
let php_noShortTags = 0
let php_sql_query=1
let php_htmlInStrings=1
let php_baselib = 1"

" If you use php-cs-fixer version 1.x
let g:php_cs_fixer_level = "symfony"                   " options: --level (default:symfony)
let g:php_cs_fixer_config = "default"                  " options: --config
" If you want to define specific fixers:
"let g:php_cs_fixer_fixers_list = "linefeed,short_tag" " options: --fixers

" If you use php-cs-fixer version 2.x
let g:php_cs_fixer_rules = "@PSR2"          " options: --rules (default:@PSR2)
"let g:php_cs_fixer_cache = ".php_cs.cache" " options: --cache-file
"let g:php_cs_fixer_config_file = '.php_cs' " options: --config
let g:php_cs_fixer_allow_risky = "yes"      " options: --allow-risky
" End of php-cs-fixer version 2 config params

let g:php_cs_fixer_php_path = "php"               " Path to PHP
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 0                    " Return the output of command if 1, else an inline information.
" let g:php_cs_fixer_ignore_env = 1               " Ignoring any environment requirements


"jump to last cursor position when opening a file
"dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
endfunction

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

set omnifunc=syntaxcomplete#Complete
:set completeopt+=popup

" Blade syntax highlighting as HTML
augroup filetypedetect
  au! BufRead,BufNewFile *.blade.php     setfiletype html
augroup END


" Autocopmlete html tags
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.blade.php'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'
