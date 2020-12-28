#!/usr/bin/bash

# Working directory with docker-compose
doco_dir="/srv/minecraft/server"

# Which directories to backup (relative to doco_dir)
backup_dirs="worlds"

# Where to save the backups
dest_dir="/mnt/backups/minecraft/server"

# Which servers to disable save while backuping
servers="lobby modpack survival modpack-e2es"

# Database container name
database="database"

# Name for the files
file_name="$(date +%Y_%m_%d_%H.%M.%S)"

cd $doco_dir
source .env

echo "Generating db dump"
docker-compose exec database mysqldump --user ${DB_USERNAME} --password=${DB_PASSWORD} ${DB_NAME} > "$dest_dir/$file_name.dump"

echo "Stopping autosave and saving"
for service in $servers; do
    docker-compose exec -T $service rcon-cli save-off &> /dev/null
    docker-compose exec -T $service rcon-cli save-all &> /dev/null
done

echo "Creating archive"
tar cf - $backup_dirs | gzip --fast - > "$dest_dir/$file_name.tar.gz"

echo "Enabling autosave"
for service in $servers; do
    docker-compose exec -T $service rcon-cli save-on &> /dev/null
done
