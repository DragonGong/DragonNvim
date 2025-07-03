    return{
        -- introduction
        -- Later, the LSP (Language Server Protocol) was invented, leading code completion down two distinct paths.

        -- One of these paths is what I initially used when I started with Vim: the Coc.nvim plugin. Developed by Chinese developer Zhao Qiming, this plugin essentially communicates with LSPs as we described earlier. However, it does not rely on Neovim's built-in LSP functionality—since Neovim had not yet supported LSP when this plugin was released. Instead, it implements its own logic in Node.js to handle communication between LSPs and Neovim. As a result, Coc.nvim functions as an all-in-one plugin, encompassing LSP installation, communication with language servers, and utilizing LSP response results for code completion. Thanks to its independence from Neovim's LSP, this plugin can even be used in Vim.
        -- The other path emerged after Neovim introduced built-in LSP support. The multiple modules previously handled by Coc.nvim were split into separate components: for LSP installation, plugins like nvim-lsp-installer appeared (later replaced by Mason, developed by the same author); for code completion, various completion engines emerged, starting with nvim-compe, followed by its author's rewrite nvim-cmp, coq, and the latest Rust-based blink.
        -- code completion plugin 
        -- https://cmp.saghen.dev/
        "saghen/blink.cmp",
        -- version is used for pre-built binaries  
        version = "*",
        dependencies = {
            -- code templete completion plugin 
            "rafamadriz/friendly-snippets"
        },
        event = "VeryLazy",
        opts = {
            completion = {
                documentation = {
                    -- show documentation 
                    auto_show  = true,
                }
            },
            keymap = {
                -- select the keymap configuration 
                preset = "super-tab"
            },
            sources = {
                -- select the sources of the prompt contents 
                default = { "path", "snippets", "buffer", "lsp"},
            },
            -- cmd completion 
            cmdline = {
                sources = function ()
                    -- cmd_type is '/' or '?' or ':' in cmd 
                    local cmd_type = vim.fn.getcmdtype()
                    if cmd_type == "/"  then 
                        return {"buffer"}
                    end 
                    if cmd_type == ":" then 
                        return {"cmdline"}
                    end 
                    return {}
                end,
                keymap = {
                    preset = "super-tab"
            },
            completion = {
                menu = {
                    auto_show = true 
                }
            },
        }
    },
}
