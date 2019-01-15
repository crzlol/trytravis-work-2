#!/bin/bash
apt-get update
apt-get install -y ruby-full ruby-bundler build-essential
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
bash -c 'echo deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse > /etc/apt/sources.list.d/mongodb-org-3.2.list'
apt-get update
apt-get install -y mongodb-org
systemctl start mongod
systemctl enable mongod
su -c "git clone -b monolith https://github.com/express42/reddit.git" - kalinkin
su -c "cd reddit && bundle install" - kalinkin
cd /home/kalinkin/reddit && puma -d
