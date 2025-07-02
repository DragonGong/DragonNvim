return {
    -- this plugin is used for auto pairing the parentheses such as { [ ( and so on  
   "windwp/nvim-autopairs", -- link 
    event = "InsertEnter", -- lazy load, when insert mode,plugin would be loaded 
    opts = {} -- for lazy setup 
}
