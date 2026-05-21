
-- vim.notify("Neovide 专属配置已加载!")

if vim.g.neovide then
    -- 使用这种写法最稳定：前 6 位是 One Dark 背景色(#282c34)，后 2 位是透明度(e6)
    vim.g.neovide_background_color = "#282c34e6"

    -- 注释掉这行，不需要单独设置 transparency 变量了
    -- vim.g.neovide_transparency = 0.90 

    vim.g.neovide_refresh_rate = 60
    vim.g.neovide_cursor_animation_length = 0.13
end
