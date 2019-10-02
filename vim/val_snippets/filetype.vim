" my filetype file
if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    au! BufRead,BufNewFile *.dhall   setfiletype dhall
    au! BufRead,BufNewFile *.dh      setfiletype dhall
augroup END
