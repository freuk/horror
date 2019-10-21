" fahrenheit.vim -- Vim color scheme.
" Author:      fcpg (n/a)
" Webpage:     https://github.com/fcpg
" Description: Dark, warm base16 theme for 256-color terminals

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "fahrenheit"

if &t_Co >= 256 || has("gui_running")
    hi Normal ctermbg=16 ctermfg=231 cterm=NONE guibg=#000000 guifg=#ffffff gui=NONE
    set background=dark
    hi NonText ctermbg=NONE ctermfg=88 cterm=NONE guibg=NONE guifg=#870000 gui=NONE
    hi Comment ctermbg=NONE ctermfg=95 cterm=NONE guibg=NONE guifg=#875f5f gui=NONE
    hi Constant ctermbg=NONE ctermfg=231 cterm=NONE guibg=NONE guifg=#ffffff gui=NONE
    hi Error ctermbg=88 ctermfg=230 cterm=NONE guibg=#870000 guifg=#ffffd7 gui=NONE
    hi Identifier ctermbg=NONE ctermfg=248 cterm=NONE guibg=NONE guifg=#a8a8a8 gui=NONE
    hi Ignore ctermbg=NONE ctermfg=95 cterm=NONE guibg=NONE guifg=#875f5f gui=NONE
    hi PreProc ctermbg=NONE ctermfg=215 cterm=NONE guibg=NONE guifg=#ffaf5f gui=NONE
    hi Special ctermbg=NONE ctermfg=215 cterm=NONE guibg=NONE guifg=#ffaf5f gui=NONE
    hi Statement ctermbg=NONE ctermfg=166 cterm=NONE guibg=NONE guifg=#d75f00 gui=NONE
    hi String ctermbg=NONE ctermfg=180 cterm=NONE guibg=NONE guifg=#d7af87 gui=NONE
    hi Number ctermbg=NONE ctermfg=67 cterm=NONE guibg=NONE guifg=#5f87af gui=NONE
    hi Todo ctermbg=NONE ctermfg=231 cterm=bold guibg=NONE guifg=#ffffff gui=bold
    hi Type ctermbg=NONE ctermfg=223 cterm=NONE guibg=NONE guifg=#ffd7af gui=NONE
    hi! link Character Constant
    hi! link Float Number
    hi! link Conditional Statement
    hi! link Repeat Statement
    hi! link Label Statement
    hi! link Keyword Statement
    hi! link Exception Statement
    hi! link Include PreProc
    hi! link Define PreProc
    hi! link Macro PreProc
    hi! link PreCondit PreProc
    hi! link StorageClass Type
    hi! link Structure Type
    hi! link Typedef Type
    hi! link Tag Special
    hi! link SpecialChar Special
    hi! link SpecialComment Special
    hi! link Debug Special
    hi Underlined ctermbg=235 ctermfg=221 cterm=NONE guibg=#262626 guifg=#ffd75f gui=NONE
    hi StatusLine ctermbg=NONE ctermfg=173 cterm=NONE guibg=NONE guifg=#d7875f gui=NONE
    hi StatusLineNC ctermbg=NONE ctermfg=235 cterm=NONE guibg=NONE guifg=#262626 gui=NONE
    hi! link StatusLineTerm StatusLine
    hi! link StatusLineTermNC StatusLineNC
    hi VertSplit ctermbg=NONE ctermfg=235 cterm=NONE guibg=NONE guifg=#262626 gui=NONE
    hi TabLine ctermbg=NONE ctermfg=95 cterm=NONE guibg=NONE guifg=#875f5f gui=NONE
    hi TabLineFill ctermbg=235 ctermfg=231 cterm=NONE guibg=#262626 guifg=#ffffff gui=NONE
    hi TabLineSel ctermbg=NONE ctermfg=221 cterm=NONE guibg=NONE guifg=#ffd75f gui=NONE
    hi Title ctermbg=NONE ctermfg=230 cterm=bold guibg=NONE guifg=#ffffd7 gui=bold
    hi CursorLine ctermbg=235 ctermfg=NONE cterm=NONE guibg=#262626 guifg=NONE gui=NONE
    hi LineNr ctermbg=NONE ctermfg=137 cterm=NONE guibg=NONE guifg=#af875f gui=NONE
    hi CursorLineNr ctermbg=NONE ctermfg=223 cterm=NONE guibg=NONE guifg=#ffd7af gui=NONE
    hi qfLineNr ctermbg=NONE ctermfg=95 cterm=NONE guibg=NONE guifg=#875f5f gui=NONE
    hi helpLeadBlank ctermbg=NONE ctermfg=231 cterm=NONE guibg=NONE guifg=#ffffff gui=NONE
    hi helpNormal ctermbg=NONE ctermfg=231 cterm=NONE guibg=NONE guifg=#ffffff gui=NONE
    hi Visual ctermbg=215 ctermfg=16 cterm=NONE guibg=#ffaf5f guifg=#000000 gui=NONE
    hi VisualNOS ctermbg=NONE ctermfg=231 cterm=NONE guibg=NONE guifg=#ffffff gui=NONE
    hi Pmenu ctermbg=235 ctermfg=248 cterm=NONE guibg=#262626 guifg=#a8a8a8 gui=NONE
    hi PmenuSbar ctermbg=NONE ctermfg=231 cterm=NONE guibg=NONE guifg=#ffffff gui=NONE
    hi PmenuSel ctermbg=235 ctermfg=221 cterm=NONE guibg=#262626 guifg=#ffd75f gui=NONE
    hi PmenuThumb ctermbg=NONE ctermfg=231 cterm=NONE guibg=NONE guifg=#ffffff gui=NONE
    hi FoldColumn ctermbg=NONE ctermfg=235 cterm=NONE guibg=NONE guifg=#262626 gui=NONE
    hi Folded ctermbg=NONE ctermfg=95 cterm=NONE guibg=NONE guifg=#875f5f gui=NONE
    hi WildMenu ctermbg=NONE ctermfg=221 cterm=NONE guibg=NONE guifg=#ffd75f gui=NONE
    hi SpecialKey ctermbg=NONE ctermfg=67 cterm=NONE guibg=NONE guifg=#5f87af gui=NONE
    hi DiffAdd ctermbg=235 ctermfg=230 cterm=NONE guibg=#262626 guifg=#ffffd7 gui=NONE
    hi DiffChange ctermbg=235 ctermfg=248 cterm=NONE guibg=#262626 guifg=#a8a8a8 gui=NONE
    hi DiffDelete ctermbg=NONE ctermfg=88 cterm=NONE guibg=NONE guifg=#870000 gui=NONE
    hi DiffText ctermbg=235 ctermfg=173 cterm=NONE guibg=#262626 guifg=#d7875f gui=NONE
    hi IncSearch ctermbg=166 ctermfg=16 cterm=NONE guibg=#d75f00 guifg=#000000 gui=NONE
    hi Search ctermbg=180 ctermfg=16 cterm=NONE guibg=#d7af87 guifg=#000000 gui=NONE
    hi! link QuickFixLine Search
    hi Directory ctermbg=NONE ctermfg=231 cterm=NONE guibg=NONE guifg=#ffffff gui=NONE
    hi MatchParen ctermbg=95 ctermfg=221 cterm=bold guibg=#875f5f guifg=#ffd75f gui=bold
    hi SpellBad ctermbg=NONE ctermfg=88 cterm=NONE guibg=NONE guifg=#870000 gui=NONE guisp=#870000
    hi SpellCap ctermbg=NONE ctermfg=221 cterm=NONE guibg=NONE guifg=#ffd75f gui=NONE guisp=#ffd75f
    hi SpellLocal ctermbg=NONE ctermfg=88 cterm=NONE guibg=NONE guifg=#870000 gui=NONE guisp=#870000
    hi SpellRare ctermbg=NONE ctermfg=180 cterm=NONE guibg=NONE guifg=#d7af87 gui=NONE guisp=#d7af87
    hi ColorColumn ctermbg=NONE ctermfg=235 cterm=NONE guibg=NONE guifg=#262626 gui=NONE
    hi signColumn ctermbg=NONE ctermfg=230 cterm=NONE guibg=NONE guifg=#ffffd7 gui=NONE
    hi ErrorMsg ctermbg=88 ctermfg=231 cterm=NONE guibg=#870000 guifg=#ffffff gui=NONE
    hi ModeMsg ctermbg=NONE ctermfg=221 cterm=NONE guibg=NONE guifg=#ffd75f gui=NONE
    hi MoreMsg ctermbg=NONE ctermfg=221 cterm=NONE guibg=NONE guifg=#ffd75f gui=NONE
    hi Question ctermbg=NONE ctermfg=230 cterm=NONE guibg=NONE guifg=#ffffd7 gui=NONE
    hi WarningMsg ctermbg=NONE ctermfg=221 cterm=NONE guibg=NONE guifg=#ffd75f gui=NONE
    hi Cursor ctermbg=166 ctermfg=16 cterm=NONE guibg=#d75f00 guifg=#000000 gui=NONE
    hi CursorColumn ctermbg=235 ctermfg=NONE cterm=NONE guibg=#262626 guifg=NONE gui=NONE
    hi Function ctermbg=NONE ctermfg=222 cterm=NONE guibg=NONE guifg=#ffd787 gui=NONE
    hi Operator ctermbg=NONE ctermfg=173 cterm=NONE guibg=NONE guifg=#d7875f gui=NONE
    hi Delimiter ctermbg=NONE ctermfg=173 cterm=NONE guibg=NONE guifg=#d7875f gui=NONE
    hi Boolean ctermbg=NONE ctermfg=67 cterm=NONE guibg=NONE guifg=#5f87af gui=NONE
    hi VimIsCommand ctermbg=NONE ctermfg=173 cterm=NONE guibg=NONE guifg=#d7875f gui=NONE
    hi VimFunction ctermbg=NONE ctermfg=231 cterm=bold guibg=NONE guifg=#ffffff gui=bold
    hi! link VimFuncKey VimCommand
    hi! link VimSubstPat VimString
    hi VimSubstRep4 ctermbg=235 ctermfg=180 cterm=NONE guibg=#262626 guifg=#d7af87 gui=NONE
    hi VimMapLhs ctermbg=235 ctermfg=231 cterm=NONE guibg=#262626 guifg=#ffffff gui=NONE
    hi javaScriptObjectKey ctermbg=NONE ctermfg=215 cterm=NONE guibg=NONE guifg=#ffaf5f gui=NONE
    hi javaScriptFunctionKey ctermbg=NONE ctermfg=88 cterm=NONE guibg=NONE guifg=#870000 gui=NONE
    hi htmlItalic ctermbg=NONE ctermfg=173 cterm=NONE guibg=NONE guifg=#d7875f gui=NONE
    hi markdownLinkTextDelimiter ctermbg=NONE ctermfg=173 cterm=NONE guibg=NONE guifg=#d7875f gui=NONE
    hi markdownLinkDelimiter ctermbg=NONE ctermfg=95 cterm=NONE guibg=NONE guifg=#875f5f gui=NONE
    hi markdownUrl ctermbg=NONE ctermfg=95 cterm=NONE guibg=NONE guifg=#875f5f gui=NONE
    hi markdownCodeBlock ctermbg=NONE ctermfg=180 cterm=NONE guibg=NONE guifg=#d7af87 gui=NONE
    hi markdownCode ctermbg=NONE ctermfg=180 cterm=NONE guibg=NONE guifg=#d7af87 gui=NONE
    hi manOptionDesc ctermbg=NONE ctermfg=221 cterm=NONE guibg=NONE guifg=#ffd75f gui=NONE
    hi manLongOptionDesc ctermbg=NONE ctermfg=215 cterm=NONE guibg=NONE guifg=#ffaf5f gui=NONE
    hi CtrlPNoEntries ctermbg=NONE ctermfg=88 cterm=NONE guibg=NONE guifg=#870000 gui=NONE
    hi CtrlPMatch ctermbg=NONE ctermfg=221 cterm=NONE guibg=NONE guifg=#ffd75f gui=NONE
    hi CtrlPLinePre ctermbg=NONE ctermfg=95 cterm=NONE guibg=NONE guifg=#875f5f gui=NONE
    hi CtrlPPrtBase ctermbg=NONE ctermfg=95 cterm=NONE guibg=NONE guifg=#875f5f gui=NONE
    hi CtrlPPrtText ctermbg=NONE ctermfg=231 cterm=NONE guibg=NONE guifg=#ffffff gui=NONE
    hi CtrlPPtrCursor ctermbg=NONE ctermfg=166 cterm=NONE guibg=NONE guifg=#d75f00 gui=NONE
    hi CtrlPBufferInd ctermbg=NONE ctermfg=223 cterm=NONE guibg=NONE guifg=#ffd7af gui=NONE
    hi CtrlPBufferVis ctermbg=NONE ctermfg=215 cterm=NONE guibg=NONE guifg=#ffaf5f gui=NONE
    hi CtrlPBufferNr ctermbg=NONE ctermfg=67 cterm=NONE guibg=NONE guifg=#5f87af gui=NONE
