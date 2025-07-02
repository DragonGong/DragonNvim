local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" -- define the installation path 


-- auto install the lazy.nvim (a tool for plugin management)
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

-- prepend the lazypath fronter than nvim ,for preloading lazy.nvim from nvim
vim.opt.rtp:prepend(lazypath)


-- define the plugins luas path for import 
require("lazy").setup({
    spec = {
        {import = "plugins"}, 
    },
})

