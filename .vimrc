"-----------------Vundle----------------"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-vinegar'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'bcicen/vim-vice'
Plugin 'terryma/vim-expand-region'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'mattn/emmet-vim'
Plugin 'posva/vim-vue'
Plugin 'wavded/vim-stylus'
Plugin 'rking/ag.vim'
Plugin 'skwp/greplace.vim'
Plugin 'vim-scripts/BufOnly.vim'
"Plugin 'ervandew/supertab'
"Plugin 'tobyS/vmustache'
"Plugin 'tobyS/pdv'
"Plugin 'SirVer/ultisnips'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let NERDTreeHijackNetrw = 0

"-------------------Easy Align----------------"
xmap ga <Plug>(EasyAlign)
nmap ga <Plug(EasyAlign)
"---------------------Misc----------------------"
syntax enable

set hidden
set nowrap
set autoindent
set copyindent
set showmatch
set smartcase

set backspace=indent,eol,start             "Make backspace behave like other editors"
let mapleader = ','                        "Set comma as default Leader"
set number                                 "Let's activate line numbers"
set shortmess+=A

set background=dark
colorscheme atom-dark-256

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set mouse=a

set whichwrap+=hl

set title
set nobackup
set noswapfile

set noerrorbells visualbell t_vb=

set wildignorecase

set autowriteall
set complete=.,w,b,u

"Sort PHP use statements
""http://stackoverflow.com/questions/11531073/how-do-you-sort-a-range-of-lines-by-length
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>
"-----------------Searching----------------"
set nohlsearch
set incsearch
"-----------------PHP-Namespace---------------"
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>nu <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>nu :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>eu <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>eu :call PhpExpandClass()<CR>
"-----------------Auto-Commands----------------"
"Automatically source .vimrc on save"
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

autocmd BufWritePre * %s/\s\+$//e
"---------------Greplace-------------"
set grepprg=ag

let g:grep_cmd_opts = '--line-numbers --noheading'
"-----------------Mappings----------------"
nmap vv V

map <F2> :ls<CR>:b<Space>
map <F4> :BufOnly<cr>

nmap <Leader>ev :tabedit $MYVIMRC<cr>

nmap <Leader>es :tabedit ~/.vim/snippets/

set hlsearch
nmap <Leader><space> :nohlsearch<cr>

map <Leader>' :norm i//<cr>
map <Leader>* :norm ^xx<cr>

nmap <C-b> :NERDTreeToggle<cr>

nmap <Leader>f :tag<space>

nmap <Leader>ct :!ctags -R

nmap <Leader>bp :bp<cr>
nmap <Leader>bn :bn<cr>
nmap <Leader>bd :bd<cr>

nmap <Leader>mv :!mv

nmap <Leader>ws /\s\+$/<cr>
nmap <Leader>o O

inoremap {<CR>  {<CR>}<Esc>O
"------------------Multi-Cursor-----------------"
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse

"-----------------Ctrl-P specific-----------------"
"let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
"if executable('ag')
"  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"endif
"
"if exists("g:ctrl_user_command")
"  unlet g:ctrlp_user_command
"endif
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*
"-----------------Laravel specific----------------"
nmap <Leader>lc :e app/Http/Controllers<cr>
nmap <Leader>la :e app/<cr>
nmap <Leader>lv :e resources/views/<cr>
nmap <Leader>lr :e app/Http/routes.php<cr>
nmap <Leader>ls :e database/seeds/<cr>
nmap <Leader>lm :e database/migrations/<cr>
nmap <Leader>lt :e tests/<cr>
nmap <Leader>lf :e database/factories/ModelFactory.php<cr>

nmap <Leader>mk :!php<space>artisan<space>make:
nmap <Leader>art :!php<space>artisan<space>

map <Leader>t :!vendor/bin/phpunit %

abbrev reseed !php artisan migrate:refresh --seed
"-----------------Abbreviations-----------------"
:ca Q q
:ca W w
:ca E e
"-----------------Split management----------------"
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>
nmap <C-H> <C-W><C-H>

nmap + :vertical resize +3<cr>
nmap 25 :vertical resize 30<cr>
nmap 50 <c-w>=
nmap 75 :vertical resize 99<cr>

hi vertsplit ctermfg=bg ctermbg=bg
hi LineNr ctermbg=bg
hi foldcolumn ctermbg=bg

set splitbelow
set splitright
"------------------PDV-----------------------"
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <Leader>d :call pdv#DocumentWithSnip()<CR>

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
