call pathogen#infect()
syntax on
filetype plugin indent on
set nofoldenable
set nocompatible
set nobackup
set nowb
set noswapfile

" syntax highligting
syntax enable
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=0
let g:solarized_visibility="normal"
colorscheme solarized

" quiet pls
set visualbell t_vb=

" turn on line numbers
set number


" Set tabstop, softtabstop and shiftwidth to the same value
" :Stab instead
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction


" 4 space softabs default
set expandtab
set ts=4
set sts=4
set sw=4



" Only do this part when compiled with support for autocommands
if has("autocmd")
  " Enable file type detection
  filetype on

  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make       setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml       setlocal ts=2 sts=2 sw=2 expandtab

  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml

  " Customisations based on house-style (arbitrary)
  autocmd FileType html       setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType css        setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab

  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml

else

" Left this in here:

endif


" \n toggles the nerdtree pinky/index ambidextrous
map <leader>n :NERDTreeToggle<CR>

" fn + n toggles nerdtree pinky/index ambidextrous
map n :NERDTreeToggle<CR>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" buffer
set hidden
set list!
" :echo $MYVIMRC
" :source $MYVIMRC

if has("gui_running")
"
else
autocmd vimenter * NERDTree
endif
