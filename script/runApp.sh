#!/bin/bash
echo "===============Config and run application"
cd
echo "===============Add replicate for Database"
mongo --port 27017  --authenticationDatabase "admin" -u "myUserAdmin" -p "ZB5BcwqG" <<EOF  
rs.initiate( {
   _id : "rs0",
   members: [
      { _id: 0, host: "127.0.0.1:27017" }
   ]
})
EOF

echo "===============conf02/mongod.conf "
sudo cp /home/myowner/myapp/database/conf02/mongod.conf  /etc/ <<EOF   
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

echo "===============Initial DBS"

mongoimport --db meteor -u "mydbs" -p "Kipy9Q5w" --collection siteinterfaces --port 27017 --file /home/myowner/myapp/database/siteinterfaces.json
mongoimport --db meteor -u "mydbs" -p "Kipy9Q5w" --collection plcinterfaces --port 27017 --file /home/myowner/myapp/database/plcinterfaces.json
mongoimport --db meteor -u "mydbs" -p "Kipy9Q5w" --collection modbusinterfaces --port 27017 --file /home/myowner/myapp/database/modbusinterfaces.json
mongoimport --db meteor -u "mydbs" -p "Kipy9Q5w" --collection taginterfaces --port 27017 --file /home/myowner/myapp/database/taginterfaces.json
mongoimport --db meteor -u "mydbs" -p "Kipy9Q5w" --collection objectsinterfaces --port 27017 --file /home/myowner/myapp/database/objectsinterfaces.json
mongoimport --db meteor -u "mydbs" -p "Kipy9Q5w" --collection screeninterfaces --port 27017 --file /home/myowner/myapp/database/screeninterfaces.json
mongoimport --db meteor -u "mydbs" -p "Kipy9Q5w" --collection taghistorian --port 27017 --file /home/myowner/myapp/database/taghistorian.json
mongoimport --db meteor -u "mydbs" -p "Kipy9Q5w" --collection alarmevent --port 27017 --file /home/myowner/myapp/database/alarmevent.json
mongoimport --db meteor -u "mydbs" -p "Kipy9Q5w" --collection cmdinterfaces --port 27017 --file /home/myowner/myapp/database/cmdinterfaces.json
mongoimport --db meteor -u "mydbs" -p "Kipy9Q5w" --collection biomasevent --port 27017 --file /home/myowner/myapp/database/biomasevent.json
mongoimport --db meteor -u "mydbs" -p "Kipy9Q5w" --collection tagdatahistorian --port 27017 --file /home/myowner/myapp/database/tagdatahistorian.json
mongoimport --db meteor -u "mydbs" -p "Kipy9Q5w" --collection material --port 27017 --file /home/myowner/myapp/database/material.json
echo "===============Run node-red"
cd
which node-red	
pm2 start /usr/bin/node-red -- -v	
cd $HOME/.node-red
npm install node-red-contrib-modbus
npm install node-red-contrib-buffer-parser
npm install node-red-contrib-omron-fins
npm install node-red-node-mongodb
npm install node-red-node-serialport
cd
sudo cp /home/myowner/myapp/gateway/.config.runtime.json  /home/myowner/.node-red/ <<EOF   
EOF
sudo cp /home/myowner/myapp/gateway/flows.json  /home/myowner/.node-red/ <<EOF   
EOF
sudo cp /home/myowner/myapp/gateway/settings.js  /home/myowner/.node-red/ <<EOF   
EOF
pm2 restart node-red
pm2 startup systemd          
echo "===============Run SCADA"
cd /home/myowner/myapp/NSCADA
pm2 start pm2-env.json <<EOF
EOF
pm2 save --force
echo "Application !"