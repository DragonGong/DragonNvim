return {
    "folke/tokyonight.nvim",
    opt = {
        style = "night",
    },
    config = function ( _ , opt )
        require("tokyonight").setup(opts)
        vim.cmd("colorscheme tokyonight")
    end 
}
