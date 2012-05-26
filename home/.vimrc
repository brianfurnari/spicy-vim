""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:   Kevin S Kirkup
" LastChanged:  Feb 28 2005
" Website:      None
""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
source $VIMRUNTIME/vimrc_example.vim

""""""""""""""""""""""""""""""""""""""""""""""""""
" Source local configuration settings
""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif

""""""""""""""""""""""""""""""""""""""""""""""""""
" Set the default color scheme
""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme kevin2
syntax enable

""""""""""""""""""""""""""""""""""""""""""""""""""
" Author Customization
" for Snipmate
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:snips_author =  "Kevin S Kirkup"
let g:snips_email =  "kevin.kirkup@gmail.com"

""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable spell check
""""""""""""""""""""""""""""""""""""""""""""""""""
set spelllang=en_us
set spell

""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable omnicomplete
""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
        \ if &omnifunc == "" |
        \   setlocal omnifunc=syntaxcomplete#Complete |
        \ endif
endif


""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerd Commenter Settings
""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDRemoveAltComs=0
let NERDSpaceDelims=1

""""""""""""""""""""""""""""""""""""""""""""""""""
" Set the map leader character
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mapleader = '\'

"if !exists("g:mapleader")
"  echo "  <leader> = '\'"
"else
"  echo "  <leader> = " . g:mapleader
"endif

""""""""""""""""""""""""""""""""""""""""""""""""""
" Change the default windows size
""""""""""""""""""""""""""""""""""""""""""""""""""
"set lines=60
"set columns=200

""""""""""""""""""""""""""""""""""""""""""""""""""
" Shows 2 lines between the cursor and the new line
" when scrolling using the z. and z- commands
""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=2

""""""""""""""""""""""""""""""""""""""""""""""""""
" Set the default indentation attributes
""""""""""""""""""""""""""""""""""""""""""""""""""
set cindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab

""""""""""""""""""""""""""""""""""""""""""""""""""
" Some backup settings
""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
"set patchmode=.org


""""""""""""""""""""""""""""""""""""""""""""""""""
" Some programming settings
""""""""""""""""""""""""""""""""""""""""""""""""""
set shellpipe=\|\ tee
set grepprg=grep\ -n

""""""""""""""""""""""""""""""""""""""""""""""""""
" Show the line numbers when a file is opened
""""""""""""""""""""""""""""""""""""""""""""""""""
set number
set list listchars=tab:»·,trail:·,extends:>,precedes:<
set nowrap
set incsearch
set ruler
set showcmd

""""""""""""""""""""""""""""""""""""""""""""""""""
" Search Up the directory Tree when looking for tags
""""""""""""""""""""""""""""""""""""""""""""""""""
set tags=tags;/
""""""""""""""""""""""""""""""""""""""""""""""""""
" Make external commands work through a pipe instead of a pseudo-tty
"   This one came from the following website:
"   http://www.naglenet.org/vim/syntax/_gvimrc
""""""""""""""""""""""""""""""""""""""""""""""""""
set noguipty

" Hide the mouse when typing, only for GUI
" set mousehide

""""""""""""""""""""""""""""""""""""""""""""""""""
" Make shift-insert work like in Xterm
""""""""""""""""""""""""""""""""""""""""""""""""""
map  <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

""""""""""""""""""""""""""""""""""""""""""""""""""
" Change the Shift Space to Esc
""""""""""""""""""""""""""""""""""""""""""""""""""
"map! <S-Space> <Esc>

set wrapscan              " search around end of file

""""""""""""""""""""""""""""""""""""""""""""""""""
" Command to pretty xml code
""""""""""""""""""""""""""""""""""""""""""""""""""
func DoTidyXml()
  silent execute "%!tidy -miq -xml"
endfunc
command! Tidyxml call DoTidyXml()


""""""""""""""""""""""""""""""""""""""""""""""""""
" Set some random options
""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch " Hilight when a search command is entered.
set fileformat=unix " Set the default file format to dos
set tildeop         " This treat ~ as a operator for 
                    " multiple CAPS
