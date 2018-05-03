colors solarized		" color scheme
set background  =dark   " dark background for solarized

let mapleader   = ","   "Set Leader Key

syntax enable 			"enable syntax highlight
set relativenumber	    "show relative line numbers
set number              "show absolute number beside relative number
filetype indent on		"load config based on file extension
set lazyredraw			"Redraw screen only when needed

if !has('gui_running')
        "Set cursor for terminal
        if exists('$TMUX')
                let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
                let &t_EI = "\<Esc>Ptmux;\<Esc>\e[1 q\<Esc>\\"
       else
                let &t_ti.="\e[1 q"
                let &t_EI.="\e[1 q"
                let &t_SI.="\e[5 q"
                let &t_te.="\e[0 q"
        endif

        set t_Co=16
        let g:solarized_termcolors=16

        "Disable Vertical Split Bar
        hi VertSplit ctermfg=bg ctermbg=bg term=none

        "Set focus split status bar to cyan
        hi StatusLine ctermfg=6
        hi StatusLineNC ctermfg=3

        hi ColorColumn ctermbg=6
endif

set showmatch			"Show matching group for (){}[]
set mat         =2      "Time to show matching group

set expandtab			"Convert Tabs to space
set tabstop	    =4      "Tab to space visually
set softtabstop	=4		"Tab to space during edit

set autoindent			"Copy Indent from prev line

set ignorecase          "Ignore case when searching
set hlsearch            "Highlight items being searched
set incsearch           "Incremental Searching

set backspace   =2      "Make backspace work over special metadata

set noswapfile          "Remove swap file functions
set nobackup            "Disable backup
set nowritebackup       "Disable write backup

set laststatus  =2      "Show status bar

set statusline  =       "Clear status Bar
set statusline  +=[%-02n    "Show buffer number with min 2 numbers and 0 padded
set statusline  +=%f        "Show buffer file name
set statusline  +=%m]       "Show Modified Flag
set statusline  +=%=        "Right Align items
set statusline  +=[%6(%c,%l/%L%)]   "Show Current Line and Total Lines

set foldmethod  =indent     "Set Coding folding to follow indentation
set foldlevelstart  =99     "Disable folding on open
set foldnestmax =1          "Disbale nested folding

set colorcolumn =74         "Set Indicator to show 74 character limit

set autochdir               "Set to auto change directory

"Settings for netrw file explorer
let g:netrw_liststyle       = 3         "Change to tree list
let g:netrw_sort_sequence   = '[\/]$,*' "Sort by directories and file
let g:netrw_browse_spilt    = 4         "Open in previous window
let g:netrw_banner          = 0         "Disable Banner
let g:netrw_winsize         = 20        "Set Split to 20%
let g:netrw_special_syntax  = 1         "Allow highlighting for different files

au BufWinLeave  *.*   mkview
au BufWinEnter  *.*   silent loadview

"Mapping to replace escape
inoremap jk <Esc>

"Mapping for split movement
nnoremap <leader>h <C-W><C-H>
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>

"Mapping to create comment
nnoremap <leader>c :call CreateCommentBlock()<CR>

"Mapping to replace : with ;
nnoremap ;  :

"Mapping to clear highlighted values
map <silent> <leader>/ :nohlsearch<CR>

"Mapping for replaying q macros
nnoremap <leader>q @q

" optional reset cursor on start:
augroup myCmds
        au!
        autocmd VimEnter * call OpenNetrw()
augroup END

"Open netrw in vertial Left window, set line number
"Focus back onto buffer
function OpenNetrw()
        :Lexplore

        setlocal relativenumber
        setlocal number

        exe "2 wincmd w"
endfunction

"Add Comment Blocks
function CreateCommentBlock()
        let g:intCommentLen = 37

        let strText         = input("Comment : ")

        let strCommentStart = "##" . repeat(" ", g:intCommentLen - 4) ."##"
        let strCommentEnd   = repeat("#", g:intCommentLen)

        let intLine         = line(".")

        call append(intLine - 1, [strCommentStart, strCommentEnd])
endfunction
