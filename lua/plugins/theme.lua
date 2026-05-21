
return {
  "navarasu/onedark.nvim",
  config = function()
    -- ==========================================
    -- ★ 修复核心：强制深色模式和真彩色
    -- ==========================================
    vim.opt.termguicolors = true  -- 1. 开启真彩色支持
    vim.opt.background = "dark"   -- 2. 强制深色模式（无视电脑系统的浅色主题）

    require('onedark').setup {
      style = 'dark', -- 确保使用深色变体
    }
    require('onedark').load()
  end,
}
