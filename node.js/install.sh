#!/bin/bash

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

nvm install --lts

npm config set registry https://registry.npm.taobao.org
npm config set puppeteer_download_host https://npm.taobao.org/mirrors
npm config set electron_mirror https://npm.taobao.org/mirrors/electron/
npm config set sass-binary-site https://npm.taobao.org/mirrors/node-sass



npm i -g npm yarn electron-builder
