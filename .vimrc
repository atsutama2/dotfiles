"-------------------------------------------------------
" .vimrc auther: atsutama2
"-------------------------------------------------------

"-------------------------------------------------------
" vim-plug
"-------------------------------------------------------
call plug#begin('~/.local/share/nvim/plugged')
  Plug 'vim-jp/vimdoc-ja'                 " 日本語に翻訳した Vim 付属のヘルプ
  Plug 'osyo-manga/vim-anzu'              " 検索時にマッチした個数とそれが何番目であるかの情報を表示
  Plug 'itchyny/lightline.vim'            " ステータスラインをリッチにする
  Plug 'vim-scripts/yanktmp.vim'          " 別プロセスのvim同士でコピーペースト
  Plug 'airblade/vim-gitgutter'           " 変更箇所を左端に表示する
  Plug 'nathanaelkane/vim-indent-guides'  " インデントを可視化
  Plug 'altercation/vim-colors-solarized' " カラースキーム設定
call plug#end()

"-------------------------------------------------------
" vim-colors-solarized 
"-------------------------------------------------------
syntax enable
set background=dark
colorscheme solarized


"-------------------------------------------------------
" vim-indent-guides
"-------------------------------------------------------
"colorscheme default
"vim立ち上げ時に自動的にvim-indent-guidesをオンにする。
let g:indent_guides_enable_on_vim_startup = 0
"autoで色付けするのはストップ
let g:indent_guides_auto_colors = 1
"色の変化幅（？）パーセンテージ
let g:indent_guides_color_change_percent = 30
"奇数行の色付け
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=#262626 ctermbg=gray
"偶数行の色付け
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray
"インデントの色付け幅
let g:indent_guides_guide_size = 1


"-------------------------------------------------------
" yanktmp.vim
"-------------------------------------------------------
map <silent> sy :call YanktmpYank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR>


"-------------------------------------------------------
" vim-anzu.vim
"-------------------------------------------------------
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)


"-------------------------------------------------------
" lightline.vim
"-------------------------------------------------------
let g:lightline = {
            \ 'colorscheme': 'solarized',
            \ 'mode_map': {'c': 'NORMAL'},
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
            \ },
            \ 'component': {
            \   'dir': '%.35(%{expand("%:h:s?\\S$?\\0/?")}%)',
            \   'winbufnum': '%n%{repeat(",", winnr())}%<',
            \   'rows': '%L',
            \   'cd': '%.35(%{fnamemodify(getcwd(), ":~")}%)',
            \   'tabopts': '%{&et?"et":""}%{&ts}:%{&sw}:%{&sts},%{&tw}',
            \   'lineinfo': '%3l:%-3v'
            \ },
            \ 'component_function': {
            \   'fileformat': 'LightLineFileformat',
            \   'filetype': 'LightLineFiletype',
            \   'fileencoding': 'LightLineFileencoding',
            \   'mode': 'LightLineMode',
            \   'fugitive': 'StlFugitive',
            \   'cfi': 'StlCurrentFuncInfo',
            \   'currentfuncrow': 'StlCurrentFuncRow'
            \ }
            \ }

function! StlFugitive()
    try
        if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
            return fugitive#head()
        endif
    catch
    endtry
    return ''
endfunction

function! StlCurrentFuncInfo()
    if exists('*cfi#format')
        return cfi#format('%.43s()', '')
    end
    return ''
endfunction

function! StlCurrentFuncRow()
    if &ft != 'vim'
        return ''
    end
    let funcbgn = search('^\s*\<fu\%[nction]\>', 'bcnW', search('^\s*\<endf\%[unction]\>', 'bcnW'))
    if funcbgn > 0
        let row = line('.') - funcbgn
        return row ? row : ''
    endif
    return ''
endfunction

function! LightLineFileformat()
      return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
      return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
      return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
      return winwidth(0) > 60 ? lightline#mode() : ''
endfunction


"-------------------------------------------------------
" vim-gitgutter
"-------------------------------------------------------
nmap <silent> <C-g><C-n> <Plug>GitGutterNextHunk
nmap <silent> <C-g><C-p> <Plug>GitGutterPrevHunk


"-------------------------------------------------------
" 詳細設定 
"-------------------------------------------------------
filetype plugin indent on
filetype indent on

let g:neocomplete_php_locale = 'ja'
let g:Powerline_symbols = 'fancy'
let g:gitgutter_max_signs = 5000

" copy & paste map
nnoremap <Space>d "*dd
vnoremap <Space>d "*dd
nnoremap <Space>y "*yy
vnoremap <Space>y "*yy
nnoremap <Space>p "*p
vnoremap <Space>p "*p

au BufRead,BufNewFile *.scss set filetype=scss
au BufRead,BufNewFile *.tpl set filetype=php
au BufNewFile,BufRead * match ZenkakuSpace /　/

nnoremap <F3> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>

autocmd InsertEnter,InsertLeave * set cursorline! " 挿入モードの時のみ、カーソル行をハイライトする
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd! FileType smarty setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd! FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4

highlight StatusLine ctermfg=black ctermbg=lightblue
highlight MatchParen ctermfg=none ctermbg=darkgray
highlight Comment ctermfg=DarkGreen ctermbg=NONE
highlight Directory ctermfg=DarkGreen ctermbg=NONE
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666

" 画面表示の設定
set number         " 行番号を表示する
set cursorline     " カーソル行の背景色を変える
set laststatus=2   " ステータス行を常に表示
set cmdheight=2    " メッセージ表示欄を2行確保
set showmatch      " 対応する括弧を強調表示
set helpheight=999 " ヘルプを画面いっぱいに開く
set nocursorline   " カーソル行を強調表示しない
set ambiwidth=double " □や○文字が崩れる問題を解決
set clipboard+=unnamedplus

" カーソル移動関連の設定
set backspace=indent,eol,start " Backspaceキーの影響範囲に制限を設けない
set whichwrap=b,s,h,l,<,>,[,]  " 行頭行末の左右移動で行をまたぐ
set scrolloff=8                " 上下8行の視界を確保
set sidescrolloff=16           " 左右スクロール時の視界を確保
set sidescroll=1               " 左右スクロールは一文字づつ行う

" ファイル処理関連の設定
set confirm    " 保存されていないファイルがあるときは終了前に保存確認
set hidden     " 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set autoread   " 外部でファイルに変更がされた場合は読みなおす
set nobackup   " ファイル保存時にバックアップファイルを作らない
set noswapfile " ファイル編集中にスワップファイルを作らない

" 検索/置換の設定
set hlsearch   " 検索文字列をハイライトする
set incsearch  " インクリメンタルサーチを行う
set ignorecase " 大文字と小文字を区別しない
set smartcase  " 大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan   " 最後尾まで検索を終えたら次の検索で先頭に移る
set gdefault   " 置換の時 g オプションをデフォルトで有効にする
set grepprg=internal

" タブ/インデントの設定
set expandtab     " タブ入力を複数の空白入力に置き換える
set tabstop=4     " 画面上でタブ文字が占める幅
set shiftwidth=4  " 自動インデントでずれる幅
set softtabstop=4 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent    " 改行時に前の行のインデントを継続する
set smartindent   " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する

" コマンドラインモードでTABキーによるファイル名補完を有効にする
set wildmenu wildmode=list:longest,full

" コマンドラインの履歴を10000件保存する
set history=10000

"ハイライトをESCキーで消す
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" vim diff設定
set diffopt=vertical " 左右分割
