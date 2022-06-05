#!/bin/sh
hugo 
rm -rf public/_includes
cp keybase/${FCK}/keybase.txt public/keybase.txt
rsync -avz --delete public/ ${USER}@${HOST}:~/${FCK}
hugo --config config-gosh.toml 
rm -rf public/_includes
cp keybase/${GOSH}/keybase.txt public/keybase.txt
rsync -avz --delete public/ ${USER}@${HOST}:~/${GOSH}

exit 0
