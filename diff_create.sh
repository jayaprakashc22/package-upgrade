#!/bin/bash
mkdir ~/.jfrog/
cp jfrog-cli.conf ~/.jfrog/
#git checkout b8.0
git checkout $1
git pull
git submodule update
arc feature pack-upgrade-$(date '+%Y-%m-%d')-$1
cdm/tools/update_package.py --file package1.txt --all
git commit -m "package upgrades"
python3 -m pip install isort==5.10.1
arc diff
