#!/bin/bash



timestamp=`date '+%Y_%m_%d__%H_%M_%S'`;
## check if the config files exsist

## openbox
DIR=config/openbox
FILE1=autostart
FILE2=menu.xml
FILE3=rc.xml

if test -f "$DIR/$FILE1"; then
    mv ~/.$DIR/$FILE1  ~/.$DIR/$FILE1.backup.$timestamp
    mv $DIR/$FILE1 ~/.$DIR/$FILE1
fi

if test -f "$DIR/$FILE2"; then
    mv ~/.$DIR/$FILE2  ~/.$DIR/$FILE2.backup.$timestamp
    mv $DIR/$FILE2 ~/.$DIR/$FILE2
fi

if test -f "$DIR/$FILE3"; then
    mv ~/.$DIR/$FILE3  ~/.$DIR/$FILE3.backup.$timestamp
    mv $DIR/$FILE3 ~/.$DIR/$FILE3
fi

## tint2
DIR=config/tint2
FILE=tint2rc

if test -f "$DIR/$FILE"; then
    mv ~/.$DIR/$FILE  ~/.$DIR/$FILE.backup.$timestamp 
    mv $DIR/$FILE ~/.$DIR/$FILE
fi


