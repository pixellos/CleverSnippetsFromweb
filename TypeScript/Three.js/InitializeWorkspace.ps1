mkdir node_modules
cd node_modules
git clone --depth=1 https://github.com/mrdoob/three.js.git
cd three.js
npm install
npm build
cd ../..
set-content -path .\tsconfig.json -Value '
{
    "compilerOptions": {
        "module": "amd",
        "sourceMap": true,
        "target": "es5",
        "outDir": ".",
        "lib": [
            "dom",
            "es2015"
        ],
		"moduleResolution": "classic",
		
    }
}';
