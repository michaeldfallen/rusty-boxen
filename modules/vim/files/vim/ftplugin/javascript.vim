let s:eslint_path = system('PATH=$(npm bin):$PATH && ( which eslint_d )')
let b:syntastic_javascript_eslint_exec = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
