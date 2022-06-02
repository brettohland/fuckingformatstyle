#!/bin/sh
USER=ff6600
HOST=lunenburg.dreamhost.com             
FCK=fuckingformatstyle.com
GOSH=goshdarnformatstyle.com

hugo 
rm -rf public/_includes
rsync -avz --delete public/ ${USER}@${HOST}:~/${FCK}
hugo --config config-gosh.toml 
rm -rf public/_includes
rsync -avz --delete public/ ${USER}@${HOST}:~/${GOSH}

exit 0
