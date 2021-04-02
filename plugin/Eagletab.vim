
inoremap ' <C-R>=Quote()<CR>
inoremap " <C-R>=Quotes()<CR>
inoremap { <C-R>=Opening_bracket()<CR>
inoremap ( <C-R>=Round_brackets()<CR>
inoremap [ <C-R>=Square_bracket()<CR>
inoremap < <C-R>=Angle_bracket()<CR>

function! Quote()
	if getline('.')[col('.') - 1] =~ '\S'
		return "'"
	else 
		return "''\<ESC>i"
    endif
endfunction
function! Quotes()
	if getline('.')[col('.') - 1] =~ '\S'
		return "\""
	else 
		return "\"\"\<ESC>i"
    endif
endfunction
function! Opening_bracket()
	if getline('.')[col('.') - 1] =~ '\S'
		return "{"
	else 
		return "{}\<ESC>i"
    endif
endfunction
function! Round_brackets()
	if getline('.')[col('.') - 1] =~ '\S'
		return "("
	else 
		return "()\<ESC>i"
    endif
endfunction
function! Square_bracket()
	if getline('.')[col('.') - 1] =~ '\S'
		return "["
	else 
		return "[]\<ESC>i"
    endif
endfunction
function! Angle_bracket()
	if getline('.')[col('.') - 1] =~ '\S'
		return "<"
	else 
		return "<>\<ESC>i"
    endif
endfunction

"默认:complete=.,w,b,u,t,i
set complete=.
	
function! CleverTab()
	if getline('.')[col('.') - 2] =~ '\w'
		return "\<C-N>"
	elseif getline('.')[col('.') - 2] =~ '\/'
		return "\<C-X>\<C-F>"
	else
		return "\<Tab>"
    endif
endfunction

function! Lelf_dir()
	execute "normal! dF/a/"
	return "\<right>\<C-X>\<C-F>"
endfunction
function! CleverSTab()
	return "\<right>"
endfunction

inoremap <S-Tab> <C-R>=CleverSTab()<CR>
inoremap <expr> <Tab> pumvisible()?"\<C-E>":"\<C-R>=CleverTab()\<CR>"
inoremap <expr> j pumvisible()?"\<C-n>":"j"
inoremap <expr> k pumvisible()?"\<C-p>":"k"
inoremap <expr> l pumvisible()?"\<C-X>\<C-F>":"l"
inoremap <expr> h pumvisible()?"\<C-E>\<C-R>=Lelf_dir()\<CR>":"h"
inoremap <expr> <CR> pumvisible()?"\<C-Y>":"\<CR>"

"inoremap <expr> <C-J>      pumvisible()?"\<PageDown>\<C-N>\<C-P>":"\<C-X><C-O>"
"inoremap <expr> <C-K>      pumvisible()?"\<PageUp>\<C-P>\<C-N>":"\<C-K>"
"inoremap <expr> <C-U>      pumvisible()?"\<C-E>":"\<C-U>"
"上面的映射都是在插入模式下的映射，解释如下：
"- 如果下拉菜单弹出，回车映射为接受当前所选项目，否则，仍映射为回车；
"- 如果下拉菜单弹出，CTRL-J映射为在下拉菜单中向下翻页。否则映射为CTRL-X CTRL-O；
"- 如果下拉菜单弹出，CTRL-K映射为在下拉菜单中向上翻页，否则仍映射为CTRL-K；
"- 如果下拉菜单弹出，CTRL-U映射为CTRL-E，即停止补全，否则，仍映射为CTRL-U；
"
"
"
"
"fun! Redraw()
"  let l = winline()
"  let cmd = l * 2 <= winheight(0) + 1 ? l <= (&so + 1) ? 'zb' : 'zt' : 'zz'
"  return cmd
"endf
"
"nnoremap <expr> xxxxxxxx Redraw()

