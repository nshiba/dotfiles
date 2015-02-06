set nocompatible
" NeoBundle設定
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#begin(expand('~/.vim/bundle'))
endif

" ここにインストールしたプラグインのリストを書く
NeoBundle 'Shougo/unite.vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'Align'
NeoBundle 'mattn/emmet-vim' 
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'nathanaelkane/vim-indent-guides'

" less
NeoBundle 'groenewege/vim-less'

" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'

" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'

" 自動補完 
NeoBundle 'Shougo/neocomplete.vim'

" lightline
NeoBundle 'itchyny/lightline.vim'

" JSON
NeoBundle '5t111111/neat-json.vim'

call neobundle#end()

filetype plugin on
filetype indent on

NeoBundleCheck
" NeoBundle設定ここまで
"------------------------------------------------------------

"font
set guifont=Osaka－等幅\ 15

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

syntax on
"バックスペース復活
set backspace=indent,eol,start

"対応するカッコやブレースを表示
set showmatch

" %による対応括弧へカーソル移動
source $VIMRUNTIME/macros/matchit.vim
" 対応するペアの組み合わせ
let b:match_words = "(<if>:<end if>)"

"------------------------------------------------------------


""タブ
set expandtab
set tabstop=4
set shiftwidth=4
set shiftround
"------------------------------------------------------------
"ステータスライン
:set laststatus=2 
"------------------------------------------------------------

"インデント設定
set autoindent
set expandtab
"------------------------------------------------------------
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
"""""NeoBundlePlugins設定"""""
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" vim-indent-guides
set t_Co=256
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=8
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=236
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1

" jedi-vim
" docstringは表示しない
autocmd FileType python setlocal completeopt-=preview

autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

" let g:neocomplete#force_omni_input_patterns.python = '\%([^.\t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^.\t]\.\w*'


" neocomplete
" 自動起動
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete_min_syntax_length = 3
let g:neocomplete_lock_buffer_name_pattern = '\*ku\*'
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
" return neocomplete#close_popup() . "\<CR>"
" For no inserting <CR> key.
    return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" Define dictionary.
let g:neocomplete_dictionary_filetype_lists = {
            \ 'default' : ''
            \ }

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


" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
function! s:my_cr_function()
    return neocomplete#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

"------------------------------------------------------------
"------------------------------------------------------------
"------------------------------------------------------------
"------------------------------------------------------------

""""""""""""""""""""""""""""""
" 全角スペースの表示
" http://inari.hatenablog.com/entry/2014/05/05/231307
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
""latex""""""""""""""""""""""
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
filetype plugin on
filetype indent on
set shellslash
set grepprg=grep\ -nH\ $*

" コンパイル時に使用するコマンド
let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*' 
let g:Tex_BibtexFlavor = 'jbibtex'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
"
" ファイルのビューワー
let g:Tex_ViewRule_dvi = 'xdvi'
let g:Tex_ViewRule_pdf = 'evince'
""""""""""""""""""""""""""""""
