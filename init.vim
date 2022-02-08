" --- 启动时自动安装插件
" 国内github被墙，使用gitee的fork版本,下面为原地址
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
if empty(glob($HOME.'/.config/nvim/autoload/plug.vim'))
    !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
		\ https://gitee.com/zkity/vim-plug/raw/master/plug.vim
    autocmd VimEnter * PlugInstall --sync
endif

if empty(glob($HOME.'/.config/nvim/plugged/*'))
    autocmd VimEnter * PlugInstall --sync
endif

let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
	let has_machine_specific_file = 0
	silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source $HOME/.config/nvim/_machine_specific.vim

" --- vim配置
let g:neoterm_autoscroll = 1
" set clipboard=unnamedplus
let &t_ut=''
set autochdir

" set exrc
" :help xxx 可以查看功能解释
set secure
set nocompatible
set nohls
set autoread
set number
set relativenumber
set cursorline
set hidden
set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set list
"    
set listchars=tab:\|\ ,trail:▫,eol:
set scrolloff=4
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
set wildmenu
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
silent !mkdir -p $HOME/.config/nvim/tmp/backup
silent !mkdir -p $HOME/.config/nvim/tmp/undo
"silent !mkdir -p $HOME/.config/nvim/tmp/sessions
set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=$HOME/.config/nvim/tmp/undo,.
endif
" set colorcolumn=100
set updatetime=100
set virtualedit=block

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" --- 键位设置
let mapleader=" "

" 复制到系统剪切板
vnoremap Y "+y"

" 窗口切换
noremap <LEADER>h <C-w>h
noremap <LEADER>l <C-w>l
noremap <LEADER>j <C-w>j
noremap <LEADER>k <C-w>k
noremap <LEADER>w <C-w>w

noremap <LEADER>H <C-w>H
noremap <LEADER>L <C-w>L
noremap <LEADER>J <C-w>J
noremap <LEADER>K <C-w>K

" 窗口切分
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>

" 改变窗口大小
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

" 水平切换到垂直窗口
noremap sth <C-w>t<C-w>K
noremap stv <C-w>t<C-w>H

" 旋转窗口
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

" 创建新tab
noremap tu :tabe<CR>
noremap tU :tab split<CR>

" 切换tab
noremap tp :-tabnext<CR>
noremap tn :+tabnext<CR>

" 移动tab
noremap tmp :-tabmove<CR>
noremap tmn :+tabmove<CR>

" 打开终端
noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>

" 按两次space跳转到下一个<++>并编辑
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" 查找和替换
noremap \s :%s//g<left><left>

" --- vim-plug安装插件
call plug#begin('$HOME/.config/nvim/plugged')

" +++ 显示相关

" 主题
Plug 'arzg/vim-colors-xcode'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'theniceboy/nvim-deus'

" vim 开始界面
Plug 'mhinz/vim-startify'

" 状态栏
" Plug 'theniceboy/eleline.vim'
Plug 'vim-airline/vim-airline'
Plug 'ojroques/vim-scrollstatus'

" 美化tab栏
Plug 'mg979/vim-xtabline'

" 为文件添加图标
Plug 'ryanoasis/vim-devicons'

" 显示垂直对齐线
Plug 'Yggdroot/indentLine'

" 语法分析树
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" 彩虹括号
Plug 'luochen1990/rainbow'

" 自动切换相对行号到固定行号
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" 高亮显示和当前选中相同的词
Plug 'RRethy/vim-illuminate'

" 显示数字定义的颜色
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }

" +++ 目录功能

" 文件浏览
"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'Xuyuanp/nerdtree-git-plugin'

" 查找文件
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

" 调用ranger
" Plug 'kevinhwang91/rnvimr'

" 在打开文件时切换到项目根目录
Plug 'airblade/vim-rooter'

" +++ 编辑相关

" 自动补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wellle/tmux-complete.vim'

" 代码段
Plug 'zkity/vim-snippets'

" 文件内变量函数检索
Plug 'liuchengxu/vista.vim'

" 快速选择匹配块内的内容
Plug 'gcmt/wildfire.vim'

" 快速更改包围内容
Plug 'tpope/vim-surround'

