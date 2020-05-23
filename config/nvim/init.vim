" .vimrc / init.vim
" The following vim/neovim configuration works for both Vim and NeoVim

" ensure vim-plug is installed and then load it
call functions#PlugLoad()
call plug#begin('~/.config/nvim/plugged')

    " set a map leader for more key combos
    let mapleader = ' '
    let maplocalleader = ' '

" General {{{
    " Abbreviations
    abbr funciton function
    abbr teh the
    abbr tempalte template
    abbr fitler filter
    abbr cosnt const
    abbr attribtue attribute
    abbr attribuet attribute

    set autoread " detect when a file is changed

    set history=1000 " change history to 1000
    set textwidth=120

    set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
    set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

    if (has('nvim'))
        " show results of substition as they're happening
        " but don't open a split
        set inccommand=nosplit
    endif

    set backspace=indent,eol,start " make backspace behave in a sane manner
    set clipboard=unnamed

    if has('mouse')
        set mouse=a
    endif

    " Searching
    set ignorecase " case insensitive searching
    set smartcase " case-sensitive if expresson contains a capital letter
    set nohlsearch " highlight search results
    set incsearch " set incremental search, like modern browsers
    set nolazyredraw " don't redraw while executing macros

    set magic " Set magic on, for regex

    " error bells
    set noerrorbells
    set visualbell
    set t_vb=
    set tm=500
" }}}

" Appearance {{{
    set number " show line numbers
    set wrap " turn on line wrapping
    set wrapmargin=8 " wrap lines when coming within n characters from side
    set linebreak " set soft wrapping
    set showbreak=… " show ellipsis at breaking
    set autoindent " automatically set indent of new line
    set ttyfast " faster redrawing
    set diffopt+=vertical,iwhite,internal,algorithm:patience,hiddenoff
    set laststatus=2 " show the status line all the time
    set so=7 " set 7 lines to the cursors - when moving vertical
    set wildmenu " enhanced command line completion
    set hidden " current buffer can be put into background
    set showcmd " show incomplete commands
    set noshowmode " don't show which mode disabled for PowerLine
    set wildmode=list:longest " complete files like a shell
    set shell=$SHELL
    set cmdheight=1 " command bar height
    set title " set terminal title
    set showmatch " show matching braces
    set updatetime=300
    set signcolumn=yes
    set shortmess+=c

    " Tab control
    set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
    set tabstop=2 " the visible width of tabs
    set softtabstop=2 " edit as if the tabs are 4 characters wide
    set shiftwidth=2 " number of spaces to use for indent and unindent
    set shiftround " round indent to a multiple of 'shiftwidth'

    " code folding settings
    set foldmethod=syntax " fold based on indent
    set foldlevelstart=99
    set foldnestmax=10 " deepest fold is 10 levels
    set nofoldenable " don't fold by default
    set foldlevel=1

    " toggle invisible characters
    set list lcs=tab:\|\ 
    set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
    set showbreak=↪

    set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors

    " switch cursor to line when in insert mode, and block when not
    set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20

    if &term =~ '256color'
        " disable background color erase
        set t_ut=
    endif

    " enable 24 bit color support if supported
    if (has("termguicolors"))
        if (!(has("nvim")))
            let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
            let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
        endif
        set termguicolors
    endif

    " highlight conflicts
    match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

    " Set handlebars files to be treated as html
    au BufNewFile,BufRead *.handlebars set filetype=html
    au BufNewFile,BufRead *.hbs set filetype=html

    " Plug 'python-mode/python-mode', { 'branch': 'develop' }
    
    " Load colorschemes
    Plug 'chriskempson/base16-vim'
    Plug 'joshdick/onedark.vim'

    " LightLine {{{
        Plug 'itchyny/lightline.vim'
        Plug 'nicknisi/vim-base16-lightline'
        let g:lightline = {
            \   'colorscheme': 'base16',
            \   'active': {
            \       'left': [ [ 'mode', 'paste' ],
            \               [ 'gitbranch' ],
            \               [ 'readonly', 'filetype', 'filename' ]],
            \       'right': [ [ 'percent' ], [ 'lineinfo' ],
            \               [ 'fileformat', 'fileencoding' ],
            \               [ 'gitblame', 'currentfunction',  'cocstatus', 'linter_errors', 'linter_warnings' ]]
            \   },
            \   'component_expand': {
            \   },
            \   'component_type': {
            \       'readonly': 'error',
            \       'linter_warnings': 'warning',
            \       'linter_errors': 'error'
            \   },
            \   'component_function': {
            \       'fileencoding': 'helpers#lightline#fileEncoding',
            \       'filename': 'helpers#lightline#fileName',
            \       'fileformat': 'helpers#lightline#fileFormat',
            \       'filetype': 'helpers#lightline#fileType',
            \       'gitbranch': 'helpers#lightline#gitBranch',
            \       'cocstatus': 'coc#status',
            \       'currentfunction': 'helpers#lightline#currentFunction',
            \       'gitblame': 'helpers#lightline#gitBlame'
            \   },
            \   'tabline': {
            \       'left': [ [ 'tabs' ] ],
            \       'right': [ [ 'close' ] ]
            \   },
            \   'tab': {
            \       'active': [ 'filename', 'modified' ],
            \       'inactive': [ 'filename', 'modified' ],
            \   },
            \   'separator': { 'left': '', 'right': '' },
            \   'subseparator': { 'left': '', 'right': '' }
        \ }
    " }}}
