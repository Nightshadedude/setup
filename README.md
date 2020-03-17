To Create an install script:

touch post_install_script

sudo 775 post_install_script
or
chmod +x post_install_script

gedit post_install_script (gedit / nano / vim / text editor of choice)


When editing the script, "##" at the beginning of the line indicates a comment

install git so git clones work:
sudo apt install git
