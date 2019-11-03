#!/bin/bash

install_if_needed() {
    type $1 &> /dev/null || sudo apt install -y $1
}
