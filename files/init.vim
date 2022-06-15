let s:DOT_FILES_DIR = resolve(expand('%:p:h'))

function SourceFromVimDir(filename)
    execute 'source' s:DOT_FILES_DIR . '/vim/' . a:filename . '.vim'
endfunction


function SourceMany(...)
    for filename in a:000
        call SourceFromVimDir(filename)
    endfor
endfunction

call SourceMany(
            \'init.backup', 
            \'plugins',
            \'defaults')
