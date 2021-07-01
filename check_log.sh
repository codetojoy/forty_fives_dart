#!/bin/bash

echo "checking ..."

grep -i audit out.log | grep -v ok
grep -i exception out.log 

echo "Ready."
