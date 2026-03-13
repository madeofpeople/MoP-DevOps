#!/bin/bash

passwd() {
    USER_NAME=${1}
    CONTAINER_NAME=${2:-wp_staging}
    echo "new password:"
    read -s PWD
    docker exec -ti $CONTAINER_NAME wp user update $USERNAME --user-pass="$PWD" --allow-root
}

usercreate() {
    CONTAINER_NAME="${1:-wp_staging}" 
    NAME="${2}"
    EMAIL="${3}"
    ROLE="${4:-editor}"
    echo "Set password for user ${NAME}:"
    read -s PWD
    docker exec -ti $CONTAINER_NAME wp user create $NAME $EMAIL  --role=$ROLE --user_pass=$PWD --allow-root
    docker exec -ti $CONTAINER_NAME wp user get $NAME --allow-root;
}

userlist() {
    CONTAINER_NAME="${1:-wp_staging}" 
    docker exec -ti $CONTAINER_NAME wp user list --allow-root;
}
