:syntax on
set autoindent
set number
set nobackup
set list
set listchars=tab:>-,nbsp:%,trail:_
set rtp+=~/.vim/bundle/vundle/
set laststatus=2
"ステータス表示 文字コードとか改行コードとか
set statusline=%<%f\ %m%r%h%w
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}
set statusline+=[%{Getff()}]
set statusline+=%=%l/%L,%c%V%8P
function! Getff()
	if &ff == 'unix'
		return 'LF'
	elseif &ff == 'dos'
		return 'CR+LF'
	elseif &ff == 'mac'
		return 'CR'
	else
		return '?'
	endif
endfunction

"クリップボードへのコピー
set clipboard+=unnamed,autoselect
filetype off
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'JavaScript-syntax'
Bundle 'Javascript-Indentation'
Bundle 'svnvimdiff'
Bundle 'jsbeautify'
Bundle 'neocomplcache'
Bundle 'Syntastic'
Bundle 'digitaltoad/vim-jade'
Bundle 'The-NERD-tree'
Bundle 'pyflakes'
Bundle 'Markdown-syntax'
Bundle 'quickrun.vim'
Bundle 'open-browser.vim'
let g:neocomplcache_enable_at_startup = 1
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)
let g:neocomplcache_snippets_disable_runtime_snippets =1 
let g:neocomplcache_snippets_dir = '~/.vim/snippets'
let g:neocomplcache_max_list = 20
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_plugin_disable = {
  \ 'syntax_complete' : 1,
      \ }
highlight SpecialKey cterm=bold ctermfg=darkgray guibg=white
" 全角スペースを視覚化する
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white
match ZenkakuSpace /　/

"highlight HankakuSpace cterm=underline ctermfg=darkblue guibg=white
"match HankakuSpace /\s/

filetype plugin indent on
"for syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_javascript_checker='jshint'
let g:syntastic_mode_map = { 'mode': 'active',
  \ 'active_filetypes': ['javascript','js']}
au FileType javascript set ts=4 sw=4 sts=4 expandtab
au FileType python set ts=4 sw=4 sts=4 expandtab
au BufNewFile *.js set ft=javascript fenc=utf-8
au BufNewFile *.py set ft=python fenc=utf-8
"autocmd FileType jade set noet | set iskeyword+=-,_,#
au FileType jade set ts=4 sw=4 sts=4 expandtab
au BufRead,BufNewFile *.md set filetype=markdown fenc=utf-8


let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
            \ 'outputter' : 'browser',
            \   'command': 'kramdown'
            \ }

