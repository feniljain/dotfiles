" Goyo Config ---------------------- {{{
    let g:goyo_width="70%"
    function! s:goyo_enter()
        if executable('tmux') && strlen($TMUX)
            silent !tmux set status off
            silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
        endif
        set noshowmode
        set noshowcmd
        " Pane navigation
        noremap <Space>h <C-W>h
        noremap <Space>j <C-W>j
        noremap <Space>k <C-W>k
        noremap <Space>l <C-W>l
        " set scrolloff=999
        " Limelight
        " ...
    endfunction

    function! s:goyo_leave()
        if executable('tmux') && strlen($TMUX)
            silent !tmux set status on
            silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
        endif
        set showmode
        set showcmd
        let t:is_transparent = 0
        " set scrolloff=5
        " Limelight!
        " ...
    endfunction

    autocmd! User GoyoEnter nested call <SID>goyo_enter()
    autocmd! User GoyoLeave nested call <SID>goyo_leave()
" }}}
