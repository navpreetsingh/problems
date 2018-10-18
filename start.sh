cd Downloads
sudo dpkg -i vstudio_x64_8_lin.deb
sudo dpkg -i gitkraken-amd64.deb
wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
sudo tar -xzf postman.tar.gz -C /opt
sudo ln -s /opt/Postman/Postman /usr/bin/postman
cat > ~/.local/share/applications/postman.desktop <<EOL
[Desktop Entry]
Encoding=UTF-8
Name=Postman
Exec=postman
Icon=/opt/Postman/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;
EOL

sudo apt install git
sudo apt install git-cola -y 
sudo apt install gitk -y
git config --global user.name "Navpreet Singh"
git config --global user.email "navpreet.singh.k@gmail.com"

sudo apt-get install curl -y
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable --ruby
rvm get stable --autolibs=enable
rvm install ruby

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
sudo apt-get install build-essential libssl-dev
source ~/.bashrc
nvm install --lts

sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
