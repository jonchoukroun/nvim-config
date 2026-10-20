-- cpp.vim sources c ftplugins
if vim.bo.filetype ~= "c" then
    return
end

vim.treesitter.start()
