#!/bin/bash

# clean
flutter clean

#build web app
flutter build web --release --web-renderer canvaskit --dart-define-from-file=env.json

#go to web folder
cd build/web || exit

# move and overwrite all files in current folder to web_build folder
cp -r * ../../web_builder

# go to web_build folder
cd ../../web_builder || exit

#git add
git add .

#commit with date
git commit -m "deploy-web: $(date)"

#pull from github
git pull origin main

#push to github
git push -u origin main
