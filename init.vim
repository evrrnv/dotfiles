let mapleader = "\<Space>"

call plug#begin("~/.vim/plugged")
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug '907th/vim-auto-save'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
" Plug 'prettier/vim-prettier'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'romainl/vim-cool'
Plug 'tpope/vim-commentary'
Plug 'ianks/vim-tsx'
Plug 'ryanoasis/vim-devicons'
Plug 'kien/ctrlp.vim'
Plug 'Yggdroot/indentLine'
Plug 'vimwiki/vimwiki'
call plug#end()

set number
set expandtab
set autoindent
set softtabstop=4
set shiftwidth=2
set tabstop=4
set mouse=r
set guicursor=
set autoread
set list listchars=tab:>\ ,trail:+,eol:$
set clipboard+=unnamedplus

let g:coc_disable_startup_warning = 1

" === coc.nvim === "

set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-css', 'coc-prettier']

if (empty($TMUX))
if (has("nvim"))
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
        set termguicolors
endif
endif

inoremap <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
inoremap <silent><expr> <c-space> coc#refresh()
else
inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                                                                                                                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <leader>rn <Plug>(coc-rename)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 Prettier :CocCommand prettier.formatFile

vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" === coc.nvim === "

" === onedark.vim === "
set termguicolors
syntax on
colorscheme onedark
" === onedark.vim === "

" === nerdtree === "
let g:NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden=1

nnoremap <Leader>d :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
" === nerdtree === "

" === airline === "
let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" === airline === "

" === vim-auto-save === "
let g:auto_save = 1
let g:auto_save_silent = 1
" === vim-auto-save === "

" === auto-pairs === "
let g:AutoPairsFlyMode = 1
" === auto-pairs === "

" === ctrlp === "
set wildignore+=*/node_modules/*

let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_show_hidden = 1

nnoremap <C-c> :CtrlPBuffer<CR>

function! SetupCtrlP()
  if exists("g:loaded_ctrlp") && g:loaded_ctrlp
    augroup CtrlPExtension
      autocmd!
      autocmd FocusGained  * CtrlPClearCache
      autocmd BufWritePost * CtrlPClearCache
    augroup END
  endif
endfunction
if has("autocmd")
  autocmd VimEnter * :call SetupCtrlP()
endif
" === ctrlp === "

" === vimwiki === "
set nocompatible
let g:vimwiki_list = [{'auto_diary_index': 1}]
filetype plugin on
" === vimwiki === "

inoremap <S-Tab> <C-d>

noremap <silent> <Leader>vs :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR><C-W>l

nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h


nnoremap <Leader>p :bp<CR>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>q :bd<CR>

nnoremap <Leader>rr :%s//g<Left><Left>

nnoremap <Leader>t :term<CR>i

nnoremap <Leader>z :Prettier<CR>
