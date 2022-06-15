call plug#begin('~/.local/share/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-json'
Plug 'fannheyward/coc-pyright'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" HTML support
Plug 'mattn/emmet-vim'

" Typescipt support
Plug 'HerringtonDarkholme/yats.vim' 

" React support
Plug 'MaxMEllon/vim-jsx-pretty'

" Typescipt plugins
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'prettier/vim-prettier'

" React HTML snippets
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'

" .tsx highlighting
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

call plug#end()
