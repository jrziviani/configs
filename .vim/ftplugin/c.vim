"
" CSCOPE
"
function! LoadCscope()
    let db = findfile("cscope.out", ".;")
    if (!empty(db))
        let path = strpart(db, 0, match(db, "/cscope.out$"))
        set nocscopeverbose " suppress 'duplicate connection' error
        exe "cs add " . db . " " . path
        set cscopeverbose
        " else add the database pointed to by environment variable 
    elseif $CSCOPE_DB != "" 
        cs add $CSCOPE_DB
    endif
endfunction

"
" CTAGS/CSCOPE Update
"
function! RefUpdate()
    echon "Updating ctags and cscope..."
    "silent !ctags --exclude=.git --exclude=build --append --extra=+f -R .
    "silent !cscope -Rb
    silent cscope reset
    echon "done"
endfunction

au BufEnter /* call LoadCscope()
nnoremap <leader>l :cscope find c <cword><CR>
nnoremap <leader>r :!ctags --exclude=.git --exclude=build --append --extra=+f -R .<CR>:!cscope -Rb<CR>:call RefUpdate()<CR>