elseif &t_Co == 8 || $TERM !~# '^linux' || &t_Co == 16
    set t_Co=16
    hi Normal ctermbg=black ctermfg=white cterm=NONE
    set background=dark
    hi NonText ctermbg=NONE ctermfg=darkred cterm=NONE
    hi Comment ctermbg=NONE ctermfg=darkmagenta cterm=NONE
    hi Constant ctermbg=NONE ctermfg=white cterm=NONE
    hi Error ctermbg=darkred ctermfg=white cterm=NONE
    hi Identifier ctermbg=NONE ctermfg=gray cterm=NONE
    hi Ignore ctermbg=NONE ctermfg=darkmagenta cterm=NONE
    hi PreProc ctermbg=NONE ctermfg=darkyellow cterm=NONE
    hi Special ctermbg=NONE ctermfg=darkyellow cterm=NONE
    hi Statement ctermbg=NONE ctermfg=red cterm=NONE
    hi String ctermbg=NONE ctermfg=darkyellow cterm=NONE
    hi Number ctermbg=NONE ctermfg=blue cterm=NONE
    hi Todo ctermbg=NONE ctermfg=white cterm=bold
    hi Type ctermbg=NONE ctermfg=white cterm=NONE
    hi link Character Constant
    hi link Float Number
    hi link Conditional Statement
    hi link Repeat Statement
    hi link Label Statement
    hi link Keyword Statement
    hi link Exception Statement
    hi link Include PreProc
    hi link Define PreProc
    hi link Macro PreProc
    hi link PreCondit PreProc
    hi link StorageClass Type
    hi link Structure Type
    hi link Typedef Type
    hi link Tag Special
    hi link SpecialChar Special
    hi link SpecialComment Special
    hi link Debug Special
    hi Underlined ctermbg=darkgray ctermfg=yellow cterm=NONE
    hi StatusLine ctermbg=NONE ctermfg=darkyellow cterm=NONE
    hi StatusLineNC ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi link StatusLineTerm StatusLine
    hi link StatusLineTermNC StatusLineNC
    hi VertSplit ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi TabLine ctermbg=NONE ctermfg=darkmagenta cterm=NONE
    hi TabLineFill ctermbg=darkgray ctermfg=white cterm=NONE
    hi TabLineSel ctermbg=NONE ctermfg=yellow cterm=NONE
    hi Title ctermbg=NONE ctermfg=white cterm=bold
    hi CursorLine ctermbg=darkgray ctermfg=NONE cterm=NONE
    hi LineNr ctermbg=NONE ctermfg=darkyellow cterm=NONE
    hi CursorLineNr ctermbg=NONE ctermfg=white cterm=NONE
    hi qfLineNr ctermbg=NONE ctermfg=darkmagenta cterm=NONE
    hi helpLeadBlank ctermbg=NONE ctermfg=white cterm=NONE
    hi helpNormal ctermbg=NONE ctermfg=white cterm=NONE
    hi Visual ctermbg=darkyellow ctermfg=black cterm=NONE
    hi VisualNOS ctermbg=NONE ctermfg=white cterm=NONE
    hi Pmenu ctermbg=darkgray ctermfg=gray cterm=NONE
    hi PmenuSbar ctermbg=NONE ctermfg=white cterm=NONE
    hi PmenuSel ctermbg=darkgray ctermfg=yellow cterm=NONE
    hi PmenuThumb ctermbg=NONE ctermfg=white cterm=NONE
    hi FoldColumn ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi Folded ctermbg=NONE ctermfg=darkmagenta cterm=NONE
    hi WildMenu ctermbg=NONE ctermfg=yellow cterm=NONE
    hi SpecialKey ctermbg=NONE ctermfg=blue cterm=NONE
    hi DiffAdd ctermbg=darkgray ctermfg=white cterm=NONE
    hi DiffChange ctermbg=darkgray ctermfg=gray cterm=NONE
    hi DiffDelete ctermbg=NONE ctermfg=darkred cterm=NONE
    hi DiffText ctermbg=darkgray ctermfg=darkyellow cterm=NONE
    hi IncSearch ctermbg=red ctermfg=black cterm=NONE
    hi Search ctermbg=darkyellow ctermfg=black cterm=NONE
    hi link QuickFixLine Search
    hi Directory ctermbg=NONE ctermfg=white cterm=NONE
    hi MatchParen ctermbg=darkmagenta ctermfg=yellow cterm=bold
    hi SpellBad ctermbg=NONE ctermfg=darkred cterm=NONE
    hi SpellCap ctermbg=NONE ctermfg=yellow cterm=NONE
    hi SpellLocal ctermbg=NONE ctermfg=darkred cterm=NONE
    hi SpellRare ctermbg=NONE ctermfg=darkyellow cterm=NONE
    hi ColorColumn ctermbg=NONE ctermfg=darkgray cterm=NONE
    hi signColumn ctermbg=NONE ctermfg=white cterm=NONE
    hi ErrorMsg ctermbg=darkred ctermfg=white cterm=NONE
    hi ModeMsg ctermbg=NONE ctermfg=yellow cterm=NONE
    hi MoreMsg ctermbg=NONE ctermfg=yellow cterm=NONE
    hi Question ctermbg=NONE ctermfg=white cterm=NONE
    hi WarningMsg ctermbg=NONE ctermfg=yellow cterm=NONE
    hi Cursor ctermbg=red ctermfg=black cterm=NONE
    hi CursorColumn ctermbg=darkgray ctermfg=NONE cterm=NONE
    hi Function ctermbg=NONE ctermfg=yellow cterm=NONE
    hi Operator ctermbg=NONE ctermfg=darkyellow cterm=NONE
    hi Delimiter ctermbg=NONE ctermfg=darkyellow cterm=NONE
    hi Boolean ctermbg=NONE ctermfg=blue cterm=NONE
    hi VimIsCommand ctermbg=NONE ctermfg=darkyellow cterm=NONE
    hi VimFunction ctermbg=NONE ctermfg=white cterm=bold
    hi link VimFuncKey VimCommand
    hi link VimSubstPat VimString
    hi VimSubstRep4 ctermbg=darkgray ctermfg=darkyellow cterm=NONE
    hi VimMapLhs ctermbg=darkgray ctermfg=white cterm=NONE
    hi javaScriptObjectKey ctermbg=NONE ctermfg=darkyellow cterm=NONE
    hi javaScriptFunctionKey ctermbg=NONE ctermfg=darkred cterm=NONE
    hi htmlItalic ctermbg=NONE ctermfg=darkyellow cterm=NONE
    hi markdownLinkTextDelimiter ctermbg=NONE ctermfg=darkyellow cterm=NONE
    hi markdownLinkDelimiter ctermbg=NONE ctermfg=darkmagenta cterm=NONE
    hi markdownUrl ctermbg=NONE ctermfg=darkmagenta cterm=NONE
    hi markdownCodeBlock ctermbg=NONE ctermfg=darkyellow cterm=NONE
    hi markdownCode ctermbg=NONE ctermfg=darkyellow cterm=NONE
    hi manOptionDesc ctermbg=NONE ctermfg=yellow cterm=NONE
    hi manLongOptionDesc ctermbg=NONE ctermfg=darkyellow cterm=NONE
    hi CtrlPNoEntries ctermbg=NONE ctermfg=darkred cterm=NONE
    hi CtrlPMatch ctermbg=NONE ctermfg=yellow cterm=NONE
    hi CtrlPLinePre ctermbg=NONE ctermfg=darkmagenta cterm=NONE
    hi CtrlPPrtBase ctermbg=NONE ctermfg=darkmagenta cterm=NONE
    hi CtrlPPrtText ctermbg=NONE ctermfg=white cterm=NONE
    hi CtrlPPtrCursor ctermbg=NONE ctermfg=red cterm=NONE
    hi CtrlPBufferInd ctermbg=NONE ctermfg=white cterm=NONE
    hi CtrlPBufferVis ctermbg=NONE ctermfg=darkyellow cterm=NONE
    hi CtrlPBufferNr ctermbg=NONE ctermfg=blue cterm=NONE
endif

" Generated with RNB (https://gist.github.com/romainl/5cd2f4ec222805f49eca)