" }}}

" General Mappings {{{
    " remap esc
    inoremap jk <esc>

    " shortcut to save
    nmap <leader>w :w<cr>

    " tabs navigatione
    nnoremap ]t :tabn<cr>
    nnoremap [t :tabp<cr>

    " shortcut to quit
    nmap <leader>q :q<cr>
    nmap <leader>Q :qa<cr>

    " Make Y behave like other capitals
    nnoremap Y y$

    " qq to record, Q to replay
    nnoremap Q @q

    " Make last word UPPERCASE 
    inoremap <C-f> <C-o>b<C-o>gUiw<C-o>e<right><right>

    " Make s surround word and S surround line
    nmap s ysiw
    nmap S yss

    " Open new line below and above current line
    nnoremap <leader>o o<esc>
    nnoremap <leader>O O<esc>    

    " Replace visual selection
    " vnoremap <leader>p "_dP

    " Session saving
    Plug 'tpope/vim-obsession'
    nnoremap <leader>bs :Obsession<cr>

    " Highlight yank
    if exists('##TextYankPost')
      Plug 'machakann/vim-highlightedyank'
      let g:highlightedyank_highlight_duration = 100
    endif

    Plug 'junegunn/vim-slash'
    if has('timers')
        noremap <expr> <plug>(slash-after) slash#blink(2, 50)
    endif

    Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
      let g:undotree_WindowLayout = 2
      nnoremap U :UndotreeToggle<CR>

    " Peekaboo extends " and @ in normal mode and <CTRL-R> in insert mode so you can see the contents of the registers
    Plug 'junegunn/vim-peekaboo'

    " Ctag sidebar
      Plug 'liuchengxu/vista.vim'
      nmap <leader>ta :Vista coc<CR>
      nmap <Leader>tf :Vista finder fzf:coc<CR>


    " Nvim terminal
    if has('nvim')
        tnoremap <a-a> <esc>a
        tnoremap <a-b> <esc>b
        tnoremap <a-d> <esc>d
        tnoremap <a-f> <esc>f
    endif

      " Terminal mode mapping
    if has('nvim')
        tnoremap <C-o> <C-\><C-n>
        tnoremap <C-v><C-o> <C-o>
    endif

    if has('nvim')
      tnoremap <M-h> <c-\><c-n><c-w>h
      tnoremap <M-j> <c-\><c-n><c-w>j
      tnoremap <M-k> <c-\><c-n><c-w>k
      tnoremap <M-l> <c-\><c-n><c-w>l
    endif

    nnoremap <leader>tt :tabnew \| te<cr>i
    nnoremap <leader>th :vsplit \| te<cr>i
    nnoremap <leader>tj :split \| te<cr><C-w>ri
    nnoremap <leader>tk :split \| te<cr>i
    nnoremap <leader>tl :vsplit \| te<cr><C-w>ri

    " Buffer
    nnoremap ]b :bnext<cr>
    nnoremap [b :bprev<cr>

    " Moving Line
    nnoremap <silent> <M-k> :move-2<cr>
    nnoremap <silent> <M-j> :move+<cr>
    nnoremap <silent> <M-h> <<
    nnoremap <silent> <M-l> >>
    inoremap <silent> <M-k> <C-o>:move-2<cr>
    inoremap <silent> <M-j> <C-o>:move+<cr>
    inoremap <silent> <M-h> <C-o><<
    inoremap <silent> <M-l> <C-o>>>
    xnoremap <silent> <M-k> :move-2<cr>gv
    xnoremap <silent> <M-j> :move'>+<cr>gv
    xnoremap <silent> <M-h> <gv
    xnoremap <silent> <M-l> >gv

    xnoremap < <gv
    xnoremap > >gv

    " edit ~/.config/nvim/init.vim
    map <leader>ev :e! ~/.config/nvim/init.vim<cr>
    
    " edit gitconfig
    " map <leader>eg :e! ~/.gitconfig<cr>

    " clear highlighted search
    noremap <leader>/ :set hlsearch! hlsearch?<cr>

    " activate spell-checking alternatives
    " nmap ;s :set invspell spelllang=en<cr>

    " markdown to html
    nmap <leader>md :%!markdown --html4tags <cr>

    " remove extra whitespace
    "nmap <leader><space> :%s/\s\+$<cr>
    "nmap <leader><space><space> :%s/\n\{2,}/\r\r/g<cr>

    " Movement in insert mode
    inoremap <C-h> <C-o>h
    inoremap <C-l> <C-o>l
    inoremap <C-j> <C-o>j
    inoremap <C-k> <C-o>k

    " nmap <leader>l :set list!<cr>

    " keep visual selection when indenting/outdenting
    vmap < <gv
    vmap > >gv

    " switch between current and last buffer
    nmap <leader>. <c-^>

    " enable . command in visual mode
    vnoremap . :normal .<cr>

    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l

    xnoremap <silent> <C-h> <C-c><C-w>h
    xnoremap <silent> <C-j> <C-c><C-w>j
    xnoremap <silent> <C-k> <C-c><C-w>k
    xnoremap <silent> <C-l> <C-c><C-w>l

    Plug 'christoomey/vim-tmux-navigator'
        let g:tmux_navigator_no_mappings = 1
        nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
        nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
        nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
        nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

    nmap <leader>z <Plug>Zoom

    " map <leader>wc :wincmd q<cr>

    " move line mappings
    " ∆ is <A-j> on macOS
    " ˚ is <A-k> on macOS
    " nnoremap ∆ :m .+1<cr>==
    " nnoremap ˚ :m .-2<cr>==
    " inoremap ∆ <Esc>:m .+1<cr>==gi
    " inoremap ˚ <Esc>:m .-2<cr>==gi
    " vnoremap ∆ :m '>+1<cr>gv=gv
    " vnoremap ˚ :m '<-2<cr>gv=gv

    vnoremap $( <esc>`>a)<esc>`<i(<esc>
    vnoremap $[ <esc>`>a]<esc>`<i[<esc>
    vnoremap ${ <esc>`>a}<esc>`<i{<esc>
    vnoremap $" <esc>`>a"<esc>`<i"<esc>
    vnoremap $' <esc>`>a'<esc>`<i'<esc>
    vnoremap $\ <esc>`>o*/<esc>`<O/*<esc>
    vnoremap $< <esc>`>a><esc>`<i<<esc>

    " toggle cursor line
    nnoremap <leader>i :set cursorline!<cr>

    " Quickfix
    nnoremap ]q :cnext<cr>zz
    nnoremap [q :cprev<cr>zz
    nnoremap ]Q :clast<cr>zz
    nnoremap [Q :cfirst<cr>zz
    nnoremap ]l :lnext<cr>zz
    nnoremap [l :lprev<cr>zz
    nnoremap ]L :llast<cr>zz
    nnoremap [L :lfirst<cr>zz

    " <leader>b | buf-search
    nnoremap <leader>b :cex []<BAR>bufdo vimgrepadd @@g %<BAR>cw<s-left><s-left><right>

    " <Leader>c Close quickfix/location window
    nnoremap <leader>c :cclose<bar>lclose<cr>

    " <Leader>C Open quickfix/location window
    nnoremap <leader>C :copen<cr>
    nnoremap <leader>l :lopen<cr>

    " scroll the viewport faster
    nnoremap <C-e> 5<C-e>
    nnoremap <C-y> 5<C-y>

    " moving up and down work as you would expect
    nnoremap <silent> j gj
    nnoremap <silent> k gk
    nnoremap <silent> ^ g^
    nnoremap <silent> $ g$

    " helpers for dealing with other people's code
    nmap \t :set ts=4 sts=4 sw=4 noet<cr>
    nmap \s :set ts=4 sts=4 sw=4 et<cr>

    nnoremap <silent> <leader>u :call functions#HtmlUnEscape()<cr>

    command! Rm call functions#Delete()
    command! RM call functions#Delete() <Bar> q!

    " Custom text objects

    " inner-line
    xnoremap <silent> il :<c-u>normal! g_v^<cr>
    onoremap <silent> il :<c-u>normal! g_v^<cr>

    " around line
    vnoremap <silent> al :<c-u>normal! $v0<cr>
    onoremap <silent> al :<c-u>normal! $v0<cr>

    Plug 'gcmt/taboo.vim'
    let g:taboo_tab_format = " tab:%N%m "

    nnoremap <Leader>1 1gt
    nnoremap <Leader>2 2gt
    nnoremap <Leader>3 3gt
    nnoremap <Leader>4 4gt
    nnoremap <Leader>5 5gt

    " Todo grep
    function! s:todo() abort
      let entries = []
      for cmd in ['git grep -niI -e TODO -e FIXME -e XXX 2> /dev/null',
                \ 'grep -rniI -e TODO -e FIXME -e XXX * 2> /dev/null']
        let lines = split(system(cmd), '\n')
        if v:shell_error != 0 | continue | endif
        for line in lines
          let [fname, lno, text] = matchlist(line, '^\([^:]*\):\([^:]*\):\(.*\)')[1:3]
          call add(entries, { 'filename': fname, 'lnum': lno, 'text': text })
        endfor
        break
      endfor

      if !empty(entries)
        call setqflist(entries)
        copen
      endif
    endfunction
    command! Todo call s:todo()

" }}}

" AutoGroups {{{
    " file type specific settings
    augroup configgroup
        autocmd!

        " automatically resize panes on resize
        autocmd VimResized * exe 'normal! \<c-w>='
        autocmd BufWritePost .vimrc,.vimrc.local,init.vim source %
        autocmd BufWritePost .vimrc.local source %
        " save all files on focus lost, ignoring warnings about untitled buffers
        autocmd FocusLost * silent! wa

        " make quickfix windows take all the lower section of the screen
        " when there are multiple windows open
        autocmd FileType qf wincmd J
        autocmd FileType qf nmap <buffer> q :q<cr>
    augroup END
" }}}

" General Functionality {{{
    " better terminal integration
    " substitute, search, and abbreviate multiple variants of a word
    Plug 'tpope/vim-abolish'

    " easy commenting motions
    Plug 'tpope/vim-commentary'

    " mappings which are simply short normal mode aliases for commonly used ex commands
    Plug 'tpope/vim-unimpaired'

    " endings for html, xml, etc. - ehances surround
    Plug 'tpope/vim-ragtag'

    " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
    Plug 'tpope/vim-surround'

    " tmux integration for vim
    Plug 'benmills/vimux'

    nmap <leader>vs :call VimuxRunCommand("npm run start")<cr>
    nmap <leader>vt :call VimuxRunCommand("npm run test -- --watch")<cr>
    nmap <leader>vd :call VimuxRunCommand("npm run debug")<cr>
    nmap <leader>ve :call VimuxRunCommand("npm run lint")<cr>
    nmap <leader>vn :call VimuxRunCommand("new-component ")<left><left>

    nmap <leader>vf :call VimuxRunCommand("python manage.py test functional_tests")<cr>
    nmap <leader>vv :call VimuxRunCommand("python manage.py test lists")<cr>
    nmap <leader>vm :call VimuxRunCommand("python manage.py ")<left><left>

    nmap <Leader>vp :VimuxPromptCommand<CR>
    nmap <Leader>vl :VimuxRunLastCommand<CR>
    nmap <Leader>vi :VimuxInspectRunner<CR>
    nmap <Leader>vq :VimuxCloseRunner<CR>
    nmap <Leader>vc :VimuxInterruptRunner<CR>
    nmap <leader>y :call VimuxRunCommand("fh")<cr><M-j><M-l>
    nmap <leader>Y :call VimuxRunCommand("python")<cr><M-j><M-l>

    " enables repeating other supported plugins with the . command
    Plug 'tpope/vim-repeat'

    " .editorconfig support
    Plug 'editorconfig/editorconfig-vim'

    " single/multi line code handler: gS - split one line into multiple, gJ - combine multiple lines into one
    Plug 'AndrewRadev/splitjoin.vim'

    Plug 'xolox/vim-misc'
    Plug 'xolox/vim-easytags'

    " detect indent style (tabs vs. spaces)
    Plug 'tpope/vim-sleuth'

    " Startify: Fancy startup screen for vim {{{
        Plug 'mhinz/vim-startify'

        " Don't change to directory when selecting a file
        let g:startify_files_number = 5
        let g:startify_change_to_dir = 0
        let g:startify_custom_header = [ ]
        let g:startify_relative_path = 1
        let g:startify_use_env = 1

        " Custom startup list, only show MRU from current directory/project
        let g:startify_lists = [
        \  { 'type': 'dir',       'header': [ 'Files '. getcwd() ] },
        \  { 'type': function('helpers#startify#listcommits'), 'header': [ 'Recent Commits' ] },
        \  { 'type': 'sessions',  'header': [ 'Sessions' ]       },
        \  { 'type': 'bookmarks', 'header': [ 'Bookmarks' ]      },
        \  { 'type': 'commands',  'header': [ 'Commands' ]       },
        \ ]

        let g:startify_commands = [
        \   { 'up': [ 'Update Plugins', ':PlugUpdate' ] },
        \   { 'ug': [ 'Upgrade Plugin Manager', ':PlugUpgrade' ] },
        \ ]

        let g:startify_bookmarks = [
            \ { 'c': '~/.config/nvim/init.vim' },
            \ { 'g': '~/.gitconfig' },
            \ { 'z': '~/.zshrc' }
        \ ]

        autocmd User Startified setlocal cursorline
        nmap <leader>st :Startify<cr>
    " }}}

    " Close buffers but keep splits
    Plug 'moll/vim-bbye'
    nmap <leader>db :Bdelete<cr>

    " Writing in vim {{{{
        Plug 'junegunn/goyo.vim'

        autocmd! User GoyoEnter nested call helpers#goyo#enter()
        autocmd! User GoyoLeave nested call helpers#goyo#leave()
    " }}}

    " context-aware pasting
    Plug 'sickill/vim-pasta'

    " NERDTree {{{
        Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
        Plug 'Xuyuanp/nerdtree-git-plugin'
        Plug 'ryanoasis/vim-devicons'
        Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
        let g:WebDevIconsOS = 'Linux'
        let g:WebDevIconsUnicodeDecorateFolderNodes = 1
        " let g:DevIconsEnableFoldersOpenClose = 1
        let g:DevIconsEnableFolderExtensionPatternMatching = 1
        let NERDTreeDirArrowExpandable = "\u00a0" " make arrows invisible
        let NERDTreeDirArrowCollapsible = "\u00a0" " make arrows invisible
        let NERDTreeNodeDelimiter = "\u263a" " smiley face

        augroup nerdtree
            autocmd!
            autocmd FileType nerdtree setlocal nolist " turn off whitespace characters
            autocmd FileType nerdtree setlocal nocursorline " turn off line highlighting for performance
        augroup END

        " Toggle NERDTree
        function! ToggleNerdTree()
            if @% != "" && @% !~ "Startify" && (!exists("g:NERDTree") || (g:NERDTree.ExistsForTab() && !g:NERDTree.IsOpen()))
                :NERDTreeFind
            else
                :NERDTreeToggle
            endif
        endfunction
        " toggle nerd tree
        nmap <silent> <leader>N :call ToggleNerdTree()<cr>

        let NERDTreeShowHidden=1
        " let NERDTreeDirArrowExpandable = '▷'
        " let NERDTreeDirArrowCollapsible = '▼'
        let g:NERDTreeIndicatorMapCustom = {
        \ "Modified"  : "✹",
        \ "Staged"    : "✚",
        \ "Untracked" : "✭",
        \ "Renamed"   : "➜",
        \ "Unmerged"  : "═",
        \ "Deleted"   : "✖",
        \ "Dirty"     : "✗",
        \ "Clean"     : "✔︎",
        \ 'Ignored'   : '☒',
        \ "Unknown"   : "?"
    \ }
" }}}

  " FZF {{{

  Plug 'junegunn/fzf', { 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  if has('nvim') || has('gui_running')
    let $FZF_DEFAULT_OPTS .= ' --inline-info'
  endif


  " All files
  command! -nargs=? -complete=dir AF
    \ call fzf#run(fzf#wrap(fzf#vim#with_preview({
    \   'source': 'fd --type f --hidden --follow --exclude .git --no-ignore . '.expand(<q-args>)
    \ })))

  let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }

  " Terminal buffer options for fzf
  autocmd! FileType fzf
  autocmd  FileType fzf set noshowmode noruler nonu

  let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

  command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

  nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
  nnoremap <silent> <Leader>; :Buffers<CR>
  nnoremap <silent> <Leader>L :Lines<CR>
  command! -bang -nargs=* Ag
    \ call fzf#vim#ag(<q-args>,
    \                 <bang>0 ? fzf#vim#with_preview('up:60%')
    \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
    \                 <bang>0)
  nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>
  nnoremap <silent> <Leader>AG :Ag <C-R><C-A><CR>
  xnoremap <silent> <Leader>ag y:Ag <C-R>"<CR>
  nnoremap <silent> <Leader>` :Marks<CR>
  nnoremap <silent> <Leader>r :Rg<CR>

  inoremap <expr> <c-x><c-t> fzf#complete('tmuxwords.rb --all-but-current --scroll 500 --min 5')
  imap <c-x><c-k> <plug>(fzf-complete-word)
  imap <c-x><c-f> <plug>(fzf-complete-path)
  inoremap <expr> <c-x><c-d> fzf#vim#complete#path('blsd')
  imap <c-x><c-j> <plug>(fzf-complete-file-ag)
  imap <c-x><c-l> <plug>(fzf-complete-line)

  function! s:plug_help_sink(line)
    let dir = g:plugs[a:line].dir
    for pat in ['doc/*.txt', 'README.md']
      let match = get(split(globpath(dir, pat), "\n"), 0, '')
      if len(match)
        execute 'tabedit' match
        return
      endif
    endfor
    tabnew
    execute 'Explore' dir
  endfunction

  command! PlugHelp call fzf#run(fzf#wrap({
    \ 'source': sort(keys(g:plugs)),
    \ 'sink':   function('s:plug_help_sink')}))

  function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let options = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    if a:fullscreen
      let options = fzf#vim#with_preview(options)
    endif
    call fzf#vim#grep(initial_command, 1, options, a:fullscreen)
  endfunction

  command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

  function! s:list_buffers()
    redir => list
    silent ls
    redir END
    return split(list, "\n")
  endfunction

  function! s:delete_buffers(lines)
    execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
  endfunction

  command! BD call fzf#run(fzf#wrap({
    \ 'source': s:list_buffers(),
    \ 'sink*': { lines -> s:delete_buffers(lines) },
    \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
  \ }))

  nnoremap <leader>dB :BD<cr>


    " vim-fugitive {{{
        Plug 'tpope/vim-fugitive'
        nmap <silent> <leader>gg :Gstatus<CR>gg<c-n>
        nmap <silent> <leader>gd :Gdiff<CR>
        nmap <silent> <leader>gv :GV<CR>
        nmap <leader>ge :Gedit<cr>
        nmap <silent><leader>gr :Gread<cr>
        nmap <silent><leader>gb :Gblame<cr>
        nmap <silent><leader>gt :Twiggy<cr>

        Plug 'junegunn/gv.vim'
        Plug 'tpope/vim-rhubarb' " hub extension for fugitive
        Plug 'sodapopcan/vim-twiggy'
    " }}}
    "

        Plug 'honza/vim-snippets'

    " coc {{{
        Plug 'neoclide/coc.nvim', {'branch': 'release'}

        let g:coc_global_extensions = [
        \ 'coc-css',
        \ 'coc-html',
        \ 'coc-json',
        \ 'coc-tsserver',
        \ 'coc-git',
        \ 'coc-github',
        \ 'coc-webpack',
        \ 'coc-tslint-plugin',
        \ 'coc-eslint',
        \ 'coc-actions',
        \ 'coc-pairs',
        \ 'coc-python',
        \ 'coc-sh',
        \ 'coc-vimlsp',
        \ 'coc-emmet',
        \ 'coc-snippets',
        \ 'coc-prettier',
        \ 'coc-explorer',
        \ 'coc-highlight'
        \ ]

        autocmd CursorHold * silent call CocActionAsync('highlight')

        " coc-snippets list
        nmap <leader>sn :CocList snippets<cr>

        " coc-python
        nmap <leader>p :CocCommand python.execInTerminal<cr>
        nmap <leader>P :CocCommand python.startREPL<cr>

        " coc-prettier
        command! -nargs=0 Prettier :CocCommand prettier.formatFile
        nmap <leader>e :CocCommand prettier.formatFile<cr>

        " coc-git
        nmap [g <Plug>(coc-git-prevchunk)
        nmap ]g <Plug>(coc-git-nextchunk)
        nmap gs <Plug>(coc-git-chunkinfo)
        nmap gu :CocCommand git.chunkUndo<cr>

        nmap <silent> <leader>n :CocCommand explorer<cr>

        "remap keys for gotos
        nmap <silent> gd <Plug>(coc-definition)
        nmap <silent> gy <Plug>(coc-type-definition)
        nmap <silent> gi <Plug>(coc-implementation)
        nmap <silent> gr <Plug>(coc-references)
        nmap <silent> gh <Plug>(coc-doHover)

        " diagnostics navigation
        nmap <silent> [c <Plug>(coc-diagnostic-prev)
        nmap <silent> ]c <Plug>(coc-diagnostic-next)

        " rename
        nmap <silent> <leader>rn <Plug>(coc-rename)

        " Remap for format selected region
        xmap <leader>f  <Plug>(coc-format-selected)
        nmap <leader>f  <Plug>(coc-format-selected)

        " Applying codeAction to the selected region.
        " Example: `<leader>aap` for current paragraph
        xmap <leader>a  <Plug>(coc-codeaction-selected)
        nmap <leader>a  <Plug>(coc-codeaction-selected)

        " Remap for do codeAction of selected region
        " function! s:cocActionsOpenFromSelected(type) abort
        "   execute 'CocCommand actions.open ' . a:type
        " endfunction
        " xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
        " nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

        " Remap keys for applying codeAction to the current line.
        nmap <leader>am :CocCommand actions.open<cr> 
        "
        " Introduce function text object
        " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
        xmap if <Plug>(coc-funcobj-i)
        xmap af <Plug>(coc-funcobj-a)
        omap if <Plug>(coc-funcobj-i)
        omap af <Plug>(coc-funcobj-a)

        " Show all diagnostics.
        nnoremap <silent> <leader>ad  :<C-u>CocList diagnostics<cr>

        " organize imports
        command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

        " Add `:Fold` command to fold current buffer.
        command! -nargs=? Fold :call     CocAction('fold', <f-args>)

        inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
        inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

        function! s:check_back_space() abort
          let col = col('.') - 1
          return !col || getline('.')[col - 1]  =~# '\s'
        endfunction

        let g:coc_snippet_next = '<C-space>'

        " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
        " position. Coc only does snippet and additional edit on confirm.
        if exists('*complete_info')
            inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
        else
            imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
        endif

        " Use K to show documentation in preview window
        nnoremap <silent> K :call <SID>show_documentation()<CR>

        function! s:show_documentation()
            if (index(['vim','help'], &filetype) >= 0)
                execute 'h '.expand('<cword>')
            else
                call CocAction('doHover')
            endif
        endfunction

        " For enhanced <CR> experience with coc-pairs checkout :h coc#on_enter()
        inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
    " }}}
" }}}

" Language-Specific Configuration {{{
    " html / templates {{{
        " emmet support for vim - easily create markdup wth CSS-like syntax
        " Plug 'mattn/emmet-vim'

        " match tags in html, similar to paren support
        Plug 'gregsexton/MatchTag', { 'for': 'html' }

        " html5 support
        " Plug 'othree/html5.vim', { 'for': 'html' }

        " mustache support
        " Plug 'mustache/vim-mustache-handlebars'

        " pug / jade support
        " Plug 'digitaltoad/vim-pug', { 'for': ['jade', 'pug'] }

		" nunjucks support
        " Plug 'Glench/Vim-Jinja2-Syntax', { 'for': 'njk' }

        " liquid support
        " Plug 'tpope/vim-liquid'
    " }}}

    " Python {{{
        Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
    " }}}

    " JavaScript {{{
        " Plug 'othree/yajs.vim', { 'for': [ 'javascript', 'javascript.jsx', 'html' ] }
        " Plug 'pangloss/vim-javascript'
        " Plug 'othree/javascript-libraries-syntax.vim'
        " let g:used_javascript_libs = 'underscore,requirejs,chai,jquery,express'

        " Plug 'moll/vim-node', { 'for': 'javascript' }
        Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install' }
        Plug 'MaxMEllon/vim-jsx-pretty'
        let g:vim_jsx_pretty_highlight_close_tag = 1
    " }}}

    " TypeScript {{{
        " Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'typescript.tsx'] }
        " Plug 'Shougo/vimproc.vim', { 'do': 'make' } TODO what still needs this?
    " }}}


    " Styles {{{
        " Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] }
        " Plug 'groenewege/vim-less', { 'for': 'less' }
        " Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
        " Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
        " Plug 'stephenway/postcss.vim', { 'for': 'css' }
    " }}}

    " markdown {{{
        Plug 'tpope/vim-markdown', { 'for': 'markdown' }
        let g:markdown_fenced_languages = [ 'tsx=typescript.tsx' ]

        " Open markdown files in Marked.app - mapped to <leader>m
        Plug 'itspriddle/vim-marked', { 'for': 'markdown', 'on': 'MarkedOpen' }
        nmap <leader>m :MarkedOpen!<cr>
        nmap <leader>mq :MarkedQuit<cr>
        nmap <leader>* *<c-o>:%s///gn<cr>
    " }}}

    " JSON {{{
        " Plug 'elzr/vim-json', { 'for': 'json' }
        " let g:vim_json_syntax_conceal = 0
    " }}}

    " HTML {{{
        Plug 'AndrewRadev/tagalong.vim'
        let g:tagalong_additional_filetypes = ['javascript', 'typescript']
        let g:tagalong_verbose = 1
    " }}}

    Plug 'ekalinin/Dockerfile.vim'
" }}}

call plug#end()

" Colorscheme and final setup {{{
    " This call must happen after the plug#end() call to ensure
    " that the colorschemes have been loaded
    if filereadable(expand("~/.vimrc_background"))
        let base16colorspace=256
        source ~/.vimrc_background
    else
        let g:onedark_termcolors=16
        let g:onedark_terminal_italics=1
        colorscheme onedark
    endif
    syntax on
    filetype plugin indent on
    " make the highlighting of tabs and other non-text less annoying
    highlight SpecialKey ctermfg=19 guifg=#333333
    highlight NonText ctermfg=19 guifg=#333333

    " make comments and HTML attributes italic
    highlight Comment cterm=italic term=italic gui=italic
    highlight htmlArg cterm=italic term=italic gui=italic
    highlight xmlAttrib cterm=italic term=italic gui=italic
    " highlight Type cterm=italic term=italic gui=italic
    highlight Normal ctermbg=none
" }}}

" vim:set foldmethod=marker foldlevel=0
