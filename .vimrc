
let s:black = ["#1C1B19", 0]
let s:bright_black = ["#2D2C29", 8]
let s:hard_black = ['#080808', 232]
let s:gray_alt = ['#4E4E4E', 239]


set statusline=%F%m%r%h%w\ %y\ %2*ENC:%{&enc}%*\ ff:%{&ff}\ %2*fenc:%{&fenc}%*%=(%1*ch:%b\ hex:%B%*)\ col:%2c\ line:%2l/%L
set laststatus=2
hi User1 term=inverse,bold cterm=inverse,bold ctermfg=green
hi User2 term=inverse,bold cterm=inverse,bold ctermfg=red

set autoread                    
set autowrite                   
set browsedir=current           
set complete+=k                 


nmap <F7> :tabprevious<CR>
nmap <F8> :tabnext<CR>
nmap <F9> :tabnew<CR>:Explore<CR>


