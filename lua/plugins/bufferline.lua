return {
    "akinsho/bufferline.nvim", -- github links,github.com could be omitted 
    dependencies = {
        "nvim-tree/nvim-web-devicons", -- 依赖项
    },
    opts = {}, -- 要有这个才能被 lazy 给 setup
    keys = { -- 绑定快捷键
        { "<leader>bh", ":BufferLineCyclePrev<CR>", silent = true },
        { "<leader>bn", ":BufferLineCycleNext<CR>", silent = true },
        { "<leader>bd", ":bdelete<CR>", silent = true },
        { "<leader>bo", ":BufferLineCloseOthers<CR>", silent = true },
        { "<leader>bp", ":BufferLinePick<CR>", silent = true },
        { "<leader>bc", ":BufferLinePickClose<CR>", silent = true },
    }, -- <leader>:
    -- <CR>:
    -- slient:
    lazy = false, -- 所有插件默认懒加载 ，需要改为false避免懒加载，这个需要看情况而定
}
