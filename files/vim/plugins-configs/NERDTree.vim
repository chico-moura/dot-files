" open/close
nnoremap <F3> :NERDTreeToggle<CR> 

" tavigate through tabs
nnoremap <C-Left> :tabp<CR>
nnoremap <C-Right> :tabn<CR>
nnoremap <C-h> :tabp<CR>
nnoremap <C-l> :tabn<CR>

" exit vim if NERDTree is the only wiwndow rimaining in the only tab
autocmd BufEnter * 
    \if 
        \tabpagenr('$') == 1 && 
        \winnr('$') == 1 && 
        \exists('b:NERDTree') && 
        \b:Nerdtree.isTabTree()
            \| quit
    \endif
