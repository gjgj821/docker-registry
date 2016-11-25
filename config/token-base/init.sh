#!/bin/bash
echo -n "Username:";
read user;
read -s -p "Password:" passwd;
echo "";
touch ./auth.htpasswd;
chmod 777 ./auth.htpasswd;
docker run -v "`pwd`:/data" --rm --entrypoint htpasswd registry:2 -Bb "/data/auth.htpasswd" "$user" "$passwd";
chmod 644 ./auth.htpasswd;
