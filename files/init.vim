let g:DOT_FILES_DIR = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let g:PLUGIN_DIR = '~/.local/share/nvim/plugged'


function g:SourceFromDotFilesDir(directory, filename)
    execute 'source' g:DOT_FILES_DIR . '/' . a:directory . a:filename . '.vim'
endfunction


function g:Source(directory, fileNames)
    for filename in a:fileNames
        call SourceFromDotFilesDir(a:directory, filename)
    endfor
endfunction

call Source('vim/', [
    \'plugins',
    \'defaults',
\])
