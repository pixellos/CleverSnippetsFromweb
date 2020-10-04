mkdir node_modules
cd node_modules
git clone --depth=1 https://github.com/mrdoob/three.js.git
cd three.js
npm install
npm build
cd ../..

npm install typescript@latest -g --force
tsc --watch