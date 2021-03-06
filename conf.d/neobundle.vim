""""""""""""""""""""""""""
"Neobundle
""""""""""""""""""""""""""
filetype plugin indent off
if has('vim_starting')
	if has('win32') || has('win64')
		set runtimepath+=$VIM/plugins/bundle/neobundle.vim/
		call neobundle#begin(expand('$VIM/plugins/bundle/neobundle.vim/'))
	else
		set runtimepath+=~/.vim/bundle/neobundle.vim/
		call neobundle#begin(expand('~/.vim/bundle/'))
	endif
endif
 
"NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
"add repo
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'vim-latex/vim-latex'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'
NeoBundle 'fuenor/qfixhowm'
NeoBundle 'fuenor/qfixgrep'
NeoBundle 'kana/vim-submode'
"Mac / Linux
if !has('win32') && !has('win64')
	NeoBundle 'vim-scripts/sudo.vim'
endif
"test plugins
NeoBundle 'Shougo/unite-ssh'
NeoBundle 'thinca/vim-quickrun'
call neobundle#end()
filetype plugin indent on

""""""""""""""""""""""""""
"vimfiler
""""""""""""""""""""""""""
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_edit_action = 'tabopen'
"start filer
nnoremap <silent><Space>j    :VimFilerBufferDir<CR>

""""""""""""""""""""""""""
"unite, neomru
""""""""""""""""""""""""""
"file history limit
let g:unite_source_file_mru_limit = 300
"file_mru timestamp
let g:neomru#time_format = "(%Y/%m%d %H:%M:%S)"
"most recently used files
nnoremap <silent><Space>m    :Unite file_mru<CR>
"buffer list
nnoremap <silent><Space>l    :Unite buffer<CR>
"reister list
nnoremap <silent><Space>r    :Unite register<CR>
"source list
nnoremap <silent><Space>s    :Unite source<CR>

"file extension setting
if has('gui_running') 
	if has('win32') || has('win64')
		call vimfiler#set_execute_file('vim', 'gvim')
		call vimfiler#set_execute_file('txt', 'gvim')
		call vimfiler#set_execute_file('tex', 'gvim')
	else
		call vimfiler#set_execute_file('vim', 'MacVim')
		call vimfiler#set_execute_file('txt', 'MacVim')
		call vimfiler#set_execute_file('tex', 'MacVim')
	endif
else
	call vimfiler#set_execute_file('vim', 'vim')
	call vimfiler#set_execute_file('txt', 'vim')
	call vimfiler#set_execute_file('tex', 'vim')
endif

""""""""""""""""""""""""""
"VimShell
""""""""""""""""""""""""""
nnoremap <silent><Space>v    :VimShell<CR>
let g:vimshell_prompt_expr = 'getcwd()." > "'
let g:vimshell_prompt_pattern = '^\f\+ > '

""""""""""""""""""""""""""
"neocomplcache
""""""""""""""""""""""""""
"Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
 let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
	\ 'default' : ''
	\ }
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

"""""""""""""""""""""""""
"vim-latex
"""""""""""""""""""""""""
"Windows
" $VIM/dot_files/conf.d/vim-latex.vim
" Mac / Linux
" ~/dot_files/conf.d/vim-latex.vim

"""""""""""""""""""""""""
"vim-fugitve
"""""""""""""""""""""""""

"""""""""""""""""""""""""
"gitv
"""""""""""""""""""""""""

"""""""""""""""""""""""""
"qfixhowm,qfixgrep
"""""""""""""""""""""""""
let g:howm_dir='~/Dropbox/App/vim/howm'
let g:QFixMRU_Filename='~/Dropbox/App/vim/howm/.qfixmru'
let g:QFixHowm_ListReminder_ScheExt='[-@+!~]'
let QFixHowm_ShowSchedule=30
let QFixHowm_ShowScheduleMenu=30

"""""""""""""""""""""""""""""""""
" Windows
"""""""""""""""""""""""""""""""""
" $VIM/dot_files/.vimrc
" $VIM/dot_files/conf.d/neobundle.vim
" $VIM/dot_files/conf.d/split.vim
" $VIM/dot_files/conf.d/tab.vim
" $VIM/dot_files/conf.d/vim-latex.vim
"
"""""""""""""""""""""""""""""""""
" Mac / Linux 
"""""""""""""""""""""""""""""""""
" ~/dot_files/.vimrc
" ~/dot_files/conf.d/neobundle.vim
" ~/dot_files/conf.d/split.vim
" ~/dot_files/conf.d/tab.vim
" ~/dot_files/conf.d/vim-latex.vim
