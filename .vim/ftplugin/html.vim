setlocal textwidth=0
setlocal wrapmargin=0
setlocal spell

"
" SNIPPETS
"
nnoremap <leader>ar i<CR><ESC>:.-1read /home/ziviani/.vim/snippets/aref.html<CR>A<DEL><ESC>I<BS><ESC>f$ct"
nnoremap <leader>vr "adiWi<CR><ESC>:.-1read /home/ziviani/.vim/snippets/aref.html<CR>I<BS><ESC>A<DEL><ESC>F$hct<<ESC>"ap
nnoremap <leader>im a<CR><ESC>:.-1read /home/ziviani/.vim/snippets/img.html<CR>A<DEL><ESC>I<BS><ESC>f$ct"
nnoremap <leader>ir "adiWi<CR><ESC>:.-1read /home/ziviani/.vim/snippets/img.html<CR>j0i<BS><ESC>I<BS><ESC>/\$\$<CR>ct"<ESC>"ap
nnoremap <leader>pg i<p></p><ESC>4ha
nnoremap <leader>pr I<p><ESC>A</p><ESC>3hi
nnoremap <leader>ci bi<code class="prettyprint"><ESC>Ea</code>
nnoremap <leader>cd :.0read /home/ziviani/.vim/snippets/src.html<CR>I<BS><ESC>/\$/\$<CR>ct"
nnoremap <leader>nf /\$\$<CR>:nohl<CR>vlc
inoremap <F4> <ESC>/\$\$<CR>:nohl<CR>vlc
vnoremap <F4> <ESC>/\$\$<CR>:nohl<CR>vlc
nnoremap <F4> <ESC>/\$\$<CR>:nohl<CR>vlc
