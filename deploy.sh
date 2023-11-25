#!/bin/sh
hugo 
rm -rf public/_includes
rsync -avz --delete public/ ${USER}@${HOST}:~/${FCK}
hugo --config config-gosh.toml 
rm -rf public/_includes
rsync -avz --delete public/ ${USER}@${HOST}:~/${GOSH}

exit 0
