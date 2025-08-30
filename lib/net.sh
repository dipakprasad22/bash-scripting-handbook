#!/usr/bin/env bash
port_open(){ local host="$1" port="$2"; timeout 3 bash -c "cat < /dev/null > /dev/tcp/${host}/${port}" 2>/dev/null; }
