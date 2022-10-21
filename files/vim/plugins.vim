let generics = [
    \'coc',
    \'vim-airline',
    \'NERDTree',
    \'vim-prettier',
\]

let colorschemes = ['gruvbox']

let go = [
    \'vim-go'
\]

let python = [
    \'coc-pyright'
\]

let html = [
    \'emmet-vim',
\]

let javascript = [
    \'vim-js',
\]

let typescript = [
    \'yats',
    \'vim-styled-components',
    \'typescript-vim',
\]

let react = [
    \'vim-jsx-pretty',
    \'vim-react-snippets',
    \'vim-jsx-typescript'
\]

let json = [
    \'coc-json',
\]


call g:Source('vim/plugins/', 
    \generics + 
    \colorschemes + 
    \go +
    \python +
    \html +
    \javascript +
    \typescript +
    \react
\)

call plug#begin('~/.local/share/nvim/plugged')


for plugin in g:plugins
    Plug plugin.name, plugin.options
endfor

call plug#end()

call g:RunPostInitConfigs()
