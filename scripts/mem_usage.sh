#!/bin/bash
top -b -n 1 | awk 'NR>7 { sum += $10;  } END { print sum;  }'
