-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'github/copilot.vim'
    use 'mbbill/undotree'
    use 'junegunn/fzf.vim'

    -- colors
    use 'bluz71/vim-nightfly-guicolors'
    use 'folke/tokyonight.nvim'
    use 'mhartington/oceanic-next'

    use 'vim-scripts/AutoComplPop'
    use 'rust-lang/rust.vim'
    use 'darrikonn/vim-gofmt'
    use 'tomlion/vim-solidity'
    use {'neoclide/coc.nvim', branch='master', run='yarn install --frozen-lockfile'}
    -- gql
    use 'jparise/vim-graphql'
    -- im a designer baby
    use 'chrisbra/Colorizer'
    use {'junegunn/fzf', run = 'fzf#install()' }

end)
