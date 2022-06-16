call g:AddPlug('morhetz/gruvbox')

let g:gruvbox_italic = '1'

function PostInitConfig()
    colorscheme gruvbox
endfunction


call g:AddPostInitConfig(PostInitConfig)
