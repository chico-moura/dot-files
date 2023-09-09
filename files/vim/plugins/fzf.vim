call g:AddPlug('junegunn/fzf', {
    \'do': { -> fzf#install() } 
\})
call g:AddPlug('junegunn/fzf.vim')

nnoremap <TAB> :Files<CR>
let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git \) -prune -o -print'
