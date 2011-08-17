
set lbr

"map <F10> :w<CR> :lcd /home/chris/cs6241/llvm/lib/Transforms/phase1-1/<CR> :make CXX="g++ -w" ENABLE_OPTIMIZED=1<CR><CR> :lcd $PWD<CR> :cw<CR>
map <F10> :w<CR> :make CXX="g++ -w" ENABLE_OPTIMIZED=1<CR><CR> :lcd $PWD<CR> :cw<CR>

function! s:Saving_scroll(cmd)
  let save_scroll = &scroll
  execute 'normal! ' . a:cmd
  let &scroll = save_scroll
endfunction
nnoremap <C-J> :call <SID>Saving_scroll("1<C-V><C-D>")<CR>
vnoremap <C-J> <Esc>:call <SID>Saving_scroll("gv1<C-V><C-D>")<CR>
nnoremap <C-K> :call <SID>Saving_scroll("1<C-V><C-U>")<CR>
vnoremap <C-K> <Esc>:call <SID>Saving_scroll("gv1<C-V><C-U>")<CR>

" set color scheme
"colorscheme adventure

" enable syntax highlighting
syntax on

" insert spaces instead of tabs
set expandtab

" enable automatic indentation
set autoindent

" >> and << shift 4 spaces
set shiftwidth=2

" <tab> inserts 4 spaces
set tabstop=2

" keystrokes which may wrap around lines:
"   b          backspace
"   s          space
"   <,>,h,l    arrow keys
"   [,]        arrow keys in insert mode
set whichwrap=b,s,<,>,h,l,[,]

" shift+arrow enters visual selection mode
"set keymodel=startsel,stopsel

" when truncating the last line in a window, display @
" symbols at the end of the line, instead of one per line
set display=lastline

" show line numbers
set number

" turn on search highlighting
set hls

" change tabs with ctrl+j and ctrl+k
"map <c-j> gT
"map <c-k> gt

" standard key shortcuts for the system clipboard
vmap <c-x> "+ygvd
vmap <c-c> "+y
vmap <c-v> x"+p
nmap <c-v> "+p
imap <c-v> <C-O>"+p

" save (^\ exits visual mode)
inoremap <F12> <Space><BS><C-\><C-O>:update<CR>

let g:TabLineSet_closers='!'

"set tabline=%!MyTabLine()

function MyTabLine()

    let s = ''

    for i in range(tabpagenr('$'))

        " select the highlighting
        if i + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif

        " set the tab page number (for mouse clicks)
        let s .= '%' . (i + 1) . 'T'

        " the label is made by MyTabLabel()
        let s .= ' %{MyTabLabel(' . (i + 1) . ')} '

    endfor

    " after the last tab fill with TabLineFill and reset tab page nr
    let s .= '%#TabLineFill#%T'

    " right-align the label to close the current tab page
    if tabpagenr('$') > 1
        let s .= '%=%#TabLine#%999Xclose'
    endif

    return s

endfunction

function MyTabLabel(n)

    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    return bufname(buflist[winnr - 1])

endfunction

" Crap from Matt Luongo's vimrc, don't know what it does
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set mouse=a
set incsearch
let g:SuperTabDefaultCompletion='context'
let g:SuperTabRetainCompletionDuration=2

filetype on
filetype plugin on

map <silent> <C-t> <Esc>:tabnew<CR>
map <silent> <C-y> <Esc>:tabclose<CR>
map <M-Right> <Esc>:tabnext<CR>
map <M-Left> <Esc>:tabprevious<CR>
map <silent> <F4> <Esc>:NERDTreeToggle<CR>

function OnVimOpen()
silent NERDTree
wincmd p
endfunction

function OnBufferWinEnter()
silent NERDTreeMirror
wincmd p
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

