#!/bin/bash
cd src
python3 ../register_node.py
python3 -m shadowsocks.server -c 8588.json -v >>runtime.log 2>&1
