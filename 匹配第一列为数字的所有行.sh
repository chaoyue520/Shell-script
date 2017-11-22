#!/bin/bash

cat a.txt | tr -d " "|awk -F '|' '$1!~/^[0-9]/' | more