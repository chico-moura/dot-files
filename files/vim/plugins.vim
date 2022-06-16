let generics = [
    \'NERDTree',
    \'coc',
    \'vim-airline',
    \'auto-pairs',
    \'ultisnips'
\]

let colorschemes = ['gruvbox']

let go = [
    \'vim-go'
\]

let python = [
    \'coc-pyright'
\]


call g:Source('vim/plugins/', 
    \generics + 
    \colorschemes
\)

call plug#begin('~/.local/share/nvim/plugged')


for plugin in g:plugins
    Plug plugin.name, plugin.options
endfor

"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'dracula/vim'
"Plug 'preservim/nerdtree'
"Plug 'jiangmiao/auto-pairs'
"Plug 'SirVer/ultisnips'
"Plug 'morhetz/gruvbox'
"Plug 'preservim/nerdtree'

" Go
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }

" Python
Plug 'fannheyward/coc-pyright', { 'for': 'python' }

" HTML 
Plug 'mattn/emmet-vim', { 'for': [ 'html', 'css' ] }

" Typescipt 
Plug 'HerringtonDarkholme/yats.vim', { 'for': [ 'typescript', 'typescriptreact', ]}
Plug 'styled-components/vim-styled-components', { 'branch': 'main', 'for': [ 'typescript', 'typescriptreact' ]}
Plug 'prettier/vim-prettier', { 'for': [ 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'less', 'css', 'scss', 'json', 'graphql', 'markdown' ]}
Plug 'leafgarland/typescript-vim', {'for': [ 'typescript', 'typescriptreact' ]}

" React 
Plug 'MaxMEllon/vim-jsx-pretty', { 'for': [ 'javascriptreact', 'typescriptreact' ]}
Plug 'mlaursen/vim-react-snippets', { 'for': [ 'javascriptreact', 'typescriptreact' ]}
Plug 'peitalin/vim-jsx-typescript', {'for': [ 'javascriptreact', 'typescriptreact' ]}

" JSON
Plug 'neoclide/coc-json', { 'for': 'json' }

call plug#end()

call g:RunPostInitConfigs()



