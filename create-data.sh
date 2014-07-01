#!/bin/bash

echo "creating data. this may take some time."
rm -f flat.js
rm -rf data

echo "console.time('node')" >> flat.js
mkdir -p data
for i in {0..10000};
do
	echo '{"id": "$i"}' > data/$i.json
	echo "require('./data/$i')" >> flat.js
	mkdir data/$i
	echo '{"id": $i}' > data/$i/$i.json
done
echo "console.timeEnd('node')" >> flat.js


DIR="data/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/"
mkdir -p $DIR

echo "console.time('node')" >> $DIR/nested.js
echo '{"id": "$i"}' > nested-testfile.json
echo "require('./../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../nested-testfile')" >> $DIR/nested.js
echo "console.timeEnd('node')" >> $DIR/nested.js


git clone https://github.com/npm/newww
cd newww && git reset --hard 3c6fd1ae706ac9fd6a48e97103d6867a02a3f8e6
npm install
node allPlugins.js install
echo "console.time('node')" | cat - server.js > /tmp/out && mv /tmp/out server.js
sed 's/log.info(.Hapi server started @ . + server.info.uri);/console.timeEnd("node");process.exit();/g' server.js > /tmp/out && mv /tmp/out server.js

echo "finished."
