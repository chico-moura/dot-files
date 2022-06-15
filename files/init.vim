let g:DOT_FILES_DIR = fnamemodify(resolve(expand('<sfile>:p')), ':h')


function g:SourceFromDotFilesDir(directory, filename)
    execute 'source' g:DOT_FILES_DIR . '/' . a:directory . a:filename 
endfunction


function g:SourceMany(directory, ...)
    for filename in a:000
        call SourceFromDotFilesDir(a:directory, filename)
    endfor
endfunction

call SourceMany(
        \'vim/',
        \'plugins.vim',
	\'defaults.vim'
\)
