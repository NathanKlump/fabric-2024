#!/bin/bash

cd /home/nathan/mc/fabric-2024/

git add . 
git commit -m "automated backup $(date)"
git push origin
