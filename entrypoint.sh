#!/bin/sh
{ 
   service vsftpd start &&
    echo 'started'
} || { 
    echo 'ftp service started with warning'
}
while true; do sleep 1000; done
