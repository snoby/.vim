call pathogen#infect()
syntax on
filetype plugin indent on
set nocompatible
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set number
set incsearch
set noswapfile
set nowritebackup
set nobackup
set showcmd
set ruler     "Show the cursor position all the time
set autowrite "Automaticall :write before running commands
set showcmd " Show incomplete commands
set nolazyredraw " Don't redraw while executing macros
set cindent  " correctly indent c files
set ignorecase   " don't care about the case when searching
set smartcase    " will only make the search case sensitive when search term is
set hlsearch     " highlight the search functionality
set autowrite     " Automatically write a file when moving off a modified buffer.

"
" Switch Buffers with the tab key
"They allow you to switch buffers: Tab for the next one, Shift-Tab for the previous one. To quickly close a buffer, I use Ctrl-X.
"This makes the clipboard selection alutomatically shared to the system
"
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <C-X> :bdelete<CR>


set clipboard=unnamed
"Make visual selections automatically go to the clipboard
set go+=a
call pathogen#helptags()
"Window behavior
set scrolloff=3  "before scrolling off the screen u will have 3 lines helps with context

"For Makefiles
autocmd FileType make setlocal noexpandtab

"
" syntax knowledge
"
let g:load_doxygen_syntax=1

" Key remappings
"
nmap <F8> :TagbarToggle<CR>

" Let ctrl tab switch betwen tabs just like in a web browser
noremap <c-tab> :tabnext<cr>
" shift ctrl tab goes the other way
noremap<c-s-tab> :tabprev<cr>
" FINALLY for the mac, don't know about Linux
" Go to the last tab
noremap<D-0> :tablast<CR>

"
"cycle through the buffers:
"Don't have to do this any more
"the plugin uninmeded let's [b ]b be the toggle through buffers.
"nmap <C-n> :bnext<CR>
"nmap <C-p> :bprev<CR>
" Let me know when I'm getting near the end of the line
set colorcolumn=120
set formatoptions=qrn1


" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


"
" Auto save on focus loss
"
:au FocusLost * silent! wa


" Tab configuration
map <leader>tn :tabnew<cr>

"
"
"" Buffer Navigation
" Toggle left sidebar: NERDTree and BufferGator
" fu! UiToggle()
"   let b = bufnr("%")
"   execute "NERDTreeToggle | BuffergatorToggle"
"   execute ( bufwinnr(b) . "wincmd w" )
"   execute ":set number!"
" endf
" map  <silent> <Leader>w  <esc>:call UiToggle()<cr>
"


"
"BufferGator configuraiton
let g:buffergator_autodismiss_on_select=0
let g:buffergator_autoupdate=1
let g:buffergator_sort_regime="mru"
let g:buffergator_display_regime="bufname"
let g:buffergator_mru_cycle_local_to_window=1




if has ( 'gui_running')
   if has ("unix")
   let s:uname = system("uname")
   	if s:uname == "Darwin\n"
      	" This is a mac
      	set guifont=Menlo:h12
      	"set guifont="DejaVu Sans Mono":h12
         " Turn off antialias
         "Turn on the Toolbar
         "set go+=T
   	else
      "This is a Linux based computer.
         set guifont=Monospace\ 9
   	endif
	endif
endif

"Color schemes
set background=dark
colorscheme murphy
"let g:solarized_termcolors =256
"colorscheme solarized
"
" AirLine configuration
""  "
""  " enable modified detection >
""    let g:airline_detect_modified=1


"
"  NeoComplete
"
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#enable_refresh_always=1

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


"
" For vim-buffergator
"

"
" For HAproxy
"
au BufRead,BufNewFile haproxy* set ft=haproxy

"
" For syntastic
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 10
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['foo', 'bar'],
                           \ 'passive_filetypes': ['java'] }

"
" BetterWhitespace
"
au VimEnter * ToggleStripWhitespaceOnSave



"
" for golang
"
" use goimports for formatting
let g:go_fmt_command = "goimports"

" turn highlighting on
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']
"
" chef erb files syntax highlighting
"
autocmd BufRead,BufNewFile *.erb set filetype=eruby

"
" For HAPROXY you have to add this to the first line of the cfg file
"  # vim: set ft=haproxy :
"
" changes for indentLine plugin
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_char = '|'

""" For ansible plugin

let g:ansible_options = {'ignore_blank_lines': 0}

""" Options for delmitMate

""" Options for Markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
let g:markdown_syntax_conceal = 0

augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END


" For vim go and syntastic at the same time
let g:syntastic_go_checkers = ['golint','govet','errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes' : ['go'] }
let g:go_list_type = "quickfix"


" For Go editing
" Control n for going to the next error in the quickfix window.
" Control M for going to the previous error in the quickfix window
" leader \ a to close the quickfix window
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" Sets all lists to be quickfix instead of a a location list and a quickfix
" window.
" let g:go_list_type = "quickfix"
" let g:go_highlight_types = 1
" let g:go_highlight_methods = 1

"
" Turn off Vim's default regex handling
nnoremap / /\v
vnoremap / /\v


"
" to get out of pressing ESC to get out of editing mode use jj instead
"
inoremap jj <ESC>
