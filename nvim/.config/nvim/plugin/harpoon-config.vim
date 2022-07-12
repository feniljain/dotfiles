" Harpoon config ---------------------- {{{
"luafile ~/.config/nvim/harpoon-config.lua
" lua require('~/.config/nvim/harpoon-config')
lua << EOF
require('harpoon').setup {}
EOF
" nmap <Space>ha :call GotoBuffer(0)<CR>
nmap <leader>hq :lua require("harpoon.ui").toggle_quick_menu()<CR>
nmap <leader>ha :lua require("harpoon.mark").add_file()<CR>
" nmap <leader>hr :lua require("harpoon.mark").rm_file()<CR>
" nmap <leader>hr1 :lua require("harpoon.mark").rm_file(1)<CR>
" nmap <leader>hc :lua require("harpoon.mark").clear_all()<CR>
" Navigation
"nmap <C-q> :lua require("harpoon.ui").nav_file(1)<CR>
nmap <leader>a :lua require("harpoon.ui").nav_file(1)<CR>
nmap <leader>s :lua require("harpoon.ui").nav_file(2)<CR>
nmap <leader>d :lua require("harpoon.ui").nav_file(3)<CR>
nmap <leader>f :lua require("harpoon.ui").nav_file(4)<CR>
" nmap <leader>ca :lua require("harpoon.mark").set_current_at(1)<CR>
" nmap <leader>cs :lua require("harpoon.mark").set_current_at(2)<CR>
" nmap <leader>cd :lua require("harpoon.mark").set_current_at(3)<CR>
" nmap <leader>cf :lua require("harpoon.mark").set_current_at(4)<CR>
" nmap <leader>ra :lua require("harpoon.mark").rm_file(1)<CR>
" nmap <leader>rs :lua require("harpoon.mark").rm_file(2)<CR>
" nmap <leader>rd :lua require("harpoon.mark").rm_file(3)<CR>
" nmap <leader>rf :lua require("harpoon.mark").rm_file(4)<CR>
nmap <leader>ta :lua require("harpoon.term").gotoTerminal(1)<CR>
nmap <leader>ts :lua require("harpoon.term").gotoTerminal(2)<CR>
nmap <leader>td :lua require("harpoon.term").gotoTerminal(2)<CR>
nmap <leader>va :lua require("harpoon.term").sendCommand(1, 1)<CR>
nmap <leader>vs :lua require("harpoon.term").sendCommand(1, 2)<CR>
nmap <leader>vd :lua require("harpoon.term").sendCommand(1, 3)<CR>
nmap <leader>vf :lua require("harpoon.term").sendCommand(1, 4)<CR>
nmap <leader>ca :lua require("harpoon.term").sendCommand(2, 1)<CR>
nmap <leader>cs :lua require("harpoon.term").sendCommand(2, 2)<CR>
" unmap ;w " Unmapping commands
" unmap ;r
" unmap ;e
" }}}
