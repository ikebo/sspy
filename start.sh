#!/bin/bash
cd src
python3 -m shadowsocks.server -v -k ikebo >>runtime.log 2>&1
