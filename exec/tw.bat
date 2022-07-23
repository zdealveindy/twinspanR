@echo off
if exist tw.TWI del tw.TWI
if exist tw.PUN del tw.PUN
cls
%1/twinspan.exe < %2
