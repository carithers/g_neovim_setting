-- 文件：lua/plugins/treesitter-context.lua

return {
  "nvim-treesitter/nvim-treesitter-context",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("treesitter-context").setup({
      enable = true,            -- 启用插件
      max_lines = 4,            -- 顶部最多显示的上下文行数
      min_window_height = 0,    -- 启用插件所需的最小窗口高度
      line_numbers = true,      -- 在上下文窗口显示行号
      multiline_threshold = 1, -- 单个上下文块的最大行数
      trim_scope = 'outer',     -- 当显示的上下文超过 max_lines 时，优先裁切最外层
      mode = 'cursor',          -- 根据光标位置计算上下文
      separator = nil,          -- 可以在上下文和正文之间加一条分割线，例如 separator = '-'
    })

    --[[
    -- 快捷键配置：按 [c 跳转到上方固定住的函数头部
    vim.keymap.set("n", "[c", function()
      require("treesitter-context").go_to_context(vim.v.count1)
    end, { silent = true, desc = "跳转到当前上下文头部" })
    ]]--
  end
}
