function! neoformat#formatters#r#enabled() abort
    return ['formatR']
endfunction

function! neoformat#formatters#r#formatR() abort
    return {
        \ 'exe': 'R',
        \ 'args': ['--slave', '--no-restore', '--no-save', '-e "formatR::tidy_source(\"stdin\", arrow=FALSE)"', '2>/dev/null'],
        \ 'stdin': 1,
        \}
endfunction
