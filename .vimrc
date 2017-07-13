
function MyTabLine()
	let tabline = ''
	for i in range(tabpagenr('$'))
		if i + 1 == tabpagenr()
			let tabline .= '%#TabLineSel#'
		else
			let tabline .= '%#TabLine#'
		endif

		let tabline .= '%' . (i + 1) . 'T'

		let tabline .= ' %{MyTabLabel(' . (i + 1) . ')} |'
	endfor
	let tabline .= '%#TabLineFill#%T'
	if tabpagenr('$') > 1
		let tabline .= '%=%#TabLine#%999XX'
	endif
	return tabline
endfunction

function MyTabLabel(n)
	let label = ''
	let buflist = tabpagebuflist(a:n)
	let label =  pathshorten(bufname(buflist[tabpagewinnr(a:n) - 1]))
	if label == ''
		let label = '[No Name]'
	endif
	let label .= ' (' . a:n . ')'
	for i in range(len(buflist))
		if getbufvar(buflist[i], "&modified")
			let label = '[+] ' . label
			break
		endif
	endfor
	return label
endfunction

function MyGuiTabLabel()
	return '%{MyTabLabel(' . tabpagenr() . ')}'
endfunction

set nocompatible

let s:black = ["#1C1B19", 0]
let s:bright_black = ["#2D2C29", 8]
let s:hard_black = ['#080808', 232]
let s:gray_alt = ['#4E4E4E', 239]


set statusline=%F%m%r%h%w\ %y\ %2*ENC:%{&enc}%*\ ff:%{&ff}\ %2*fenc:%{&fenc}%*%=(%1*ch:%b\ hex:%B%*)\ col:%2c\ line:%2l/%L
set laststatus=2

" ctermbg : Background color in console
" guibg : Background color in Gvim
" ctermfg : Text color in console
" guifg : Text color in Gvim
" gui : Font formatting in Gvim
" term : Font formatting in console (for example, bold)

hi User1 term=inverse,bold cterm=inverse,bold ctermfg=green
hi User2 term=inverse,bold cterm=inverse,bold ctermfg=red

set autoread                    
set autowrite                   
set browsedir=current           
set complete+=k                 
set tabline=%!MyTabLine()

imap <F2> <esc>:w<CR>a
map <F2> <esc>:w<CR>
imap <F3> <esc>v
nmap <F3> v
imap <F5> <esc>:tabprevious<CR>a
map <F5> <esc>:tabprevious<CR>
imap <F6> <esc>:tabnext<CR>a
map <F6> <esc>:tabnext<CR>
imap <F7> <esc>:tabnew<CR>a
map <F7> <esc>:tabnew<CR>
imap <F7><F7> <esc>:tabnew<CR>:Explore<CR>
map <F7><F7> <esc>:tabnew<CR>:Explore<CR>
imap <C-\> <esc>:vs<CR>a
map <C-\> :vs<CR>

"Window commands
"<C-w>+
"<C-w>-
"<C-w>> 
"<C-w>< 

":map for the Normal, Insert, Visual and Command-line
":imap for Insert only
":cmap for Command-line only
":nmap for Normal only
":vmap for Visual only




