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
NeoBundle 'git://github.com/mattn/zencoding-vim.git'

" less
NeoBundle 'groenewege/vim-less'

" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'

" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'

call neobundle#end()

filetype plugin on
filetype indent on

NeoBundleCheck
" NeoBundle設定ここまで
"------------------------------------------------------------

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
    "NERDtree
nnoremap nerd :NERDTree<Enter>
    "自動的に閉じカッコを入力
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
"------------------------------------------------------------

"一般設定
set number

syntax on
    "バックスペース復活
    set backspace=indent,eol,start

    "対応するカッコやブレースを表示
    set showmatch

"------------------------------------------------------------


""タブ
set expandtab
set tabstop=4
set shiftwidth=4
set shiftround
"------------------------------------------------------------

"インデント設定
set autoindent
set expandtab
"------------------------------------------------------------
"NeoBundlePlugins設定
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
