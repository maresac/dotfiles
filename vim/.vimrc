" Plugins
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf.vim'
Plug '/usr/local/opt/fzf'
Plug 'scrooloose/nerdtree'
Plug 'romainl/apprentice'
Plug 'ervandew/supertab'
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries', 'tag': 'v1.19' }
Plug 'python-mode/python-mode', { 'for': 'python' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive', { 'tag': 'v2.5' }
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
call plug#end()

" General options
set cursorline                  " show cursor
set encoding=utf-8              " proper encoding
set hidden                      " allow background buffers
set nocompatible                " no compatibility with legacy vi
set number                      " show line numbers
set showcmd                     " display incomplete commands in statusline
set visualbell                  " don't beep
set clipboard=unnamed           " copy stuff to system clipboard
set history=1000

" Folding
set foldmethod=indent           " fold based on indent
set foldnestmax=3               " deepest fold is 3 levels
set nofoldenable                " dont fold by default

" Searching
set ignorecase

" Leader
let mapleader = ","

" Tabs, spaces, wrapping
filetype plugin indent on
set nowrap                      " don't wrap lines
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set textwidth=0                 " no automatic text wrapping
set expandtab
set noswapfile

" Appearance
if has("termguicolors")
	set termguicolors
else
	set t_Co=256
endif
set background=dark
colorscheme apprentice
set list                        " show invisible characters
set listchars=""                " reset the listchars
set listchars+=tab:▸\           " show tabs as ▸
set listchars+=eol:¬            " show end of line as ¬
set listchars+=trail:.          " show trailing spaces as dots
set listchars+=extends:>        " show > if the text continues beyond the vim window

" Remove search highlighting
map <leader><space> :noh<cr>

" New vertical/horizontal split
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>j

" Edit vim configuration
nnoremap <leader>ev <C-w>s<C-w>j<C-w>L:e ~/.vimrc<cr>

" Equal height/width of splits
nnoremap <leader>0 <C-w>=

" Split window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Simplify quit and write
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>

" Filetype-specific stuff
autocmd FileType python,yaml autocmd BufWritePre <buffer> %s/\s\+$//e
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" lightline
set laststatus=2
set noshowmode

let g:lightline = {
  \ 'colorscheme': 'apprentice',
  \ 'active': {
  \   'left': [[], ['paste', 'spell'], ['filename']],
  \   'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype']]
  \ },
  \ 'component_function': {
  \   'branch': 'fugitive#head',
  \   'fileencoding': 'LightlineFileencoding',
  \   'fileformat': 'LightlineFileformat',
  \   'filename': 'LightlineFilename',
  \   'filetype': 'LightlineFiletype'
  \ },
  \ }

function! LightlineReadonly()
  return &ft !~? 'help\|fugitive\|git' && &readonly ? '🔒' : ''
endfunction

function! LightlineModified()
  return &ft =~ 'help\|fugitive\|git' ? '' : &modified ? '[+]' : &modifiable ? '' : '[-]'
endfunction

function! LightlineFilename()
  return  ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ ('' != expand('%') ? expand('%') : '[No Name]') .
        \ ('' != LightlineModified() ? LightlineModified() : '')
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : '-') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

" ---------- PLUGINS ----------
" -----------------------------
" fzf
nnoremap <silent> <leader>ag :Ag<CR>
nnoremap <silent> <Leader>aw :Ag <C-R><C-W><CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>gc :Commits<CR>
nnoremap <silent> <leader>gs :GitFiles?<CR>
let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'down': '~20%' }

" pymode
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>rb'
let g:pymode_doc = 0
let g:pymode_options_max_line_length = 100
let g:pymode_rope = 1
let g:pymode_rope_goto_definition_bind = '<leader>rgd'
let g:pymode_rope_regenerate_on_write = 0
let g:pymode_rope_rename_bind = '<leader>rr'
let g:pymode_rope_show_doc_bind = ''
let g:pymode_run = 0
let g:pymode_lint = 0

" NERDtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

" fugitive
map <leader>gb :Gblame<CR>
map <leader>gd :Gvdiff<CR>

" ale
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

" vim-go
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 0
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_addtags_transform = "snakecase"
let g:go_def_mode = "godef"
aug filetype_go
  au!
  au FileType go set shiftwidth=4
  au FileType go set softtabstop=4
  au FileType go set tabstop=4
  au FileType go nmap gb :<C-u>call <SID>build_go_files()<CR>
  au FileType go nmap gr <Plug>(go-run)
  au FileType go nmap gl <Plug>(go-metalinter)
  au FileType go nmap <leader>gt :GoDeclsDir<cr>
  au Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
  au Filetype go nmap <leader>gah <Plug>(go-alternate-split)
  au Filetype go nmap <leader>gav <Plug>(go-alternate-vertical)
  au Filetype go nmap <leader>gct <Plug>(go-coverage-toggle)
aug end
