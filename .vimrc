" Get the path to the folder that contains this file
let s:vimrc_path=fnamemodify(resolve(expand('<sfile>:p')), ':h')

" Set the runtimepath to be the directory that contains this file and all of
" the system paths
exec 'set rtp=' . s:vimrc_path
set rtp+=$VIM/vimfiles
set rtp+=$VIMRUNTIME
set rtp+=$VIM/vimfiles/after

" global setting
syntax enable
" show relative line number
set number relativenumber
set smartindent
" allow wrap the long line
set wrap
" set width when indent line
set shiftwidth=4
" allow vim to indent line in round(column number/shiftwidth)
set shiftround
" highlight the matching bracket when insert one 
set showmatch
"  and disable the 500ms cursor auto jump, but allow highlight
set matchtime=0
set tabstop=4
" use space to replace the <TAB>, to input a <TAB>, use CTRL-V<Tab>
set expandtab
" highlight the search result
set hlsearch
" highlight the search result when typing
set incsearch

" set leader
let mapleader=","


set history=300

" key map
" edit vimrc in vertical
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" reload the vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
