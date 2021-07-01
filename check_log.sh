#!/bin/bash

echo "check 1 ..."
grep -i audit out.log | grep -v ok
echo "check 2 ..."
grep -i exception out.log 

echo "Ready."
