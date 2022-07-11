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


# ## openbox
# DIR=config/openbox
# FILE1=autostart
# FILE2=menu.xml
# FILE3=rc.xml

# if test -f "$DIR/$FILE1"; then
#     mv ~/.$DIR/$FILE1  ~/.$DIR/$FILE1.backup.$timestamp
#     ln -s $PWD/$DIR/$FILE1 ~/.$DIR/$FILE1
# fi

# if test -f "$DIR/$FILE2"; then
#     mv ~/.$DIR/$FILE2  ~/.$DIR/$FILE2.backup.$timestamp
#     ln -s $PWD/$DIR/$FILE2 ~/.$DIR/$FILE2
# fi

# if test -f "$DIR/$FILE3"; then
#     mv ~/.$DIR/$FILE3  ~/.$DIR/$FILE3.backup.$timestamp
#     ln -s $PWD/$DIR/$FILE3 ~/.$DIR/$FILE3
# fi

# ## tint2
# DIR=config/tint2
# FILE=tint2rc

# if test -f "$DIR/$FILE"; then
#     mv ~/.$DIR/$FILE  ~/.$DIR/$FILE.backup.$timestamp 
#     ln -s $PWD/$DIR/$FILE ~/.$DIR/$FILE
# fi


## superDirt
DIR=local/share/SuperCollider
FILE=startup.scd

putlink



