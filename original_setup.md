This is the GO + VSCode setup

As Root ("su -"):
usermod -aG sudo <username> 
<RESTART>

As user:
sudo apt update

sudo apt-get install curl

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg

sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/

sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt-get install apt-transport-https

sudo apt-get update

sudo apt-get install code

sudo apt-get install git

ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

sudo apt install xclip xsel

xclip -selection clipboard < ~/.ssh/id_rsa.pub (this copies key to clipboard)
add to Github account SSH keys

cd $HOME/Downloads

wget https://dl.google.com/go/go1.12.7.linux-amd64.tar.gz

sudo tar -C /usr/local -xzf go1.12.7.linux-amd64.tar.gz

add following to $HOME/.profile or possibly ~/.bash_profile
export PATH=$PATH:/usr/local/go/bin
<RESTART>

wget https://raw.githubusercontent.com/eduncan911/dotfiles/master/bin/upgrade-go.sh

chmod +777 upgrade-go.sh

./upgrade-go.sh


git clone <repo>

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 

sudo sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

sudo apt-get update

sudo apt-get install google-chrome-stable

sudo apt install build-essential

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
