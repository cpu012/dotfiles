set background=dark
hi clear
if exists('syntax_on')
    syntax reset
endif

let g:colors_name = 'c'
hi Todo cterm=bold ctermfg=9 ctermbg=None
hi Special ctermfg=11
hi SpecialKey ctermfg=3
hi Directory ctermfg=5
hi Title ctermfg=10 ctermbg=4
hi WildMenu ctermbg=4 ctermfg=9 cterm=Bold
hi NonText ctermfg=12 cterm=bold
hi StatusLine ctermbg=0 ctermfg=5
hi StatusLineNC ctermbg=0 ctermfg=5
hi VertSplit ctermfg=236
hi LineNr ctermbg=0 ctermfg=5 cterm=Bold
hi Comment ctermfg=7
hi cComment ctermfg=7
hi String ctermfg=2
hi Number ctermfg=11
hi Float ctermfg=11
hi Identifier ctermfg=6
hi cIdentifier ctermfg=6
hi Function  ctermfg=6
hi cFunction  ctermfg=6
hi Statement ctermfg=3 cterm=Bold
hi PreProc ctermfg=15
hi Type ctermfg=13
hi Boolean ctermfg=3 cterm=Bold
hi CursorLineNr ctermbg=235 ctermfg=11 cterm=None cterm=Bold
hi CursorLine ctermbg=235 cterm=None
hi ChangesSignTextAdd ctermbg=0 ctermfg=2 cterm=bold
hi ChangesSignTextDel ctermbg=0 ctermfg=1 cterm=bold
hi ChangesSignTextCh ctermbg=0 ctermfg=3 cterm=italic
hi Search cterm=None ctermbg=8
hi IncSearch cterm=None ctermbg=8 
hi MatchParen cterm=underline ctermbg=None
hi Visual ctermbg=8
hi Error ctermfg=9 cterm=underline ctermbg=None
hi ErrorMsg ctermfg=9 cterm=underline ctermbg=None
hi WarningMsg ctermfg=11 cterm=underline ctermbg=None
hi ALEError ctermfg=9 cterm=underline
hi ALEWarning ctermfg=11 cterm=underline
hi ALEErrorSign ctermbg=0 ctermfg=9 cterm=bold
hi ALEWarningSign ctermbg=0 ctermfg=11
hi Pmenu ctermfg=15 ctermbg=8
hi PmenuSel ctermbg=234 ctermfg=13
hi PmenuThumb ctermbg=0
hi PmenuSbar ctermbg=8
hi Folded ctermbg=236 ctermfg=12
hi ColorColumn ctermbg=238
