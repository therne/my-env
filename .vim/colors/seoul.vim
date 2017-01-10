" "  _____             _ ___ ___ ___      "
" " |   __|___ ___ _ _| |_  |  _|  _|     "
" " |__   | -_| . | | | |  _|_  | . |     "
" " |_____|___|___|___|_|___|___|___|.vim "
"
" " Low-contrast dark Vim color scheme using Seoul Colors "
"
" File:         seoul256.vim
" URL:          github.com/junegunn/seoul256.vim
" Author:       Junegunn Choi (junegunn.c@gmail.com)
" Version:      1.5.3
" Last Updated: Aug 4, 2014
" License:      MIT
"
" Copyright (c) 2013 Junegunn Choi
"
" MIT License
"
" Permission is hereby granted, free of charge, to any person obtaining
" a copy of this software and associated documentation files (the
" "Software"), to deal in the Software without restriction, including
" without limitation the rights to use, copy, modify, merge, publish,
" distribute, sublicense, and/or sell copies of the Software, and to
" permit persons to whom the Software is furnished to do so, subject to
" the following conditions:
"
" The above copyright notice and this permission notice shall be
" included in all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
" EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
" MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
" NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
" LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
" OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
" WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

let s:background  = &background
let s:colors_name = get(g:, 'colors_name', '')

silent! unlet s:style s:seoul256_background

" 1. If g:seoul256_background is found
if exists('g:seoul256_background')
  let s:seoul256_background = g:seoul256_background
  if s:seoul256_background >= 0 && s:seoul256_background <= 239
    let s:style = 'dark'
  elseif s:seoul256_background >= 252 && s:seoul256_background <= 256
    let s:style = 'light'
  else
    unlet s:seoul256_background
  endif
endif

if !exists('s:style')
  " 2. If g:colors_name is NOT 'seoul256' -> dark version
  if s:colors_name != 'seoul256'
    let s:style = 'dark'
  " 3. Follow &background setting
  else
    let s:style = &background
  endif
endif
let s:style_idx = s:style == 'light'

" Background colors
if s:style == 'dark'
  let s:dark_bg  = get(s:, 'seoul256_background', 237)
  let s:light_bg = 253
else
  let s:dark_bg  = 237
  let s:light_bg = get(s:, 'seoul256_background', 253)
endif
let s:dark_bg_2 = 232
let s:light_bg_1 = min([s:light_bg + 1, 256])
let s:light_bg_2 = min([s:light_bg + 2, 256])

" Foreground colors
let s:dark_fg = 252
let s:light_fg = 239

function! s:hi(item, fg, bg)
  let fg = a:fg[s:style_idx] > 255 ? 231 : a:fg[s:style_idx]
  let bg = a:bg[s:style_idx] > 255 ? 231 : a:bg[s:style_idx]

  if !empty(fg)
    execute printf("highlight %s ctermfg=%s", a:item, fg)
  endif
  if !empty(bg)
    execute printf("highlight %s ctermbg=%s", a:item, bg)
  endif
endfunction

let s:gui = has('gui_running')
if !s:gui
  set t_Co=256
end

silent! unlet g:colors_name
hi clear
if exists("syntax_on")
  syntax reset
endif

call s:hi('Normal', [s:dark_fg, s:light_fg], [s:dark_bg, s:light_bg])

call s:hi('LineNr', [101, 101], [233, s:light_bg - 2])
call s:hi('Visual', ['', ''], [23, 152])
call s:hi('VisualNOS', ['', ''], [23, 152])

call s:hi('Comment', [65, 65], ['', ''])
call s:hi('Number', [222, 95], ['', ''])
call s:hi('Float', [222, 95], ['', ''])
call s:hi('Boolean', [103, 168], ['', ''])
call s:hi('String', [109, 30], ['', ''])
call s:hi('Constant', [73, 23], ['', ''])
call s:hi('Character', [174, 168], ['', ''])
call s:hi('Delimiter', [137, 94], ['', ''])
call s:hi('StringDelimiter', [137, 94], ['', ''])
call s:hi('Statement', [108, 66], ['', ''])
" case, default, etc.
" hi Label ctermfg=

