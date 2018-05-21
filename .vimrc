" Get the path to the folder that contains this file
let s:vimrc_path=fnamemodify(resolve(expand('<sfile>')), ':p:h:gs?\\?'.((has('win16') || has('win32') || has('win64'))?'\':'/') . '?')
let g:Config_Main_Home = '/tmp'

" Set the runtimepath to be the directory that contains this file and all of
" the system paths
exec 'set rtp=' . s:vimrc_path
set rtp+=$VIM/vimfiles
set rtp+=$VIMRUNTIME
set rtp+=$VIM/vimfiles/after

" Set dein.vim directory
let s:dein_path=s:vimrc_path.'/dein'
let s:plugin_config_path=s:vimrc_path.'/plugin_config'
let s:config_path=s:vimrc_path.'/config'
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
exec 'set runtimepath+='.s:dein_path.'/repos/github.com/Shougo/dein.vim'
" set runtimepath+=s:dein_path."/Users/yaxtan/project/dotvimfile/dein/repos/github.com/Shougo/dein.vim"

" Required:
if dein#load_state(s:dein_path)
  call dein#begin(s:dein_path)

  " Let dein manage dein
  " Required:
  call dein#add(s:dein_path.'/repos/github.com/Shougo/dein.vim', { 
              \ 'hook_add': 'source '.s:plugin_config_path.'/dein.vim/config.vim'
              \ })
  call dein#add('wsdjeg/dein-ui.vim', {
              \ 'on_cmd': ['SPUpdate', 'SPReinstall', 'SPInstall'],
              \ 'hook_add': 'source '.s:plugin_config_path.'/dein-ui.vim/config.vim'
              \ })
  " Color Scheme
  call dein#add('morhetz/gruvbox')
  " EasyAlign
  call dein#add('junegunn/vim-easy-align', {
              \ 'on_cmd': ['EasyAlign']
              \ })
  " Git wrapper
  call dein#add('tpope/vim-fugitive', {
              \ 'name': 'fugitive',
              \ 'on_cmd': ['Gstatus','Gcommit', 'Gmerge', 
              \ 'Gpull', 'Ggrep', 'Glog', 'Gedit', 'Gpedit',
              \ 'Gsplit', 'Gvsplit', 'Gtabedit', 'Gread', 
              \ 'Gwrite', 'Gwq', 'Gpush', 'Gfetch', 'Gdiff',
              \ 'Gmove', 'Gremove', 'Gblame',
              \ 'Gcd', 'Glcd', 'Git']
              \ })
  " Useful mapping
  call dein#add('tpope/vim-unimpaired')
  " Surroundings: parentheses, brackets, quotes, XML tags, and more on cs, ds, ys
  call dein#add('tpope/vim-surround')
  " Comment tool when press gc
  call dein#add('tpope/vim-commentary')
  " Repeat all tpope stuff by press .
  call dein#add('tpope/vim-repeat')
  " Git commit browser
  call dein#add('junegunn/gv.vim', {
              \ 'on_cmd': ['GV', 'Gbrowse'],
              \ 'depends': ['fugitive']
              \ })
  " Fast jump when press <leader><leader>
  call dein#add('easymotion/vim-easymotion')
  " Multiple cursors support when press <C-n>
  call dein#add('terryma/vim-multiple-cursors')
  " More powerful search
  call dein#add('haya14busa/incsearch.vim')
  call dein#add('haya14busa/incsearch-fuzzy.vim')
  call dein#add('haya14busa/incsearch-easymotion.vim', {
              \ 'hook_add': 'source '.s:plugin_config_path.'/incsearch-easymotion.vim/config.vim'
              \ })
  " Colorful Parentheses
  call dein#disable('luochen1990/rainbow')
  " Insert or delete brackets, parens, quotes in pair
  call dein#add('jiangmiao/auto-pairs')
  " Show a diff(git,svn...) using Vim its sign column
  call dein#add('mhinz/vim-signify', {
              \ 'hook_add': 'source '.s:plugin_config_path.'/vim-signify/config.vim'
              \ })
  " Text Obj
  call dein#add('kana/vim-textobj-user')
  call dein#add('kana/vim-textobj-indent')
  call dein#add('kana/vim-textobj-syntax')
  call dein#add('kana/vim-textobj-function', {
              \ 'on_ft': ['c', 'cpp', 'vim', 'java']
              \ })
  call dein#add('sgur/vim-textobj-parameter')
  " Displaying thin vertical lines at each indentation level
  call dein#add('Yggdroot/indentLine')
  " Toggle, display and navigate marks using mx m/
  call dein#add('kshenoy/vim-signature')
  " Fancy start screen
  call dein#add('mhinz/vim-startify')
  " Files explorer(not recommend)
  call dein#add('scrooloose/nerdtree', {
              \ 'on_cmd': 'NERDTreeToggle',
              \ 'hook_add': 'source '.s:plugin_config_path.'/nerdtree/config.vim'
              \ })
  call dein#add('Xuyuanp/nerdtree-git-plugin', { 
              \ 'on_cmd': 'NERDTreeToggle'
              \ })

  " Run Command async
  call dein#add('skywind3000/asyncrun.vim', {
              \ 'on_cmd': 'AsyncRun',
              \ 'hook_add': 'source '.s:plugin_config_path.'/asyncrun.vim/config.vim'
              \ })

  " Displays function signatures in command line
  call dein#add('Shougo/echodoc.vim', {
              \ 'hook_add': 'source '.s:plugin_config_path.'/echodoc.vim/config.vim'
              \ })
  " Better code formater
  call dein#add('Chiel92/vim-autoformat', {
              \ 'build': 'bash '.s:plugin_config_path.'/vim-autoformat/install_formaters.sh'
              \ })
  " Asynchronous Lint Engine
  call dein#add('w0rp/ale', {
              \ 'hook_add': 'source '.s:plugin_config_path.'/ale/config.vim'
              \ })

  " Better JSON support
  call dein#add('elzr/vim-json', {
              \ 'on_ft': 'json'
              \ })
  " Better CPP highlight
  call dein#add('octol/vim-cpp-enhanced-highlight', {
              \ 'on_ft': 'cpp'
              \ })

  " Better status line
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('vim-airline/vim-airline', {
              \ 'hook_add': 'source '.s:plugin_config_path.'/vim-airline/config.vim'
              \ })

  " auto complete
  call dein#add('Shougo/deoplete.nvim', {
              \ 'do': ':UpdateRemotePlugins',
              \ 'hook_add': 'source '.s:plugin_config_path.'/deoplete.nvim/config.vim'
              \ })
  if !has('nvim')
      call dein#add('roxma/nvim-yarp')
      call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  " Language server client
  call dein#add('autozimu/LanguageClient-neovim', {
              \ 'rev': 'next',
              \ 'build': 'bash install.sh',
              \ 'on_ft': ['c', 'cpp', 'rust', 'javascript'],
              \ 'hook_add': 'source '.s:plugin_config_path.'/LanguageClient-neovim/config.vim',
              \ })
  " Asynchronous unite all interfaces
  call dein#add('Shougo/denite.nvim', {
              \ 'hook_add': 'source '.s:plugin_config_path.'/denite.nvim/config.vim'
              \ })
  call dein#add('Shougo/neosnippet.vim', {
              \ 'hook_add': 'source '.s:plugin_config_path.'/neosnippet.vim/config.vim'
              \ })
  call dein#add('Shougo/neosnippet-snippets')

  " You can specify revision/branch/tag.
  " call dein#add('Shougo/deol.nvim', { 'rev': 'a1b5108fd' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Source general config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
exec 'source '.s:config_path.'/general.vim'