""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""
" Some abrreviations
""""""""""""""""""""""""""""""""""""""""""""""""""
abbreviate #d #define
abbreviate #i #include

""""""""""""""""""""""""""""""""""""""""""""""""""
" Set the keymap for the showFunc plugin
map <F7> <Plug>ShowFunc
map! <F7> <Plug>ShowFunc
let g:showfuncctagsbin = "/usr/local/bin/ctags"
""""""""""""""""""""""""""""""""""""""""""""""""""
" Tag Menu
let Tmenu_ctags_cmd = "/usr/local/bin/ctags"
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" Function recursively find the Cscope database file
""""""""""""""""""""""""""""""""""""""""""""""""""
function FindCscopeFile()

    " Find cscope data file recursively up
    let cscope_db=findfile("cscope.out", "./;,.;")
    if filereadable(cscope_db)
        execute "cs add" cscope_db cscope_db[0:-12]
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""
" ** Cscope **
if has ("cscope")

    " Find cscope data file recursively up
    :call FindCscopeFile()

"    map <c-F12> :!cscope -bRq<CR>

    nmap <silent> <c-F11> <Esc>:call FindCscopeFile()<CR>

endif
""""""""""""""""""""""""""""""""""""""""""""""""""


"Settings for Winmanager
map <c-w><c-t> :WMToggle<cr>
map! <c-w><c-t> :WMToggle<cr>
map <c-w><c-f> :FirstExplorerWindow<cr>
map! <c-w><c-f> :FirstExplorerWindow<cr>
map <c-w><c-b> :BottomExplorerWindow<cr>
map! <c-w><c-b> :BottomExplorerWindow<cr>

let g:winManagerWindowLayout = 'FileExplorer,TagsExplorer,TagList|BufExplorer'

""""""""""""""""""""""""""""""""""""""""""""""""""
" Eatchar function for the Abbreviations
""""""""""""""""""""""""""""""""""""""""""""""""""
func Eatchar(pat)
  let c = nr2char(getchar())
  return (c =~ a:pat) ? '' : c
endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""
" Some personal keymaps for the merge process
""""""""""""""""""""""""""""""""""""""""""""""""""
if !exists(':ConverListFile')
   command -nargs=0 ConvertListFile :silent call ConvertZipList()
end
map  <c-l> :ConvertListFile<cr>
map! <c-l> :ConvertListFile<cr>


map  <Leader>dd <Esc>:call Delete_End_Spaces()<CR>
map! <Leader>dd <Esc>:call Delete_End_Spaces()<CR>a


""""""""""""""""""""""""""""""""""""""""""""""""""
" Setup the beginning and ending comment box macros
abbr #b /*************************************************
abbr #e *************************************************/
""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle fold state between closed and opened. 
" 
" If there is no fold at current line, just moves forward. 
" If it is present, reverse it's state. 
fun! ToggleFold() 
if foldlevel('.') == 0 
normal! l 
else 
if foldclosed('.') < 0 
. foldclose 
else 
. foldopen 
endif 
endif 
" Clear status line 
echo 
endfun 


""""""""""""""""""""""""""""""""""""""""""""""""""
" Function to convert a list of file paths to
" a line of comma seperate file names
""""""""""""""""""""""""""""""""""""""""""""""""""
function SearchFiles()
  silent execute ':%s/.*\\\(.*\)/\1/g'
  silent execute ':%s/\n/,/g'
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""
" Function to print the name of file tag
""""""""""""""""""""""""""""""""""""""""""""""""""
function Print_Tag()

  let name=expand("%:t")
  let frst='A_(static char* debugTag = "'
  let lst='";) // string to be used in debugging'

  put =frst . name . lst

endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""
" Function to delete the empty spaces at the end of lines
""""""""""""""""""""""""""""""""""""""""""""""""""
function Delete_End_Spaces()
  silent execute ':%s/ *$//g'
  execute ':echo "Spaces Deleted"'
endfunction

