if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup fedora
  autocmd!
  " In text files, always limit the width of text to 78 characters
  " autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
  autocmd BufNewFile,BufReadPre /media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
  " start with spec file template
  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  augroup END
endif

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

filetype plugin on

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"

:set number
:set shiftwidth=2
:set expandtab
:set tabstop=2
:set autoindent
:set wiw=90
:map ^N :set nu!<CR>
:map ^O :set paste!<CR>
:map! <?php <?php<ESC>o// Copyright 2004-present Facebook. All Rights Reserved.<ESC>o
:map! <?hh <?hh<ESC>o// Copyright 2004-present Facebook. All Rights Reserved.<ESC>o
:map! /** /**<ESC>o * <ESC>o*/<ESC>ki 
noremap  <Up> ""
noremap! <Up> <Nop>
noremap  <Down> ""
noremap! <Down> <Nop>
noremap  <Left> ""
noremap! <Left> <Nop>
noremap  <Right> ""
noremap! <Right> <Nop>
noremap! <Esc> <Nop>
noremap ; l
noremap l k
noremap k j
noremap j h
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.*/
au BufRead,BufNewFile *.phpt set filetype=php
au BufRead,BufNewFile *.thrift set filetype=cpp
au BufRead,BufNewFile *.fxl set filetype=javascript
au BufRead,BufNewFile *.fxlib set filetype=javascript
au BufRead,BufNewFile *.cconf set filetype=python
au BufRead,BufNewFile *.cinc set filetype=python
au BufRead,BufNewFile *.tw set filetype=python