" if else end
call s:hi('Conditional', [110, 31], ['', ''])

" while end
call s:hi('Repeat', [68, 67], ['', ''])
call s:hi('Todo', [161, 125], [s:dark_bg_2, s:light_bg_2])
call s:hi('Function', [187, 58], ['', ''])

" Macros
call s:hi('Define', [173, 131], ['', ''])
call s:hi('Macro', [173, 131], ['', ''])
call s:hi('Include', [173, 131], ['', ''])
call s:hi('PreCondit', [173, 131], ['', ''])


" #!
call s:hi('PreProc', [143, 58], ['', ''])

" @abc
call s:hi('Identifier', [217, 96], ['', ''])

" AAA Abc
call s:hi('Type', [179, 94], ['', ''])

" + - * / <<
call s:hi('Operator', [186, 131], ['', ''])

" super yield
call s:hi('Keyword', [168, 168], ['', ''])

" raise
call s:hi('Exception', [161, 161], ['', ''])
"
" hi StorageClass ctermfg=
call s:hi('Structure', [116, 23], ['', ''])
" hi Typedef ctermfg=

call s:hi('Error', [s:dark_fg, s:light_bg_1], [52, 174])
call s:hi('ErrorMsg', [s:dark_fg, s:light_bg_1], [52, 168])
call s:hi('Underlined', [181, 168], ['', ''])

" set textwidth=80
" set colorcolumn=+1
call s:hi('ColorColumn', ['', ''], [232, s:light_bg - 2])

" GVIM only
" hi Cursor ctermfg=
" hi CursorIM ctermfg=

" set cursorline cursorcolumn
call s:hi('CursorLine', ['', ''], [232, s:light_bg - 1])
call s:hi('CursorLineNr', [131, 131], [232, s:light_bg - 1])
call s:hi('CursorColumn', ['', ''], [232, s:light_bg - 1])

call s:hi('Directory', [187, 95], ['', ''])

call s:hi('DiffAdd',    ['NONE', 'NONE'], [22, 151])
call s:hi('DiffDelete', ['NONE', 'NONE'], [95, 181])
call s:hi('DiffChange', ['NONE', 'NONE'], [235, 189])
call s:hi('DiffText',   ['NONE', 'NONE'], [52, 224])

call s:hi('VertSplit', [s:dark_bg_2, s:light_bg - 3], [s:dark_bg_2, s:light_bg - 3])
call s:hi('Folded', [101, 101], [232, s:light_bg - 2])

" set foldcolumn=1
call s:hi('FoldColumn', [144, 94], [232, s:light_bg - 2])

call s:hi('MatchParen', ['', ''], [234, s:light_bg - 3])

" -- INSERT --
call s:hi('ModeMsg', [173, 173], ['', ''])

" let &showbreak = '> '
call s:hi('NonText', [101, 101], ['', ''])

call s:hi('MoreMsg', [173, 173], ['', ''])

" Popup menu
call s:hi('Pmenu', [233, 238], [224, 224])
call s:hi('PmenuSel', [s:dark_fg, s:dark_fg], [89, 89])
call s:hi('PmenuSbar', ['', ''], [65, 65])
call s:hi('PmenuThumb', ['', ''], [23, 23])

call s:hi('Search', [s:dark_fg, 255], [24, 74])
call s:hi('IncSearch', [220, 220], [233, 238])

" String delimiter, interpolation
call s:hi('Special', [216, 173], ['', ''])
" hi SpecialChar ctermfg=
" hi SpecialComment ctermfg=
" hi Tag ctermfg=
" hi Debug ctermfg=

" :map, listchars
call s:hi('SpecialKey', [59, 145], ['', ''])