" 括号自动补全删除
Plug 'jiangmiao/auto-pairs'

" 多光标
Plug 'mg979/vim-visual-multi'

" 快速注释
Plug 'tomtom/tcomment_vim'

" 根据符号排列整齐
Plug 'godlygeek/tabular'

" 一行和多行的变换
Plug 'AndrewRadev/splitjoin.vim'

" +++ 版本管理

" Undo Tree
" Plug 'mbbill/undotree'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'cohama/agit.vim'
Plug 'kdheepak/lazygit.nvim'

" +++  语言支持

" Tex
" Plug 'lervag/vimtex'

" CSharp
" Plug 'OmniSharp/omnisharp-vim'
" Plug 'ctrlpvim/ctrlp.vim' , { 'for': ['cs', 'vim-plug'] } " omnisharp-vim dependency

" json
Plug 'elzr/vim-json'
Plug 'neoclide/jsonc.vim'

" html
Plug 'othree/html5.vim'
Plug 'alvan/vim-closetag'

" css
Plug 'hail2u/vim-css3-syntax' " , { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }

" js
Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'

" ts
Plug 'HerringtonDarkholme/yats.vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Go
Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }

" Python
Plug 'tmhedberg/SimpylFold', { 'for' :['python', 'vim-plug'] }
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python3', 'vim-plug'] }
" Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python3', 'vim-plug'] }
" Plug 'tweekmonster/braceless.vim', { 'for' :['python3', 'vim-plug'] }

" Flutter
Plug 'dart-lang/dart-vim-plugin'

" Swift
Plug 'keith/swift.vim'
Plug 'arzg/vim-swift'

" Markdown
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim'

" +++ 功能扩展

" 查看寄存器内容
Plug 'junegunn/vim-peekaboo'

" 管理员权限写
Plug 'lambdalisue/suda.vim' " do stuff like :sudowrite

" +++ 工程相关

" 构建任务
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'

call plug#end()

" --- 插件配置

set termguicolors " enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" colorscheme dracula
colorscheme deus
" set cursorcolumn
hi NonText ctermfg=black guifg=grey1

" +++ tabular 
vmap ga :Tabularize /

" +++ gitgutter
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '░'
let g:gitgutter_sign_removed = '▏'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▒'
" autocmd BufWritePost * GitGutter
nnoremap <LEADER>gf :GitGutterFold<CR>
nnoremap H :GitGutterPreviewHunk<CR>
nnoremap <LEADER>g- :GitGutterPrevHunk<CR>
nnoremap <LEADER>g= :GitGutterNextHunk<CR>

" +++ coc
let g:coc_global_extensions = [
	\ 'coc-clangd',
	\ 'coc-java',
	\ 'coc-go',
    \ 'coc-jedi',
    \ 'coc-pyright',
	\ 'coc-rls',
	\ 'coc-html',
	\ 'coc-css',
	\ 'coc-tailwindcss',
	\ 'coc-tsserver',
	\ 'coc-eslint',
	\ 'coc-sql',
	\ 'coc-json',
	\ 'coc-yaml',
	\ 'coc-explorer',
	\ 'coc-snippets',
	\ 'coc-docker',
	\ 'coc-diagnostic',
	\ 'coc-gitignore',
	\ 'coc-import-cost',
	\ 'coc-lists',
	\ 'coc-omnisharp',
	\ 'coc-syntax',
	\ 'coc-tasks',
	\ 'coc-translator',
	\ 'coc-vimlsp',
	\ 'coc-yank']

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-a> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-a> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `<LEADER>[` and `<LEADER>]` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <LEADER>[ <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>] <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <LEADER>d to show documentation in preview window.
nnoremap <LEADER>d :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>k <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif


" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> -a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> -e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> -c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> -o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> -s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> -n  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> -p  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> -r  :<C-u>CocListResume<CR>

" +++ fzf
" nnoremap <c-p> :Leaderf file<CR>
noremap <silent> <C-d> :Files<CR>
noremap <silent> <C-l> :BLines<CR>
noremap <silent> <C-b> :Buffers<CR>
noremap <silent> <C-f> :Rg<CR>
noremap <silent> <C-h> :History<CR>
noremap <silent> <C-t> :BTags<CR>
noremap <silent> <C-c> :Color<CR>
" noremap <leader>; :History:<CR>

