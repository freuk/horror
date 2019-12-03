function! neoformat#formatters#markdown#enabled() abort
   return ['remark', 'prettier', 'mmark']
endfunction

function! neoformat#formatters#markdown#prettier() abort
    return {
        \ 'exe': 'prettier',
        \ 'args': ['--stdin', '--stdin-filepath', '"%:p"'],
        \ 'stdin': 1,
        \ }
endfunction

function! neoformat#formatters#markdown#remark() abort
    return {
            \ 'exe': 'remark',
            \ 'args': ['--no-color', '--silent'],
            \ 'stdin': 1,
            \ }
endfunction

function! neoformat#formatters#markdown#mmark() abort
    return {
        \ 'exe': 'mmark',
        \ 'args': [ ],
        \ 'stdin': 1,
        \ }
endfunction
