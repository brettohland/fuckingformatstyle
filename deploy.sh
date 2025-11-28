#!/bin/sh

echo "Generating fuckingformatstyle"
hugo 
rm -rf public/_includes
./markup.sh public
rsync -avz --delete public/ ${USER}@${HOST}:~/${FCK}
echo "Fuckingformatstyle.com is updated"

echo "Generating goshdarnformatstyle"
hugo --config config-gosh.toml 
rm -rf public/_includes
./markup.sh public
rsync -avz --delete public/ ${USER}@${HOST}:~/${GOSH}
echo "Goshdarnformatstyle.com is updated"

exit 0
