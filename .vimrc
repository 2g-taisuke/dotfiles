" 文字コードをutf-8に設定

set fenc=utf-8
set number
syntax on
"-------------------------------------------------------------------------------
" plugin-manager
"-------------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'

call plug#end()

"-------------------------------------------------------------------------------
" インデント
"-------------------------------------------------------------------------------

" 改行時に現在行と同じ分だけインデント
set autoindent
" C言語likeな構文を記述している改行ごとに自動でインデントしてくれる
set smartindent

" コンテキストに応じたタブ処理を行う。
" TODO: 機能が不明
set smarttab

" [tab]、オートインデント、<>コマンド時タブの代わりに空白を使う
" ctl+v[tab]でタブは入力できる
" 'paste'がセットされているときに無効になる
set expandtab

" expandtabがセットされているときのタブの数
" set ts=4とかですぐに変更できる
" TODO: タブと空白の設定をファイルごとに変更する
set tabstop=2
" cindent?や>>などのコマンドで挿入されるタブ. tabstopと同じで良い？
set shiftwidth=2
"set smarttab
" [tab]入力時
set softtabstop=2

"-------------------------------------------------------------------------------
" 表示
"-------------------------------------------------------------------------------
" 右下に行列番号表示
set ruler

" タブバーを常に表示する
" TODO: タブ機能について調べる
" set showtabline=2

" デフォルトでは画面に収まりきらない行は@が行番号に表示されるのみになるが
" それを表示する。
set display=lastline
"バイナリファイルの非印字可能文字を16進数で表示
" setを複数やるのどうやるんだ。
" set display=uhex

" ヘルプを画面全体に表示
set helpheight=999

" マウスを利用する
set mouse=a

" 対応するカッコを自動で強調表示
set showmatch

" 閉じカッコ入力した場合に開きカッコに一瞬飛ぶが、デフォルトが0.5なのを0.1に設定
set matchtime=1

" カーソル行の表示
"set cursorline

" 行を折り返す（デフォルトと同じ）
set wrap

"-------------------------------------------------------------------------------
" 操作
"-------------------------------------------------------------------------------
" 行頭、行末でh,lで移動時に行移動。試験運用のためDEBUG: 
set whichwrap=h,l
" コマンドラインモードでの補完を有効にする
set wildmenu
" コマンドラインモードでの補完方法を設定する
" 一覧表示してから選択
set wildmode=list:longest,full

" osとクリップボードを共有する。ビルドオプションに+clipboardが必要
set clipboard+=unnamed

" 何故か^Hが効かないことが。。。
set backspace=indent,eol,start


"-------------------------------------------------------------------------------
" 検索
"-------------------------------------------------------------------------------
" 検索時に候補を循環させない
set nowrapscan

" 検索時に大文字小文字を無視する
set ignorecase
" ignorecaseがonの場合に、検索文字列に大文字が含まれていれば大文字のみを検索する
" 両方をonにした場合
" caseを無視したい => 小文字で検索
" 大文字のみを検索したい => 大文字で検索
" 小文字のみを検索したい => set noignorecaseしてから検索
set smartcase

" 検索時にenter無しで即時検索
set incsearch

" 検索時にハイライト
set hlsearch

" ESC連打でハイライト解除
" TODO: ctl+[のキーマップは。。。
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"-------------------------------------------------------------------------------
" ファイル処理
"-------------------------------------------------------------------------------
" デフォルトだと保存しないと別バッファは開けないが、それができる。
" shougo系入れてから考える DEBUG:
set hidden

" TODO: バックアップ系は使ってないやつを掃除するcronがいるかも。。。。
" swpファイルの指定(編集中のバックアップ)
set swapfile
set directory=~/.vim/swp
set updatecount=500

" バックアップファイル指定(保存時に残すバックアップ)
set backup
set backupdir=~/.vim/backup
set backupext=.back
" バックアップの日付指定 
au BufWritePre * let &bex = '.' . strftime("%Y%m%d_%H%M%S")

" undoファイル
" ディレクトリ指定するとファイルパスを名前にしてファイル持つので、編集ファイルが移動するとそれは使えない。
set undofile
set undodir=~/.vim/undo

" viminfo場所
set viminfo+=n~/.vim/viminfo

" TODO: ctrl + [でハイライト消したい
" keymap

"-------------------------------------------------------------------------------
" 検討
"-------------------------------------------------------------------------------

" 音消す
set visualbell t_vb=
set noerrorbells

" 全角空白を可視化(コピペ)
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

" タブを可視化(コピペ)
" eolはうざいので使わない
" trail(末尾空白)もオプションなどが打ちづらいので使わない
"set list listchars=tab:\▸-,trail:-,eol:↲,eextends:❯,precedes:❮,nbsp:%
set list listchars=tab:\▸-,extends:❯,precedes:❮,nbsp:%

set scrolloff=8        " 上下スクロール時に視界オフセット確保
set sidescrolloff=16   " 左右スクロール時の視界オフセット確保
set sidescroll=1       " 左右スクロールは１文字ずつ

" ステータスラインを常に表示
set laststatus=2

" １行が折り返しの場合でも縦移動
" 必須だと思うのだが、jkが遅く感じる。。。
" repeatの設定が必要
"nnoremap j gj
"nnoremap k gk

" 列を指定して強調表示。
" 色を変更できれば
" set colorcolumn=80

" 現在カーソル行強調表示。色がきつくて見づらい。もう少し薄くできれば。
" けれど構文を見やすくできるかもしれないので検討
" set cursorcolumn

"paste をオンにすれば autoindent がオフの状態のトグル
" TODO: キーマップ設定？
"set pastetoggle=<F2>

"-------------------------------------------------------------------------------
" キーマップ
"-------------------------------------------------------------------------------

" Unite.vim

"unite prefix key.
nnoremap [unite] <Nop>
nmap <Space> [unite]
 
"unite general settings
"インサートモードで開始
"let g:unite_enable_start_insert = 1
"最近開いたファイル履歴の保存数
let g:unite_source_file_mru_limit = 50
 
"file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:unite_source_file_mru_filename_format = ''
 
"現在開いているファイルのディレクトリ下のファイル一覧。
"開いていない場合はカレントディレクトリ
nnoremap <silent> [unite]d :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
"レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
"最近使用したファイル一覧
" file_mruはuniteから分離しているので注意
nnoremap <silent> [unite]h :<C-u>Unite file_mru<CR>
"ブックマーク一覧
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
"ブックマークに追加
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
"uniteを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  "ESCでuniteを終了
  nmap <buffer> <ESC> <Plug>(unite_exit)
  nmap <buffer> <Ctrl-[> <Plug>(unite_exit)
  "入力モードのときjjでノーマルモードに移動
  imap <buffer> jj <Plug>(unite_insert_leave)
  "入力モードのときctrl+wでバックスラッシュも削除
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  "ctrl+jで縦に分割して開く
  nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  "ctrl+jで横に分割して開く
  nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  "ctrl+oでその場所に開く
  nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
  inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
endfunction"}}}
