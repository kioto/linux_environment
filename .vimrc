" Vimのフル機能を使用
set nocompatible

" 挿入モードでbackspaceが使えるようにする
set backspace=start,eol,indent

" マウスをOFF
set mouse=

" ハイライト機能をON
syntax on
"syntax off

" 前回の検索パターンが存在するとき、それにマッチするテキストを全て強調表示する
set hlsearch
"set nohlsearch

" 背景が黒の場合の色設定
highlight StatusLine ctermfg=black ctermbg=grey
highlight CursorLine ctermfg=none ctermbg=darkgrey cterm=none
highlight Matchparen ctermfg=none ctermbg=darkgrey
highlight Comment ctermfg=Darkgreen ctermbg=none
highlight Directory ctermfg=Darkgreen ctermbg=none

" 行番号の表示
set number
"set nonumber

" END OF FILE
