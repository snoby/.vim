execute pathogen#infect()
syntax on
filetype plugin indent on
set expandtab
set tabstop=3
set shiftwidth=3
set autoindent
set smartindent
set number
set incsearch
set nolazyredraw " Don't redraw while executing macros
set cindent  " correctly indent c files
set ignorecase   " don't care about the case when searching
set smartcase    " will only make the search case sensitive when search term is 
set hlsearch     " highlight the search functionality
set autowrite     " Automatically write a file when moving off a modified buffer.
"This makes the clipboard selection alutomatically shared to the system
set clipboard=unnamed
"Make visual selections automatically go to the clipboard
set go+=a
call pathogen#helptags()
"Window behavior
set scrolloff=3  "before scrolling off the screen u will have 3 lines helps with context



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

" Tab configuration
map <leader>tn :tabnew<cr>

"
"BufferGator configuraiton
let g:buffergator_autodismiss_on_select=0


if has ( 'gui_running')
   if has ("unix")
   let s:uname = system("uname")
   	if s:uname == "Darwin\n"
      	" This is a mac
      	"set guifont=Monaco:h11
      	set guifont="DejaVu Sans Mono":h12
         " Turn off antialias
         "set noanti  
         "Turn on the Toolbar
         set go+=T
   	else
      "This is a Linux based computer.
         set guifont=Monospace\ 9
   	endif
	endif
endif

"Color schemes
colorscheme torte
"
" AirLine configuration
"
" enable modified detection >
  let g:airline_detect_modified=1
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"


" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
