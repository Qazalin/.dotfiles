-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'folke/tokyonight.nvim'
    use 'github/copilot.vim'
    use 'mbbill/undotree'
    use 'junegunn/fzf.vim'
    use 'bluz71/vim-nightfly-guicolors'
    use 'vim-scripts/AutoComplPop'
    use 'rust-lang/rust.vim'
    use 'darrikonn/vim-gofmt'
    use 'tomlion/vim-solidity'
    use {'neoclide/coc.nvim', branch='release'}
    -- gql
    use 'jparise/vim-graphql'
    -- im a designer baby
    use 'chrisbra/Colorizer'
    use {'junegunn/fzf', run = 'fzf#install()' }

end)
