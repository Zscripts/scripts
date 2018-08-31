#!/bin/bash
printf "


    ________                            _     
   / ____/ /_  ________________  ____  (_)____
  / /_  / / / / / ___/ ___/ __ \/ __ \/ / ___/
 / __/ / / /_/ (__  |__  ) /_/ / / / / / /__  
/_/   /_/\__,_/____/____/\____/_/ /_/_/\___/  
                                         -r00t       


This installer is for ubuntu/debian distros only. Execute with root permission.
Feel free to use, edit, redistribute, and credit this stupid author.

HAPPY STREAMING!!

"
wget -q -O - http://debian.erlyvideo.org/binary/gpg.key | apt-key add -;
echo "deb http://debian.erlyvideo.org binary/" > /etc/apt/sources.list.d/erlyvideo.list;
apt-get update;
apt-get -y install flussonic flussonic-ffmpeg flussonic-python;

/etc/init.d/flussonic restart;
status=`/etc/init.d/flussonic status`;
echo $status;

printf"
After installation update your license key in ' /etc/flussonic/license.txt' file.
or for a trial registration go to"
readlink -f "https://flussonic.com/prices/mediaserver"

END
