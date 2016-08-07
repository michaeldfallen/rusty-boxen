" Markdown writing support
setlocal expandtab
" map j gj 
" map k gk
setlocal spell spelllang=en_gb
set complete+=s
set formatprg=par
setlocal formatoptions=want

let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : '/home/michael/.vim/scripts/markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }

call lexical#init()
