#!/bin/bash
set -e

# Function to check and install Xcode Command Line Tools
install_xcode_clt() {
  echo "Checking for Xcode Command Line Tools..."
  if ! xcode-select -p &>/dev/null; then
    echo "Xcode Command Line Tools not found. Installing..."
    xcode-select --install
    echo "Xcode Command Line Tools installed successfully!"
  else
    echo "Xcode Command Line Tools already installed."
  fi
}

# Function to install Homebrew (if not installed)
install_homebrew() {
  if ! command -v brew &> /dev/null; then
    echo "Homebrew not found."
    # Install xCode cli tools
    install_xcode_clt
    
    # Install Homebrew
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH
    echo "Adding Homebrew to PATH..."
    eval "$(/opt/homebrew/bin/brew shellenv)"  # Apple Silicon
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
    # Intel Macs (Uncomment if using Intel)
    # eval "$(/usr/local/bin/brew shellenv)"
    # echo 'eval "$(/usr/local/bin/brew shellenv)"' >> ~/.zshrc
  else
    echo "Homebrew already installed. Updating..."
    brew update
    brew upgrade
  fi
}

# Homebrew Formulae
install_brew_formulae() {
  echo "Installing Brew Formulae..."

  ### Essentials
  brew install \
    git \
    wget \
    tree \
    nvm \
    python \
    fastfetch \
    visual-studio-code \
    docker \
    postman \
    node \
    mas \
    gh \
    koekeishiya/formulae/skhd \
    sketchybar \
    borders \
    yabai

  ### Terminal
  brew install \
    vim \
    neovim \

  echo "Homebrew Formulae installed."
}

# Homebrew Cask
install_brew_cask() {
  echo "Installing Brew Cask..."

  ### Essentials
  brew install --cask \
    alfred \

  ### Terminals
  brew install --cask \
    kitty \
    neovim \

  ### Dev Tools
  brew install --cask \
    docker \
    visual-studio-code \

  ### Browsers
  brew install --cask \
    google-chrome \
    vladdoster/formulae/vimari \

  ### Music
  brew install --cask \
    spotify \

  ### Messenger
  brew install --cask \
    discord \
    slack \

  echo "Homebrew Cask installed."
}

# Function to set up system preferences
setup_system_preferences() {
  echo "Setting up system preferences..."

  # Enable Finder to show all files
  defaults write com.apple.finder AppleShowAllFiles YES
  killall Finder

  # Enable Safari developer menu
  defaults write com.apple.Safari IncludeDevelopMenu -bool true

  # Show file extensions in Finder
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true

  # Disable system sleep
  sudo systemsetup -setcomputersleep Never

  # Auto-hide dock
  defaults write com.apple.dock autohide -bool true

  # Enable dark mode
  defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

  echo "System preferences set."
}

# Function to set up a new user environment
setup_user_environment() {
  echo "Setting up user environment..."

  # Set default shell to Zsh
  chsh -s /bin/zsh

  # Set up NVM and Node version
  echo "source $(brew --prefix nvm)/nvm.sh" >> ~/.zshrc
  source ~/.zshrc
  nvm install --lts
  nvm use --lts

  # Install some global npm packages
  npm install -g yarn eslint prettier

  ## Setup Python environment with pyenv (optional)
  #if ! command -v pyenv &> /dev/null; then
  #  echo "Installing pyenv..."
  #  brew install pyenv
  #fi
  #pyenv install 3.9.7
  #pyenv global 3.9.7

  echo "User environment setup complete."
}

# Perform cleanup
cleanup() {
  echo "Cleaning up..."

  # Remove any unnecessary files and caches
  brew cleanup
  rm -rf ~/Library/Caches/*

  echo "Cleanup done."
}

# Copy config files
copy_config() {
  echo "Planting Configuration Files..."
  [ ! -d "$HOME/dotfiles" ] && git clone --bare git@github.com:kevinkli916/dotfiles.git $HOME/dotfiles
  git --git-dir=$HOME/dotfiles/ --work-tree=$HOME checkout master
}

# Start services
start_services() {
  echo "Starting services (grant permissions)..."
  brew services start skhd
  brew services start yabai
  brew services start sketchybar
  brew services start borders
}

# Run all functions
install_homebrew
install_brew_formulae
install_brew_cask
setup_system_preferences
setup_user_environment
cleanup

csrutil status
echo "(optional) Disable SIP for advanced yabai features."
echo "(optional) Add sudoer manually:\n '$(whoami) ALL = (root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | awk "{print \$1;}") $(which yabai) --load-sa' to '/private/etc/sudoers.d/yabai'"
echo "Installation complete...\n"
