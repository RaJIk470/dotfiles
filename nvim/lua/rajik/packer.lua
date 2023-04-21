vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1', requires = { {'nvim-lua/plenary.nvim'} }
    }
    --use({ 'rose-pine/neovim', as = 'rose-pine', config = 
    --function()
        --vim.cmd('colorscheme rose-pine')
        --end
        --})
        use({ 'rebelot/kanagawa.nvim', as = 'kanagawa', config = 
        function()
            vim.cmd('colorscheme kanagawa-dragon')
            vim.api.nvim_set_hl(0, 'LineNr', {bg = "#181616"})
        end
    })
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            {'neovim/nvim-lspconfig'},             
            {                                     
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            {'williamboman/mason-lspconfig.nvim'},
            {'hrsh7th/nvim-cmp'},     
            {'hrsh7th/cmp-path'},     
            {'hrsh7th/cmp-cmdline'},     
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},   
        }
    }
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use 'norcalli/nvim-colorizer.lua'

    --use 'nvim-tree/nvim-tree.lua'
    --use 'nvim-tree/nvim-web-devicons'
    --use 'neovim/nvim-lspconfig'
    --use 'mfussenegger/nvim-jdtls'

end)
