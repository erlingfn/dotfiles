#!/bin/bash

install_if_needed() {
    $1 &> /dev/null
    if [ ! $? -eq 0 ]
    then
        sudo apt install -y $1
    fi
}
