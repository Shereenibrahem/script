#!/usr/bin/python3
import os

out = os.popen('docker images gitlab')
outs = out.read().split('\n')
if len(outs) <= 2:
    os.popen('docker-compose up')

else:
    out1 = os.popen('docker ps -q -f name=gitlab')
    if len(out1.read()) == 0:
        out2 = os.popen('docker ps -aq -f status=exited -f name=gitlab')
        if len(out2.read()) > 0:
            os.popen('docker rm gitlab')

        os.popen('docker-compose up')
