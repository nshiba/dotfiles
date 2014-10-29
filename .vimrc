"一般設定
set nocompatible
set number
syntax on
""タブサイズ]
set tabstop=2
set shiftwidth=2
set shiftround
""

"インデント設定
set autoindent
set expandtab

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

call neobundle#end()

filetype plugin on
filetype indent on

" NeoBundle設定ここまで

" vim-indent-guides
set t_Co=256
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=8
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=236
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1
