set background=dark

syntax on

"colorscheme solarized
colorscheme twilight

set tabstop=3

set shiftwidth=3

set guifont=Monaco:h14

set smartindent
set autoindent
set cindent

set wildmode=list:longest
set antialias
set encoding=utf-8
set guioptions-=T
set lines=55 columns=180

"hide right scrollbar
set guioptions-=r
set number
set ruler
set numberwidth=5

set splitbelow
set splitright

nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

nmap <space> :

nmap ,v :e ~/.vimrc<cr>
nmap ,s :so ~/.vimrc<cr>
imap kj <esc>

nmap ,nt :NERDTreeToggle

au FileType php set ft=php.cakephp
"Break lines with CTRL J
nnoremap <NL> i<CR><ESC>

"Coda/Textmate-like text editing

"Move lines up & down
nmap <A-Up> ddkP
nmap <A-Down> ddp
"Multiple lines
vmap <A-Up> xkP`[V`]
vmap <A-Down> xp`[V`]

"Duplicate lines
nmap <C-A-Up> yyP
nmap <C-A-Down> yyp

vmap <C-A-Up> yp`[V`]
vmap <C-A-Down> yp`[V`]

"To do automatic Tabularize
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
 
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

let mapleader = ","

"Nice maps from Jrom
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

