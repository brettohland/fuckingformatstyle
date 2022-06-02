#!/bin/sh
USER=ff6600
HOST=lunenburg.dreamhost.com             
FCK=fuckingformatstyle.com
GOSH=goshdarnformatstyle.com

hugo --destination public/${FCK} && rsync -avz --delete public/${FCK} ${USER}@${HOST}:~/${FCK}
hugo --destination public/${FCK} --confic config-gosh.toml --destination public/${GOSH} && rsync -avz --delete public/${GOSH} ${USER}@${HOST}:~/${GOSH}

exit 0
