"dein Scripts-----------------------------
if &compatible
    set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/nshiba/Project/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/nshiba/Project/dein')
    call dein#begin('/Users/nshiba/Project/dein')

    " Let dein manage dein
    " Required:
    call dein#add('/Users/nshiba/Project/dein/repos/github.com/Shougo/dein.vim')
    
    " Add or remove your plugins here:
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('mattn/emmet-vim')
    
    " You can specify revision/branch/tag.
    " call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
    
    " Required:
    call dein#end()
    call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
    call dein#install()
endif

"End dein Scripts-------------------------

" endfunction
" バックアップファイルを作成しない
set nobackup
"キーマッピング
"s無効化
nnoremap s <Nop>
nnoremap ; :
"水平分割
nnoremap ss :split<Enter>
"垂直分割
nnoremap sv :vsplit<Enter>
"ウィンドウ移動
nnoremap sh <C-w>h<> 
nnoremap sj <C-w>j
nnoremap sl <C-w>l
nnoremap sk <C-w>k
nnoremap sw <C-w>w
"新規タブ
nnoremap st :tabnew<Enter>
"タブ移動
nnoremap sL gt
nnoremap sH gT
"幅を減らす
nnoremap s, <C-w><
"幅を増やす
nnoremap s. <C-w>>
"高さを減らす
nnoremap s- <C-w>-
"高さを増やす
nnoremap s= <C-w>+
"NERDtree
nnoremap nerd :NERDTree<Enter>
"Ctrl-j or kで10行移動
nnoremap <C-j> 10j
nnoremap <C-k> 10k
"------------------------------------------------------------

"一般設定
set number
set clipboard=unnamed,autoselect
set noundofile

set list

syntax on

"バックスペース復活
set backspace=indent,eol,start

"対応するカッコやブレースを表示
set showmatch

" %による対応括弧へカーソル移動
source $VIMRUNTIME/macros/matchit.vim
" 対応するペアの組み合わせ
let b:match_words = "(<if>:<end if>)"

" autocmd無効化
" https://gist.github.com/rbtnn/8540338 （一部修正）
augroup auto_comment_off
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=r
    autocmd BufEnter * setlocal formatoptions-=o
augroup END

" 改行
nnoremap <D-Enter> <S-i><Enter><Esc>

""タブ
set expandtab
set tabstop=4
set shiftwidth=4
set shiftround

" 見た目関連の設定
set laststatus=2  " ステータスラインを表示する時
set cursorline   " 現在行に下線を引く-

"インデント設定
set autoindent

" エンコーディング関連
set encoding=utf-8     " vim内部で通常使用する文字エンコーディングを設定
" set charconvert=utf-8    " 文字エンコーディングに使われるexpressionを定める
set fileencoding=utf-8    " バッファのファイルエンコーディングを指定
set fileencodings=utf-8,euc-jp,sjis " 既存ファイルを開く際の文字コード自動判別

""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
"""""NeoBundlePlugins設定"""""
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
"------------------------------------------------------------------------------------------------------------------------
" lightline

let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ 'mode_map': {'c': 'NORMAL'},
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
            \ },
            \ 'component_function': {
            \   'modified': 'MyModified',
            \   'readonly': 'MyReadonly',
            \   'fugitive': 'MyFugitive',
            \   'filename': 'MyFilename',
            \   'fileformat': 'MyFileformat',
            \   'filetype': 'MyFiletype',
            \   'fileencoding': 'MyFileencoding',
            \   'mode': 'MyMode'
            \ }
            \ }

function! MyModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
    return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! MyFilename()
    return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
                \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
                \  &ft == 'unite' ? unite#get_status_string() :
                \  &ft == 'vimshell' ? vimshell#get_status_string() :
                \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
                \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
    try
        if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
            return fugitive#head()
        endif
    catch
    endtry
    return ''
endfunction

function! MyFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
    return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
    return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