let g:fzf_preview_window = 'right:60%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }
" let g:fzf_layout = { 'down': '40%' }

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }


" +++ leaderf
" let g:Lf_PreviewInPopup = 1
" let g:Lf_PreviewCode = 1
" let g:Lf_ShowHidden = 1
" let g:Lf_ShowDevIcons = 1
" let g:Lf_UseVersionControlTool = 0
" let g:Lf_IgnoreCurrentBufferName = 1
" let g:Lf_WildIgnore = {
"         \ 'dir': ['.git', 'vendor', 'node_modules'],
"         \ 'file': ['__vim_project_root', 'class']
"         \}
" let g:Lf_UseMemoryCache = 0
" let g:Lf_UseCache = 0

" +++ rnvimr
" let g:rnvimr_ex_enable = 1
" let g:rnvimr_pick_enable = 1
" let g:rnvimr_draw_border = 0
" " let g:rnvimr_bw_enable = 1
" " highlight link RnvimrNormal CursorLine
" nnoremap <silent> R :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
" let g:rnvimr_action = {
"             \ '<C-t>': 'NvimEdit tabedit',
"             \ '<C-s>': 'NvimEdit split',
"             \ '<C-v>': 'NvimEdit vsplit',
"             \ 'gw': 'JumpNvimCwd',
"             \ 'yw': 'EmitRangerCwd'
"             \ }
" let g:rnvimr_layout = { 'relative': 'editor',
"             \ 'width': &columns,
"             \ 'height': &lines,
"             \ 'col': 0,
"             \ 'row': 0,
"             \ 'style': 'minimal' }
" let g:rnvimr_presets = [{'width': 1.0, 'height': 1.0}]

" +++ suda
cnoreabbrev sudowrite w suda://%
cnoreabbrev sw w suda://%

" +++ vim-go
let g:go_echo_go_info = 0
let g:go_doc_popup_window = 1
let g:go_def_mapping_enabled = 0
let g:go_template_autocreate = 0
let g:go_textobj_enabled = 0
let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 0
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 0
let g:go_highlight_variable_declarations = 0
let g:go_doc_keywordprg_enabled = 0

" +++ vim-markdown-toc
" let g:vmt_auto_update_on_save = 0
" let g:vmt_dont_insert_fence = 1
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'

" +++ vista
noremap <LEADER>v :Vista!!<CR>
noremap <c-t> :silent! Vista finder coc<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

" +++ rainbow
let g:rainbow_active = 1

" +++ indentLine
let g:indentLine_setColors = 0

" +++ wildfire
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "ip", "it"]

" terminal color
" " Terminal colors for seoul256 color scheme
if has('nvim')
  let g:terminal_color_0 = '#4e4e4e'
  let g:terminal_color_1 = '#d68787'
  let g:terminal_color_2 = '#5f865f'
  let g:terminal_color_3 = '#d8af5f'
  let g:terminal_color_4 = '#85add4'
  let g:terminal_color_5 = '#d7afaf'
  let g:terminal_color_6 = '#87afaf'
  let g:terminal_color_7 = '#d0d0d0'
  let g:terminal_color_8 = '#626262'
  let g:terminal_color_9 = '#d75f87'
  let g:terminal_color_10 = '#87af87'
  let g:terminal_color_11 = '#ffd787'
  let g:terminal_color_12 = '#add4fb'
  let g:terminal_color_13 = '#ffafaf'
  let g:terminal_color_14 = '#87d7d7'
  let g:terminal_color_15 = '#e4e4e4'
else
  let g:terminal_ansi_colors = [
    \ '#4e4e4e', '#d68787', '#5f865f', '#d8af5f',
    \ '#85add4', '#d7afaf', '#87afaf', '#d0d0d0',
    \ '#626262', '#d75f87', '#87af87', '#ffd787',
    \ '#add4fb', '#ffafaf', '#87d7d7', '#e4e4e4'
  \ ]
endif
