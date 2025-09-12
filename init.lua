
-- <leader> 按键
vim.g.mapleader = " "

-- 启用行号和相对行号
vim.opt.number = true
-- vim.opt.relativenumber = true
vim.keymap.set({'n','v'}, '<leader>n', '<cmd>set relativenumber!<CR>', { noremap = true, silent = true })

-- 滚动时留行数
vim.opt.scrolloff = 6

-- 缩进设置
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- 高亮当前行
vim.opt.cursorline = true

--永久启用块选择虚拟模式
vim.opt.virtualedit = "block"

-- 启用系统剪贴板
-- vim.opt.clipboard = "unnamedplus"

-- 用 / 搜索时不区分大小写, 智能区分
vim.opt.ignorecase = true
-- vim.opt.smartcase = true

-- 降低超时等待时间（默认 1000ms）
vim.o.timeoutlen = 500  -- 设置 300ms 内完成 jk 输入才触发

-- 基础映射（模式：n/i/v/x 等）
-- vim.keymap.set('n', '<Leader>w', ':w<CR>')  -- 保存文件

-- 更安全的映射（禁用递归）
-- vim.keymap.set('n', 'j', 'gj', { noremap = true, silent = true })
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('i', ';;', '<Esc>A;', { noremap = true, silent = true })

vim.keymap.set({'n','v'}, '<leader>y', [["+y]], { noremap = true, silent = true })
vim.keymap.set({'n','v'}, '<leader>p', [["+p]], { noremap = true, silent = true })


-- 'o' 操作符待决模式, 才可使如:dgl=d$
vim.keymap.set({'n','v','o'}, 's', [[<Nop>]], { noremap = true, silent = true })
vim.keymap.set({'n','v','o'}, 'sl', [[$]], { noremap = true, silent = true })
vim.keymap.set({'n','v','o'}, 'sh', [[^]], { noremap = true, silent = true })
vim.keymap.set({'n','v','o'}, 'sj', [[*]], { noremap = true, silent = true })
vim.keymap.set({'n','v','o'}, 'sk', [[#]], { noremap = true, silent = true })
vim.keymap.set({'n','v','o'}, 'ss', [[%]], { noremap = true, silent = true })
-- sy复制单词或其它方法复制, 用sp,s',s",s(,s[,s{可以替换里面的内容
vim.keymap.set('n', 'sy', 'viwy', { noremap = true, silent = true })
vim.keymap.set('n', 'sp', [[viw"0p]], { noremap = true, silent = true })
vim.keymap.set({'n'}, [[s']], [[vi'"0p]], { noremap = true, silent = true })
vim.keymap.set({'n'}, [[s"]], [[vi""0p]], { noremap = true, silent = true })
vim.keymap.set({'n'}, 's(', [[vi("0p]], { noremap = true, silent = true })
vim.keymap.set({'n'}, 's[', [[vi["0p]], { noremap = true, silent = true })
vim.keymap.set({'n'}, 's{', [[vi{"0p]], { noremap = true, silent = true })

vim.keymap.set('v', 'sp', [["0p]], { noremap = true, silent = true })


-- 启用折叠功能
vim.opt.foldenable = true
-- 设置默认折叠方式（可选: indent, syntax, marker, expr, manual）
-- vim.opt.foldmethod = "indent"  -- 根据缩进折叠（适合 Python 等语言）
-- 默认展开所有折叠（设置折叠级别为最高）
--- 检查是否存在 VSCode 变量
if vim.g.vscode then
    -- 如果存在 VSCode，则创建键映射以调用 VSCode 的命令
    -- 折叠相关的操作
    vim.keymap.set("n", "zR", '<cmd>lua require("vscode-neovim").action("editor.unfoldAll")<cr>', { noremap = true, silent = true })
    vim.keymap.set("n", "zM", '<cmd>lua require("vscode-neovim").action("editor.foldAll")<cr>', { noremap = true, silent = true })
    vim.keymap.set("n", "zo", '<cmd>lua require("vscode-neovim").action("editor.unfold")<cr>', { noremap = true, silent = true })
    vim.keymap.set("n", "zc", '<cmd>lua require("vscode-neovim").action("editor.fold")<cr>', { noremap = true, silent = true })
    vim.keymap.set("n", "za", '<cmd>lua require("vscode-neovim").action("editor.toggleFold")<cr>', { noremap = true, silent = true })
	-- 按j或k的时候可以不自动展开已经折叠的内容
	return { require("vscode_conf") }
else
    -- 如果不存在 VSCode，执行普通的 Neovim 配置
    -- 在这里添加普通的 Neovim 配置
end

-- 禁用o新行自动注释
-- 使用 :verbose set formatoptions? 来查看最好更改位置发现:
-- Last set from C:\Program Files\Neovim\share\nvim\runtime\ftplugin\lua.vim line 30
-- 如果是vscode-neovim里面: Last set from c:\program files\neovim\share\nvim\runtime\ftplugin\c.vim line 24
-- 在上述文件里面更改了, 导致下面的配置无法生效,所以去文件里面吧o去掉就可以了
-- vim.opt.formatoptions = vim.opt.formatoptions:remove("o")
-- vim.cmd [[set formatoptions-=o]]

-- 组合映射
--[[ vim.keymap.set('n', '<C-p>', function()
  require('telescope.builtin').find_files()
end, { desc = "查找文件" }) ]]
