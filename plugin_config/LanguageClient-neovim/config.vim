let s:cwd_path=fnamemodify(resolve(expand('<sfile>')), ':p:h:gs?\\?'.((has('win16') || has('win32') || has('win64'))?'\':'/') . '?')

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
            \ 'cpp': ['cquery', '--log-file=/tmp/cq.log'],
            \ 'c': ['cquery', '--log-file=/tmp/cq.log'],
            \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
            \ 'javascript': ['javascript-typescript-stdio'],
            \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
            \ }

let g:LanguageClient_loadSettings = 1
" Use an absolute configuration path if you want system-wide settings
let g:LanguageClient_settingsPath = s:cwd_path.'/settings.json'

" Setup the deoplete
call deoplete#custom#source('LanguageClient',
            \ 'min_pattern_length',
            \ 2)
