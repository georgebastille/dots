#!/bin/bash
find . -type f | awk -F . '{print $NF}' | sort | uniq -c | awk '{print $2,$1}' | sort -k 2 -g
