let s:DOT_FILES_DIR = resolve(expand('%:p:h'))

function SourceFromVimDir(filename)
    execute 'source' s:DOT_FILES_DIR . '/vim/' . a:filename . '.vim'
endfunction

call SourceFromVimDir('init.backup')

