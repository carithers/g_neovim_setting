
vim.g.linemode = 0

function _G:toggle_line_mode()
    if vim.g.linemode == 0 then
        vim.opt.relativenumber = true 
        vim.g.linemode = 1
    else
        vim.opt.relativenumber = false
        vim.g.linemode = 0
    end
end

vim.keymap.set('n', '<leader>n', '<cmd>lua toggle_line_mode()<CR>', { noremap = true, silent = true })
