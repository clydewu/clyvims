"basic setup {
    set ai
    set ruler
    set bs=2
    set softtabstop=4
    set shiftwidth=4
    set expandtab
    set cursorline
    set nocompatible
    set background=dark
    set modeline
    set showcmd
    set number
    nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
    " auto reload vimrc when editing it
    autocmd! bufwritepost .vimrc source ~/.vimrc
    syntax on " syntax highlight
    set hlsearch " search highlighting
    filetype on
    autocmd BufNewFile,BufRead *.cflow setf cflow
    " cursorline highlight
    highlight Cursorline ctermfg=none ctermbg=darkblue cterm=none
"basic setup }


" status line {
    set laststatus=2
    set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \
    "set statusline+=\ \ \ [%{&ff}/%Y]
    set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\
    set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L
    function! HasPaste()
        if &paste
            return '[PASTE]'
        else
            return ''
        endif
    endfunction
    "set statusline=%<%f\ %m%=\ %h%r\ %-19([%p%%]\ %3l,%02c%03V%)%y	"statusline format
" status line }

	
" pathgen {
    let g:pathogen_disabled=['pydiction-1.2', 'python-fold']
    call pathogen#infect()
    syntax on
    filetype plugin indent on
" pathgen }


" for c/cpp {
    autocmd FileType c,cpp setlocal cindent fdm=syntax
" for c/cpp }


" for python {
    filetype plugin indent on
    autocmd FileType python setlocal et sta sw=4 sts=4
    "fold
    autocmd FileType python setlocal foldmethod=indent
    set foldlevel=99

    function! CurDir()
        let curdir = substitute(getcwd(), $HOME, "~", "")
        return curdir
    endfunction
" for python }


" Omni Complete {
    " set auto close ref-window when leave insert-mode
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif
    autocmd FileType python set omnifunc=pythoncomplete#Complete
" Omni Complete }


" pydiction {
    " indicte path of diction-file
    let g:pydiction_location = '~/.vim/bundle/pydiction-1.2/ftplugin/pydiction/complete-dict' 
" pydiction }


" autocomplpop {
    set completeopt+=longest
    let g:acp_completeoptPreview = 1
    inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
    inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
    inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
    inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
    inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
" autocomplpop }


" vim-flake8 {
    " let g:flake8_cmd="/usr/bin/flake8"
    let g:pyflakes_use_quickfix = 0
    let g:flake8_ignore="E501"
" vim-flake8 }


" syntastic {
    " for pylint
    let g:syntastic_python_checker = 'pylint'
    let g:syntastic_python_checker_args="--disable=C0112,C0111,C0301"
    let g:syntastic_python_checker_args = g:syntastic_python_checker_args." --max-line-length=80"

    " for flake8
    "let g:syntastic_python_checker = 'flake8'
    "let g:syntastic_python_checker_args="--ignore=E501"
" syntastic }


" tagbar {
    nmap <F8> :TagbarToggle<CR>
" tagbar }
