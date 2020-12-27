#!/usr/bin/bash
#doco_dir="/srv/minecraft/server"
doco_dir="/home/misterio/Documents/Minecraft/Server"
backup_dirs="worlds"
dest_dir="/mnt/backups/minecraft/worlds"
archive_name="$(date +%Y_%m_%d_%H.%M.%S).tar.gz"

cd $doco_dir
docker-compose ps --services | \
while read service; do
    docker-compose exec -T $service rcon-cli save-off &> /dev/null
    docker-compose exec -T $service rcon-cli save-all &> /dev/null
done

tar cfv - $backup_dirs | gzip --fast - > "$dest_dir/$archive_name"

docker-compose ps --services | \
while read service; do
    docker-compose exec -T $service rcon-cli save-on &> /dev/null
done
