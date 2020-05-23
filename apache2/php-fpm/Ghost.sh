#!/bin/bash
# Adding php wrapper
user="$1"
domain="$2"
ip="$3"
#/home
home_dir="$4"
#Full route to /public_html
docroot="$5"


workingfolder="/home/$user/web/$domain"

cd $workingfolder

mkdir ghost
mkdir ghost/content
chmod 755 ghost
chown $user:$user ghost
chmod 755 ghost/content
chown $user:$user ghost/content 
cd ghost

echo "#!/bin/sh
docker rm -f $domain-ghost

docker run --name $domain-ghost \
 -p 127.0.0.1:2368:2368 \
 -e url=https://$domain \
 -v $workingfolder/ghost/content:/var/lib/ghost/content \
 --restart=always \
  -d ghost:latest" > create.sh
  
chmod +x create.sh
./create.sh

exit 0
