#!/bin/sh

echo "Generating fuckingformatstyle"
hugo 
./markup.sh public
rm -rf public/_includes
rsync -avz --delete public/ ${USER}@${HOST}:~/${FCK}
echo "Fuckingformatstyle.com is updated"

echo "Generating goshdarnformatstyle"
hugo --config config-gosh.toml 
./markup.sh public
rm -rf public/_includes
rsync -avz --delete public/ ${USER}@${HOST}:~/${GOSH}
echo "Goshdarnformatstyle.com is updated"

exit 0
