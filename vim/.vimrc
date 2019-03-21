set encoding=utf-8
syntax enable
" Visual utility settings.
set number

call plug#begin('~/.vim/plugged')

" snippets
Plug 'sirver/ultisnips'

" LaTeX editing
Plug 'lervag/vimtex'

" Initialize plugin system
call plug#end()


"vimtex stuff
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

"ultisnips stuff
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'