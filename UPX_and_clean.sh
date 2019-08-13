#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "FAIL! No arguments supplied."
    echo "./UPX_and_clean.sh <filename>"
  else
    upx -9 -o $1.upx $1
    sed 's/UPX!/    /g' $1.upx | sed 's/This file is packed with the UPX executable packer http:\/\/upx.sf.net/
                                  /g' | sed 's/UPX .... Copyright (C) 1996-2018 the UPX Team. All Rights Reserved./
                                     /g' >$1.cleancompress
    rm -f $1.upx
    chmod +x $1.cleancompress
fi
