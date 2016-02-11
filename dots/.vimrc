
set hidden                                                " don't unload buffer when switching away
set modeline                                              " allow per-file settings via modeline
set exrc                                                  " enable per-directory .vimrc files
set secure                                                " disable unsafe commands in local .vimrc files
set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8  " saving and encoding
set nobackup nowritebackup noswapfile autoread            " no backup or swap
set hlsearch incsearch ignorecase smartcase               " search
set wildmenu                                              " completion
set backspace=indent,eol,start                            " sane backspace
set clipboard=unnamedplus                                 " use the system clipboard for yank/put/delete
set mousemodel=popup                                      " right-click pops up context menu
set ruler                                                 " show cursor position in status bar
set number                                                " show line numbers on left
set nofoldenable                                          " I fucking hate code folding
set scrolloff=10                                          " scroll the window so we can always see 10 lines around the cursor
set textwidth=80                                          " show a vertical line at the 79th character
set cursorline                                            " highlight the current line
"set cursorcolumn                                         " highlight the current line
set smartindent                                           " does the right thing (mostly) in programs
set guioptions-=T                                         " turn off GUI toolbar (icons)
set guioptions-=r                                         " turn off GUI right scrollbar
set guioptions-=L                                         " turn off GUI left scrollbar
set winaltkeys=no                                         " turn off stupid fucking alt shortcuts
set laststatus=2                                          " always show status bar

" middle-click paste
map! <S-Insert> <MiddleMouse>

" appearance
syntax on
set t_Co=256 " 256 colors in terminal
set guifont=Ubuntu\ Mono\ 11
let g:molokai_original=1
colorscheme jellybeans
"syntax enable
"set background=dark
"colorscheme solarized

" override some highlight settings (turn off stupid italics in Molokai)
hi ColorColumn  ctermbg=235 guibg=#2c2d27
hi CursorLine   ctermbg=235 guibg=#2c2d27
hi CursorColumn ctermbg=235 guibg=#2c2d27
highlight LineNr ctermfg=DarkGrey ctermbg=235
highlight DiffText     gui=none
highlight Macro        gui=none
highlight SpecialKey   gui=none
highlight Special      gui=none
highlight StorageClass gui=none
highlight Tag          gui=none

" highlight the 80th column
"
" In Vim >= 7.3, also highlight columns 120+
if exists('+colorcolumn')
    " (I picked 120-320 because you have to provide an upper bound and 320 just
    " covers a 1080p GVim window in Ubuntu Mono 11 font.)
    "let &colorcolumn="80,".join(range(120,320),",")
    let &colorcolumn=81
else
    " fallback for Vim < v7.3
    autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

set tabstop=4 shiftwidth=4 expandtab
autocmd FileType lua :setlocal sw=4 ts=4
autocmd FileType cpp :setlocal sw=2 ts=2 sts=2 shiftwidth=2 expandtab
autocmd FileType h :setlocal sw=2 ts=2 sts=2 shiftwidth=2 expandtab
autocmd FileType dat :setlocal sw=8 ts=12

filetype plugin on

if has("gui_running")
    " C-Space seems to work under gVim on both Linux and win32
    inoremap <C-Space> <C-n>
else " no gui
  if has("unix")
    inoremap <Nul> <C-n>
  else
  " I have no idea of the name of Ctrl-Space elsewhere
  endif
endif

" Auto Spell for text files
autocmd BufNewFile,BufRead *.tex set spell
autocmd BufNewFile,BufRead *.txt set spell
autocmd BufNewFile,BufRead *.md set spell
" Set spellfile to location that is guaranteed to exist, can be symlinked to
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" call pathogen#infect()

function s:appendSemiColon()
    if getline('.') !~ ';$'
        let original_cursor_position = getpos('.')
        exec("s/$/;/")
        call setpos('.', original_cursor_position)
    endif
endfunction

autocmd FileType c,cpp,css,java,javascript,perl,php
    \ nmap <silent> <Leader>; :call <SID>appendSemiColon()<cr>

" Start NERD Tree and select code window
autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p
" Auto close NERD Tree if the last code window is closed
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Remap to next/previous buffers ctrl-n/p
nnoremap <silent> <C-n> :bn<CR>
nnoremap <silent> <C-p> :bp<CR>

