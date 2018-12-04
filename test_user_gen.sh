#!/bin/bash

echo "
foreach n (`seq -f 'egg%04g' 1 5`)
    pw useradd $n -s /sbin/nologin -w random
end" >> pwuser.csh;

csh pwuser.csh;


