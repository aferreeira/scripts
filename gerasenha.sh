#!/bin/bash
[ "$l" == "" ] && l=13
tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${l} | xargs
