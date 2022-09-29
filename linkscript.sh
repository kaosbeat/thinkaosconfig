#!/bin/bash
echo "this script will overwrite some config files"
read -e -p "press CTRL-C to abort, 'Y' to continue  " ACK
echo "continue" $ACK

timestamp=`date '+%Y_%m_%d__%H_%M_%S'`;
my_link="testlink"


function linktest () {
    if [ -L ${my_link} ] ; then
        if [ -e ${my_link} ] ; then
            echo "Good link"
        else
            echo "Broken link"
        fi
    elif [ -e ${my_link} ] ; then
        echo "Not a link"
    else
    echo "Missing"
    fi
}

function putlink () {
    local myfile="${DIR}/${FILE}"
    local systemfile="/home/kaos/.${DIR}/${FILE}"
    ls -l $myfile
    ls -l $systemfile

    if [ -f ${myfile} ]; then
        if [ -L ${systemfile} ]; then
            echo "link in place"
        else
            if [ -f ${systemfile} ]; then 
                mv ~/.$DIR/$FILE  ~/.$DIR/$FILE.backup.$timestamp 
            fi
            ln -s $PWD/$DIR/$FILE ~/.$DIR/$FILE
        fi
    fi
}


## openbox
DIR=config/openbox
FILE=autostart
putlink
FILE=menu.xml
putlink
FILE=rc.xml
putlink

## tint2
DIR=config/tint2
FILE=tint2rc
putlink


## superDirt / supercollider
DIR=config/SuperCollider
FILE=startup.scd
putlink
FILE=superDirt_startup.scd
putlink



##tidal boot
echo "/home/kaos/.cabal/share/x86_64-linux-ghc-9.0.2/tidal-1.9.2/BootTidal.hs" 
eche "needs to be copied manually from config/tidal"