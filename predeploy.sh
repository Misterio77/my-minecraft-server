#!/usr/bin/bash
git annex lock
git reset --hard
git pull
git annex sync
git annex get
git annex unlock
