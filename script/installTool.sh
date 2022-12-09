#!/bin/bash
echo "Doing some Bash script work first"
echo "===============Cài đặt thời gian"
timedatectl set-timezone Asia/Ho_Chi_Minh
echo "===============Cài đặt Nodejs 12"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
export NVM_DIR=$HOME/.nvm;
source $NVM_DIR/nvm.sh;    
nvm install v12  <<EOF
EOF
nvm use v12 <<EOF
EOF
node -v
echo "===============Cài đặt Node-red"
nvm use v12
npm install -g --unsafe-perm node-red
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
https://repo.mongodb.org/apt/ubuntu/dists/focal/mongodb-org/4.4/multiverse/binary-amd64/mongodb-org-server_4.4.8_amd64.deb
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.8.list
sudo apt-get update
sudo apt-get install -y mongodb-org=4.4.8 mongodb-org-server=4.4.8 mongodb-org-shell=4.4.8 mongodb-org-mongos=4.4.8 mongodb-org-tools=4.4.8
sudo systemctl enable mongod.service
sudo service mongod start
echo "===============Cài đặt trình chạy dự án"
npm install -g pm2	
npm i -g pm2-meteor	
echo "===============Mở port cho máy Ubuntu"
sudo ufw enable
sudo ufw status verbose
sudo ufw allow 3020/tcp
sudo ufw allow 1880/tcp
sudo ufw allow 3880/tcp
cd
git config --global --unset https.proxy
git clone https://github.com/HoangMinhPhuong/myapp.git
cd myapp/NSCADA/
tar -xvzf bundle.tar.gz   
tar -xvzf /home/myowner/myapp/NSCADA/node_modules.tar.gz -C /home/myowner/myapp/NSCADA/bundle/programs/server
cd 
nvm use v12
echo "===============Initial Mongodb"
cd
nvm use v12
echo "===============Create admin account"
mongo --port 27017 <<EOF
use admin
db.createUser(
  {
    user: "myUserAdmin",
    pwd: "ZB5BcwqG",
    roles: [ { role: "userAdminAnyDatabase", db: "admin" }, "readWriteAnyDatabase" ]
  }
);
db.createUser({user: "root",pwd: "311229120510",roles: [ { role: "root", db: "admin" } ]})
EOF
mongo --port 27017  --authenticationDatabase "admin" -u "myUserAdmin" -p "ZB5BcwqG" <<EOF  
db.createUser(
  {
    user: "oplogger",
    pwd: "ZB5BcwqG",
    roles: [ { role: "read", db: "local" } ]
  }
);
EOF
echo "===============Create user account"
mongo --port 27017  --authenticationDatabase "admin" -u "myUserAdmin" -p "ZB5BcwqG" <<EOF   
use meteor
db.createUser(
  {
    user: "mydbs",
    pwd: "Kipy9Q5w",
    roles: [ { role: "readWrite", db: "meteor" }]
  }
)
EOF
echo "===============conf01/mongod.conf "
sudo cp /home/myowner/myapp/dbs/conf01/mongod.conf  /etc/ <<EOF  
EOF
 
sudo service mongod stop <<EOF   
sleep 10 &
EOF
sudo service mongod start <<EOF   
sleep 10 &
EOF
sudo service mongod status <<EOF   
EOF
wait
bash /home/myowner/data/./runApp.sh
echo "Doing some more Bash script work afterwards"