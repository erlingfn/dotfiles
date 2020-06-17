#!/bin/bash
top -b -n 1 | awk 'NR>7 { sum += $9;  } END { print sum;  }'
