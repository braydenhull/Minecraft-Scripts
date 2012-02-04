#!/bin/bash
LATEST_VER=`curl http://ess.khhq.net/build/build.php?build=bt2 | sed 's/\.//g'`
CURRENT_VER=`cat ~/minecraft/.ess_ver`
if [ "${LATEST_VER}" -gt "${CURRENT_VER}" ]; then
    screen -p 0 -S minecraft -X stuff "`printf "stop\r"`"
    rm ~/minecraft/plugins/Essentials*.jar
    wget http://ci.ess3.net/guestAuth/repository/download/bt2/.lastSuccessful/Essentials-full.zip
    unzip Essentials-full.zip -d ~/minecraft/plugins/
    screen -p 0 -S minecraft -X stuff "`printf "./minecraft.sh\r"`"
    echo ${LATEST_VER} > ~/minecraft/.ess_ver
    rm Essentials-full.zip
fi