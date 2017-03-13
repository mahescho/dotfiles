set nocompatible

" Initialize Pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Enable syntax highlighting
syntax on
filetype plugin indent on
" toggel autoident for mouse pasting
set pastetoggle=<f5>

" Enable spmartcase

set smartcase

" Colorscheme see https://github.com/hukl/Smyck-Color-Scheme
color smyck

" Use 256 colours (Use this setting only if your terminal supports 256
" colours)
set t_Co=256

" Add line numbers
set ruler

" underline current line
set cursorline
highlight CursorLine gui=underline cterm=underline guibg=#000000
autocmd InsertEnter * highlight CursorLine guibg=#000050 guifg=fg ctermbg=234
autocmd InsertLeave * highlight CursorLine guibg=#000000 guifg=fg ctermbg=none

" rembember cursor position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" map leader to komma
let mapleader = ","

" Set encoding
set encoding=utf-8

" Whitespace stuff
set nowrap
let s:tabwidth=4
let &l:tabstop = s:tabwidth
let &l:shiftwidth = s:tabwidth
let &l:softtabstop = s:tabwidth
set expandtab

" Show trailing spaces and highlight hard tabs
set list listchars=tab:»·,trail:·

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Strip trailing whitespaces on each save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Search related settings
set incsearch
set hlsearch

" Map Ctrl+l to clear highlighted searches
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" Highlight characters behind the 80 chars margin
" :au BufWinEnter * let w:m2=matchadd('ColumnMargin', '\%>80v.\+', -1)

" Disable code folding
set nofoldenable

" Directories for swp files
set backupdir=~/.vimbackup
set directory=~/.vimbackup

" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <Leader>t :NERDTreeToggle<CR>

" make uses real tabs
au FileType make set noexpandtab

" Erlang uses 4 spaces
au FileType erlang set softtabstop=4 tabstop=4 shiftwidth=4

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=2 tabstop=2 shiftwidth=2

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" ctrp custom ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.eunit$',
  \ 'file': '\.exe$\|\.so$\|\.dll\|\.beam$\|\.DS_Store$'
  \ }

let g:erlangCheckFile = "~/.vim/bundle/vimerl/compiler/erlang_check_file.erl"
let g:erlangHighlightErrors = 1

" jedi
let g:jedi#popup_on_dot = 0

" powerline
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
" Always show statusline
set laststatus=2

" less behaviour for view
" http://unix.stackexchange.com/a/314184/39845

" http://vim.wikia.com/wiki/Using_vim_as_a_syntax-highlighting_pager
function! LessBehaviour()
    if (!&modifiable || &ro)
        set nonumber
        set nospell
        set laststatus=0    " Status line
        set cmdheight=1
        set guioptions=aiMr    " No menu bar, nor tool bar
        noremap u <C-u>
        noremap d <C-d>
        noremap q :q<CR>
    endif
endfunction

" http://vi.stackexchange.com/a/9101/3168
augroup ReadOnly
    au!
    au BufEnter * :call LessBehaviour()
augroup END




