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
au BufNewFile,BufRead *.cflow setf cflow
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

"for python {
filetype plugin indent on
autocmd FileType python setlocal et sta sw=4 sts=4
autocmd FileType python setlocal foldmethod=indent
set foldlevel=99

function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfunction
"for python }


" Omni Complete {
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" Omni Complete }


" pathgen {
call pathogen#infect()
syntax on
filetype plugin indent on
" pathgen }



" autocomplpop {
let g:acp_completeoptPreview = 1
" autocomplpop }
