call g:AddPlug('preservim/nerdtree')

" open/close
nnoremap <F3> :NERDTreeToggle <CR> 

" tavigate through tabs
nnoremap <C-Left> :tabp <CR>
nnoremap <C-Right> :tabn <CR>
nnoremap <C-h> :tabp <CR>
nnoremap <C-l> :tabn <CR>

" exit vim if NERDTree is the only wiwndow rimaining in the only tab
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" show hidden files (starting with .)
let NERDTreeShowHidden = 1

" ignore files and directories
let pycache_dir = '^__pycache__$'
let git_dir = '^.git$'

let NERDTreeIgnore = [pycache_dir, git_dir]
