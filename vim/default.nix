{ lib, neovim, vimPlugins, symlinkJoin, writeShellScriptBin, fetchgit }:

with lib;
let
  p = x:
    "set rtp+=${
      builtins.fetchTarball "https://github.com/${x}/archive/master.tar.gz"
    }";
  psubmodule = x: sha: rev:
    "set rtp+=${
      fetchgit {
        url = "https://github.com/${x}.git";
        deepClone = true;
        sha256 = sha;
        rev = rev;
      }
    }";
  custRC = ''
    let mapleader = "-"

    filetype plugin indent on
    syntax on
    set nocompatible
    set smartindent
    set modeline
    set mouse=a
    set hlsearch
    set bs=indent,eol,start
    set encoding=UTF-8
    set fileencoding=UTF-8
    set fileencodings=utf8,prc
    set t_Co=256
    set background=dark
    set nostartofline
    set nu
    set ls=2
    set title
    set clipboard=unnamedplus
    set grepprg=grep\ -nH\ $*
    set timeoutlen=1000
    set ttimeoutlen=0
    set tabstop=2
    set softtabstop=2
    set shiftwidth=2
    set expandtab
    set nocursorline
    set nocursorcolumn
    set scrolljump=5
    set lazyredraw
    set synmaxcol=180
    set noshowmode
    set noruler
    set noshowcmd
    set laststatus=2
    set showtabline=1
    set cole=0


    ${p "AndrewRadev/linediff.vim"}
    ${p "bkad/CamelCaseMotion"}
    ${p "kana/vim-submode"}
    ${p "taku-o/vim-toggle"}
    ${p "lilydjwg/colorizer"}
    ${p "prabirshrestha/async.vim"}
    ${p "vmchale/dhall-vim"}
    ${p "t9md/vim-quickhl"}
    ${p "inkarkat/vim-ingo-library"}
    ${p "direnv/direnv.vim"}
    let g:LanguageClient_rootMarkers = ['*.cabal', 'stack.yaml']
    let g:LanguageClient_serverCommands = {
        \ 'rust': ['rls'],
        \ 'haskell': ['ghcide', '--lsp'],
        \ }
    ${p "sk1418/HowMuch"}
    ${p "gaalcaras/ncm-R"}
    ${p "brooth/far.vim"}
    ${p "AndrewRadev/sideways.vim"}
    ${p "fcpg/vim-navmode"}
    ${p "fcpg/vim-shore"}
    nmap <leader>ts :ToggleShore<CR>

    ${p "fcpg/vim-showmap"}
    let g:showmap_helpall_key = "<C-b>"

    ${p "fcpg/vim-spotlightify"}
    ${p "jremmen/vim-ripgrep"}
    ${p "blindFS/vim-taskwarrior"}
    let g:task_rc_override = 'rc.defaultwidth=0'

    set rtp+=${./vim-devicons}
    set rtp+=${./vim-nerdtree-syntax-highlight}
    set rtp+=${./neoformat}
    set rtp+=${./vim-fahrenheit}

    vnoremap Z :w<cr>
    nnoremap <Leader><Leader> :noh<cr>

    "quickfix navigation
    map <C-j> :lnext<CR>
    map <C-k> :lprevious<CR>

    nnoremap Q @q
    vnoremap Q :norm @q<cr>

    vnoremap L <Esc>`<<C-v>`>odp`<<C-v>`>lol
    vnoremap H <Esc>`<<C-v>`>odhP`<<C-v>`>hoh

    let s:hidden_all = 1

    map  <Space>k :wincmd k<CR>
    map  <Space>j :wincmd j<CR>
    map  <Space>h :wincmd h<CR>
    map  <Space>l :wincmd l<CR>

    let maplocalleader=","
    nnoremap <Leader>p gwip
    nnoremap <Leader>r :%s/<c-r><c-w>/<c-r><c-w>/gc<c-f>$F/i"
    cmap w!! w !sudo tee> /dev/null %
    nnoremap m :nohlsearch<Bar>:echo<CR>

    let g:move_key_modifier = 'C'

    set cursorline
    hi CursorLine term=bold cterm=bold guibg=Grey40

    " Highlight all instances of word under cursor, when idle.
    " Useful when studying strange source code.
    " Type z/ to toggle highlighting on/off.
    nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
    function! AutoHighlightToggle()
      let @/ = '''
      if exists('#auto_highlight')
        au! auto_highlight
        augroup! auto_highlight
        setl updatetime=4000
        echo 'Highlight current word: off'
        return 0
      else
        augroup auto_highlight
          au!
          au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
        augroup end
        setl updatetime=500
        echo 'Highlight current word: ON'
        return 1
      endif
    endfunction

    "vim-multiple-cursors
    let g:multi_cursor_next_key='<C-n>'
    let g:multi_cursor_prev_key='<C-p>'
    let g:multi_cursor_skip_key='<C-x>'
    let g:multi_cursor_quit_key='<Esc>'
    let g:multi_cursor_exit_from_visual_mode=0
    let g:multi_cursor_exit_from_insert_mode=0

    "ctrlp
    let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
    let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlPMixed'
    "let g:ctrlp_custom_ignore = {
    "      \ 'dir':  '\v[\/]\.(git|hg|svn)$$',
    "      \ 'file': '\v\.(exe|o|p_o|hi|so|dll)$$',
    "      \ 'link': 'some_bad_symbolic_links',
    "      \ }

    set statusline+=%#warningmsg#
    set statusline+=%*

    " fugitive git bindings
    nnoremap <space>ga :Git add %:p<CR><CR>
    nnoremap <space>gs :Gstatus<CR>
    nnoremap <space>gc :Gcommit -v -q<CR>
    nnoremap <space>gt :Gcommit -v -q %:p<CR>
    nnoremap <space>gd :Gdiff<CR>
    nnoremap <space>ge :Gedit<CR>
    nnoremap <space>gr :Gread<CR>
    nnoremap <space>gw :Gwrite<CR><CR>
    nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
    nnoremap <space>gp :Ggrep<Space>
    nnoremap <space>gm :Gmove<Space>
    nnoremap <space>gb :Git branch<Space>
    nnoremap <space>go :Git checkout<Space>

    nnoremap <space>w :w<cr>

    nnoremap <space>g :Rs<cr>
    nnoremap <space>s :Rg<Space>

    call camelcasemotion#CreateMotionMappings('<leader>')
    map <silent> w <Plug>CamelCaseMotion_w
    map <silent> b <Plug>CamelCaseMotion_b
    map <silent> e <Plug>CamelCaseMotion_e
    map <silent> ge <Plug>CamelCaseMotion_ge
    sunmap w
    sunmap b
    sunmap e
    sunmap ge

    nmap <Space>m <Plug>(quickhl-manual-this)
    xmap <Space>m <Plug>(quickhl-manual-this)
    nmap <Space>w <Plug>(quickhl-manual-this-whole-word)
    xmap <Space>w <Plug>(quickhl-manual-this-whole-word)
    nmap <Space>c <Plug>(quickhl-manual-clear)
    vmap <Space>c <Plug>(quickhl-manual-clear)
    nmap <Space>M <Plug>(quickhl-manual-reset)
    xmap <Space>M <Plug>(quickhl-manual-reset)


    autocmd BufEnter *.dh :setlocal filetype=dhall
    autocmd BufEnter *.dhall :setlocal filetype=dhall
    autocmd BufEnter *.tex :set spell

    call submode#enter_with('fieldtrip', 'n', ''', '<leader>a', '<nop>')
    call submode#map('fieldtrip', 'n', ''', 'H', ':SidewaysLeft<cr>')
    call submode#map('fieldtrip', 'n', ''', 'L', ':SidewaysRight<cr>')
    call submode#map('fieldtrip', 'n', ''', 'l', ':SidewaysJumpLeft<cr>')
    call submode#map('fieldtrip', 'n', ''', 'h', ':SidewaysJumpRight<cr>')
    call submode#map('fieldtrip', 'n', 'rs', 'd', 'd<Plug>SidewaysArgumentTextobjA')
    call submode#map('fieldtrip', 'n', 'rs', 'x', 'd<Plug>SidewaysArgumentTextobjI')
    call submode#map('fieldtrip', 'n', 'rs', 'c', 'c<Plug>SidewaysArgumentTextobjI')
    call submode#map('fieldtrip', 'n', 'r', 'w', 'w')
    call submode#map('fieldtrip', 'n', 'r', 'W', 'W')
    call submode#map('fieldtrip', 'n', 'r', 'b', 'b')
    call submode#map('fieldtrip', 'n', 'r', 'B', 'B')
    call submode#map('fieldtrip', 'n', 'r', 'u', 'u')

    nnoremap <leader>hs :execute "Unite hoogle"<CR>
    nnoremap H :call HideCommentToggle()<cr>

    let g:comments_hidden = 0
    function! HideCommentToggle()
        if g:comments_hidden
            :hi! link Comment Ignore
            let g:comments_hidden = 0
        else
            :hi! link Comment Comment
            let g:comments_hidden = 1
        endif
    endfunction

    nnoremap <Leader>w :StripWhitespace<cr>

    colorscheme fahrenheit
    hi Normal guibg=NONE ctermbg=NONE

    vmap <C-c><C-c> <Plug>SendSelectionToTmux
    nmap <C-c><C-c> <Plug>NormalModeSendToTmux
    nmap <C-c>r <Plug>SetTmuxVars

    imap <C-t> <Plug>ToggleI
    nmap <C-t> <Plug>ToggleN
    vmap <C-t> <Plug>ToggleV

    let g:slime_target="tmux"

    au BufNewFile,BufRead *.hs map <buffer> <C-H> :Hoogle

    let g:localvimrc_enable=1

    "neoformat
    let g:neoformat_enabled_haskell = ['ormolu']
    let g:neoformat_enabled_lhaskell = ['ormolu']
    let g:neoformat_enabled_nix = ['nixfmt']
    let g:neoformat_enabled_python = ['black']
    let g:neoformat_enabled_dhall = ['dhall']
    let g:neoformat_enabled_c = ['clangformat']
    let g:neoformat_enabled_latex = ['latexindent']
    noremap <Leader>f :Neoformat<CR><CR>

    let g:haskell_enable_quantification = 1
    let g:haskell_enable_recursivedo = 1
    let g:haskell_enable_arrowsyntax = 1
    let g:haskell_enable_pattern_synonyms = 1
    let g:haskell_enable_typeroles = 1
    let g:haskell_enable_static_pointers = 1
    let g:haskell_backpack = 1
    let g:haskell_disable_TH = 0

    let g:rainbow_active = 0

    let g:ale_linters = {'vim': ['vint'], 
        \ 'yaml': ['yamllint'], 
        \ 'mail': ['proselint','vale'], 
        \ 'python': ['flake8'], 
        \ 'text': ['proselint', 'vale'], 
        \ 'markdown': ['proselint', 'vale' ], 
        \ 'haskell': []}
    let g:ale_completion_enabled = 0

    autocmd BufNewFile,BufRead *.pyi set syntax=python

    nnoremap <Leader>E :%!mdsh - 2>/dev/null<CR>

    let g:airline_theme='fahrenheit'

    autocmd BufEnter * call ncm2#enable_for_buffer()
    set completeopt=noinsert,menuone,noselect

    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

    nm <Leader>i :call FixImports()<cr>

    " Run the contents of the current buffer through the fix-imports cmd.  Print
    " any stderr output on the status line.
    " Remove 'a' from cpoptions if you don't want this to mess up #.
    function FixImports()
        let out = tempname()
        let err = tempname()
        let tmp = tempname()
        " Using a tmp file means I don't have to save the buffer, which the user
        " didn't ask for.
        execute 'write' tmp
        execute 'silent !fix-imports -v' expand('%') '<' tmp '>' out '2>' err
        let errs = readfile(err)
        if v:shell_error == 0
            " Don't replace the buffer if there's no change, this way I won't
            " mess up fold and undo state.
            call system('cmp -s ' . tmp . ' ' . out)
            if v:shell_error != 0
                " Is there an easier way to replace the buffer with a file?
                let old_line = line('.')
                let old_col = col('.')
                let old_total = line('$')
                %d
                execute 'silent :read' out
                0d
                let new_total = line('$')
                " If the import fix added or removed lines I need to take that
                " into account.  This will be wrong if the cursor was above the
                " import block.
                call cursor(old_line + (new_total - old_total), old_col)
                " The reload will forget fold state.  It was open, right?
                if foldclosed('.') != -1
                    execute 'normal zO'
                endif
            endif
        endif
        call delete(out)
        call delete(err)
        call delete(tmp)
        redraw!
        if !empty(errs)
            echohl WarningMsg
            echo join(errs)
            echohl None
        endif
    endfunction

    if !exists('g:lasttab')
      let g:lasttab = 1
    endif
    nmap gl :exe "tabn ".g:lasttab<CR>
    au TabLeave * let g:lasttab = tabpagenr()

    nmap <C-k> [e
    nmap <C-j> ]e
    vmap <C-k> [egv
    vmap <C-j> ]egv

    nmap <silent> gN <Plug>(coc-diagnostic-prev)
    nmap <silent> gn <Plug>(coc-diagnostic-next)

    " Remap for rename current word

    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    "
    " if hidden is not set, TextEdit might fail.
    set hidden

    " Some servers have issues with backup files, see digital-asset/daml#649
    set nobackup
    set nowritebackup

    " Better display for messages
    set cmdheight=2

    " You will have bad experience for diagnostic messages when it's default 4000.
    set updatetime=300

    " don't give |ins-completion-menu| messages.
    set shortmess+=c

    " always show signcolumns
    set signcolumn=yes


    " Use K to show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

    "xmap <leader>a  <Plug>(coc-codeaction-selected)
    "nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap for do codeAction of current line
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Fix autofix problem of current line
    nmap <leader>qf  <Plug>(coc-fix-current)

    let g:qs_highlight_on_keys = ['f', 'F']
    let g:qs_enable=1

    let g:far#source='rg'

    nmap <leader>tt :NERDTreeToggle<CR>
    nmap <leader>tg :Goyo<CR>
    nmap <leader>tu :UndotreeToggle<CR>

    hi NonText ctermbg=none
    hi Normal guibg=NONE ctermbg=NONE
    hi airline_c  ctermbg=NONE guibg=NONE
    hi airline_tabfill ctermbg=NONE guibg=NONE
  '';

  nvim = neovim.override {
    vimAlias = true;
    configure = {
      packages.thisPackage.start = [ vimPlugins.vim-nix ];
      customRC = custRC;
      vam.knownPlugins = vimPlugins;
      vam.pluginDictionaries = [{
        names = [
          "ctrlp"
          "nerdcommenter"
          "vim-multiple-cursors"
          "undotree"
          "UltiSnips"
          "surround"
          "fugitive"
          "goyo"
          "vim-snippets"
          "vim-dirdiff"
          "vim-speeddating"
          "vim-indent-guides"
          "vim-repeat"
          "ale"
          "calendar-vim"
          "vim-localvimrc"
          "vim-airline"
          "vim-sneak"
          "vim-slime"
          "deoplete-nvim"
          "haskell-vim"
          "unite-vim"
          "vim-unimpaired"
          "gitv"
          "elm-vim"
          "ghcid"
          "ncm2"
          "LanguageClient-neovim"
          "ncm2-path"
          "ncm2-ultisnips"
          "nvim-yarp"
          "rainbow"
          "tabular"
          "vim-better-whitespace"
          "vim-exchange"
          "nerdtree"
          "nerdtree-git-plugin"
          "vim-hoogle"
          "vim-localvimrc"
        ];
      }];
    };
  };
in symlinkJoin {
  name = "vim";
  paths = [ nvim.out (writeShellScriptBin "v" "${nvim}/bin/nvim $@").out ];
}
