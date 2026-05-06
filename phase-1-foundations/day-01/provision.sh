#!/bin/bash
USER_NAME=$1
GROUP_NAME=$2
echo "Creating user $USER_NAME  and assigning to group $GROUP_NAME"   
groupadd $GROUP_NAME
useradd -m -G $GROUP_NAME $USER_NAME
mkdir /opt/${USER_NAME}_dir
chown $USER_NAME:$GROUP_NAME /opt/${USER_NAME}_dir
chmod 770  /opt/${USER_NAME}_dir
