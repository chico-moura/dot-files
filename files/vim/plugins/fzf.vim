call g:AddPlug('junegunn/fzf', {
    \'do': { -> fzf#install() } 
\})
call g:AddPlug('junegunn/fzf.vim')

nnoremap <TAB> :Files<CR>
