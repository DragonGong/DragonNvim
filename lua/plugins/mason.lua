return {
    -- mason is for lsp server management 
    "mason-org/mason.nvim", 
    -- verylazy is for lazy load with unkown condition 
    event = "VeryLazy",
    dependencies = {
        "neovim/nvim-lspconfig", -- lspconfig, a config management for language servers 
        "mason-org/mason-lspconfig", -- provide a map for connection of lsp key names between nvim-lspconfig and mason 
    },
    opts = {},
    config = function(_ , opts)
         require("mason").setup(opts) -- setup mason before  
         local registry = require("mason-registry") -- get registry , same as the list by typing :Mason at command  
         -- encapsulation for any lsp setup with config 
        local function setup(server_name,config)
            local success , package = pcall(registry.get_package,server_name)
            if success and not package:is_installed() then 
                package:install()
            end 
          -- get the key name in lspconfig by the keymap inserted in mason-lspconfig , e.g.  nvim-lsp is  
            local nvim_lsp = require("mason-lspconfig").get_mappings().package_to_lspconfig[server_name]
            vim.lsp.config(nvim_lsp,config)
        end 

        -- Notice:some lsps need npm coupled with node.js,with nvm installed on macos and linux ,or node.js on windows  
        -- e.g. on macOS install nvm and use lts node.js 
        -- curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
        -- source ~/.zshrc
        -- nvm install --lts
        -- nvm use --lts
        -- npm --version
        setup("lua-language-server",{
            settings = {
                Lua = {
                    diagnostics = {
                        globals =  { "vim"},
                    },
                },
            },
        })
        setup("pyright",{})
        setup("html-lsp",{})
        setup("css-lsp",{})
        setup("typescript-language-server",{})
        setup("emmet-ls",{})
        --  Note: config is read before the mason plugin setup when lsp is not started yet ,
        --  Note: this may cause that after typing :LspInfo  commmand,there are no client running such as lua_ls client 
        vim.cmd("LspStart")
        vim.diagnostic.config({
            update_in_insert = true, -- show the diagnostic in real time 
        })
    end,

}