if !s:gui
  " Red / Blue / Cyan / Magenta
  if s:style_idx == 0
    hi SpellBad   ctermbg=NONE cterm=underline ctermfg=168
    hi SpellCap   ctermbg=NONE cterm=underline ctermfg=110
    hi SpellLocal ctermbg=NONE cterm=underline ctermfg=153
    hi SpellRare  ctermbg=NONE cterm=underline ctermfg=218
  else
    hi SpellBad   ctermbg=NONE cterm=underline ctermfg=125
    hi SpellCap   ctermbg=NONE cterm=underline ctermfg=25
    hi SpellLocal ctermbg=NONE cterm=underline ctermfg=31
    hi SpellRare  ctermbg=NONE cterm=underline ctermfg=96
  endif
endif

"
call s:hi('StatusLine', [95, 95], [187, 187])
call s:hi('StatusLineNC', [233, s:light_bg - 2], [187, 238])
call s:hi('TabLineFill', [233, s:light_bg - 2], ['', ''])
call s:hi('TabLineSel', [187, 187], [23, 66])
call s:hi('TabLine', [235, s:light_bg - 12], [234, s:light_bg - 4])
call s:hi('WildMenu', [95, 95], [184, 184])

" :set all
call s:hi('Title', [181, 88], ['', ''])

" TODO
call s:hi('Question', [179, 88], ['', ''])

" Search hit bottom
call s:hi('WarningMsg', [179, 88], ['', ''])

" Sign column
call s:hi('SignColumn', [173, 173], [s:dark_bg, s:light_bg])

" Diff
call s:hi('diffAdded',   [108, 65], ['', ''])
call s:hi('diffRemoved', [174, 131], ['', ''])
hi link diffLine Constant

call s:hi('Conceal', [s:dark_fg + 2, s:light_fg - 2], [232, s:light_bg + 2])
call s:hi('Ignore',  [235, s:light_bg - 3], [s:dark_bg, s:light_bg])

"""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""

" vim-indent-guides
" -----------------
let g:indent_guides_auto_colors = 0
call s:hi('IndentGuidesOdd', ['', ''], [232, s:light_bg + 1])
call s:hi('IndentGuidesEven', ['', ''], [233, s:light_bg - 1])

" vim-gitgutter
" -------------
call s:hi('GitGutterAdd', [108, 65], ['', ''])
call s:hi('GitGutterChange', [68, 68], ['', ''])
call s:hi('GitGutterDelete', [161, 161], ['', ''])
call s:hi('GitGutterChangeDelete', [168, 168], ['', ''])

" http://vim.wikia.com/wiki/Highlight_unwanted_spaces     
" ---------------------------------------------------^^^^^
call s:hi('ExtraWhitespace', ['', ''], [232, s:light_bg - 2])

" vim-ruby
" --------
" " rubySymbol
let ruby_operators = 1
call s:hi('rubyClass', [31, 31], ['', ''])
" call s:hi('rubyInstanceVariable', [189, 189], ['', ''])
call s:hi('rubyRegexp', [186, 101], ['', ''])
call s:hi('rubyRegexpDelimiter', [168, 168], ['', ''])
call s:hi('rubyArrayDelimiter', [67, 38], ['', ''])
call s:hi('rubyBlockParameterList', [186, 94], ['', ''])
call s:hi('rubyCurlyBlockDelimiter', [144, 101], ['', ''])

" ARGV $stdout
call s:hi('rubyPredefinedIdentifier', [230, 52], ['', ''])
" hi rubyRegexpSpecial

hi CursorLine cterm=NONE
hi CursorLineNr cterm=NONE

let g:seoul256_current_fg = [s:dark_fg, s:light_fg][s:style_idx]
let g:seoul256_current_bg = [s:dark_bg, s:light_bg][s:style_idx]
let g:colors_name = 'seoul256'
if s:colors_name != g:colors_name || s:background == s:style
  let &background = s:style
else
  let &background = s:background
endif