# packages
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
brew install stow tmux neovim fzf wget

# setup dotfiles
cd ~ && git clone https://github.com/Qazalin/.dotfiles.git && cd ~/.dotfiles 
stow zsh && stow nvim && stow tmux

# node
curl -fsSL https://fnm.vercel.app/install | bash
curl -fsSL https://get.pnpm.io/install.sh | sh -

# zsh theme
git clone https://github.com/Qazalin/021011.zsh-theme.git
mv ~/021011-tools/021011.zsh-theme $ZSH/themes/021011.zsh-theme

# nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# ssh + github
mkdir ~/.ssh
ssh-keygen -t ed25519 -C "github"
vim Users/qazal/.ssh/id_ed25519.pub
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat /Users/qazal/.ssh/id_ed25519 | pbcopy


# stuff that's not automated yet
 echo "- [ ] PackerSync required"
 echo "- [ ] Add ssh to github copied to gh"
