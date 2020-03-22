#### As a reminder, this script assumes a fresh install of Debian or Ubuntu.

## How to use this script:
### 1. Install git so you can git clone:
sudo apt install git --yes

### 2. Clone this repo
git clone https://github.com/Nightshadedude/setup.git

### 3. Change directory into the repo:
cd setup

### 4. Make the install script executable:
chmod +x post_install_neovim

### 4a. Make any edits to the install script as necessary.

### 5. Run the install script:
./post_install

### 6. Post install steps:
  #### a. Setup ssh key for github:
  ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
  
  eval "$(ssh-agent -s)"
  
  ssh-add ~/.ssh/id_rsa
  
  (go to: https://help.github.com/en/enterprise/2.15/user/articles/adding-a-new-ssh-key-to-your-github-account )
  
  git config --global user.email "your_email@example.com"
  
  git config --global user.name "Your Name"

  #### b. Install Rust Language Server and Rust Analyzer for coc.nvim
  Open nvim
  
  :CocInstall -sync coc-rls coc-rust-analyzer
