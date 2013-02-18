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
