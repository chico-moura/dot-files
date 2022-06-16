let g:DOT_FILES_DIR = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let g:plugins = []
let g:postInitConfigs = []


function g:SourceFromDotFilesDir(directory, filename)
    execute 'source' g:DOT_FILES_DIR . '/' . a:directory . a:filename . '.vim'
endfunction


function g:Source(directory, fileNames)
    for filename in a:fileNames
        call SourceFromDotFilesDir(a:directory, filename)
    endfor
endfunction

function g:AddPlug(plugin, ...)
    let options = get(a:, 1, {})
    let plugin = {'name': a:plugin, 'options': options}
    call add(g:plugins, plugin)
endfunction

function AddPostInitConfig(config) 
    call add(g:postInitConfigs, a:config)
endfunction

function g:RunPostInitConfigs()
    for config in g:postInitConfigs
        execute config
    endfor
endfunction

call g:Source('vim/', [
    \'defaults',
    \'plugins',
\])

