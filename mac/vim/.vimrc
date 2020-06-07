source $VIMRUNTIME/defaults.vim

"--------------------------------------------------------------
" エンコーディング設定
"--------------------------------------------------------------
set fileencodings=utf-8,cp932
set encoding=utf-8
"scriptencoding utf-8


"--------------------------------------------------------------
" エディタ表示の設定
"--------------------------------------------------------------
" カーソル座標表示
set ruler

" ステータスラインの表示
set laststatus=2

" 行番号表示
set number

" コマンドライン補完
set wildmenu

" カラーテーマ
let g:hybrid_use_iTerm_colors = 1
set background=dark

" カーソルライン
set cursorline
"set cursorcolumn
autocmd ColorScheme * highlight LineNr ctermfg=12
highlight CursorLineNr ctermbg=4 ctermfg=0
highlight clear CursorLine

" シンタックスハイライト
syntax enable

" 改行時自動インデント
set smartindent

" インデント幅
set shiftwidth=4
set softtabstop=4
set tabstop=4

" タブをスペース化
set expandtab
set smarttab

" ビープ音無効化
set visualbell t_vb=

" 長い行の折り返し表示
set wrap

"--------------------------------------------------------------
" 検索設定
"--------------------------------------------------------------
" 入力中に検索を行う
set incsearch
" 検索結果ハイライト
set hlsearch
" 大文字と小文字を区別しない
set ignorecase
" 大文字と小文字が混在した検索のみ大文字と小文字を区別する
set smartcase
" 最語尾になったら先頭に戻る
set wrapscan
" 置換の時gオプションをデフォルトで有効にする
set gdefault

"不可視文字の設定
set list
set listchars=tab:>-,eol:↲,extends:»,precedes:«,nbsp:%

"コマンドラインモードのファイル補完設定
set wildmode=list:longest,full

"入力中のコマンドを表示
set showcmd

"クリップボードの共有
set clipboard=unnamed,autoselect

"カーソル移動で行をまたげるようにする
set whichwrap=b,s,h,l,<,>,~,[,]

"バックスペースを使いやすく
set backspace=indent,eol,start
set nrformats-=octal

set pumheight=10

"対応する括弧に一瞬移動
set showmatch
set matchtime=1
source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する

"ウィンドウの最後の行もできるだけ表示
set display=lastline

"変更中のファイルでも保存しないで他のファイルを表示する
set hidden

"バックアップファイルを作成しない
set nobackup
"バックアップファイルのディレクトリ指定
set backupdir=$HOME/.vim/backup
"アンドゥファイルを作成しない
set noundofile
"アンドゥファイルのディレクトリ指定
set undodir=$HOME/.vim/backup
"スワップファイルを作成しない
set noswapfile


"--------------------------------------------------------------
" キーマップ設定
"--------------------------------------------------------------


";;でノーマルモード
inoremap ;; <esc>

"ノーマルモードのまま改行
nnoremap <CR> A<CR><ESC>
"ノーマルモードのままスペース
nnoremap <space> i<space><esc>

"rだけでリドゥ
nnoremap r <C-r>

"Yで行末までヤンク
nnoremap Y y$

"ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>


"ペースト時に自動インデントで崩れるのを防ぐ
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif


"filetype plugin indent on


"--------------------------------------------------------------
" Undoの永続化
"--------------------------------------------------------------
if has('persistent_undo')
    let undo_path = expand('~/.vim/undo')
    exe 'set undodir=' .. undo_path
    set undofile
endif


"--------------------------------------------------------------↲
" dein.vim
" https://github.com/Shougo/dein.vim
" 
" install command:
" :call dein#install()
"--------------------------------------------------------------↲
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
    
  endif

  " Load TOML
  call dein#load_toml('~/.vim/dein.toml', { 'lazy': 0 })

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable



"---

