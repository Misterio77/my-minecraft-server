#!/usr/bin/bash
echo "Locking files"
git annex lock
echo "Resetting local repo"
git reset --hard
echo "Pulling changes"
git pull
echo "Grabbing annex files from remote"
git annex get
echo "Unlocking files"
git annex unlock

docker-compose build

git annex lock
