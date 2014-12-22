@echo off
if exist tw.TWI del tw.TWI
if exist tw.PUN del tw.PUN
cls
twinspan.exe < tw.dat
