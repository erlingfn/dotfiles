#!/bin/bash
top -bn 2  -d 0.01 | grep '^%Cpu' | tail -n 1 | awk '{printf "CPU usage: %s%%", $2+ $4 + $6 }'


