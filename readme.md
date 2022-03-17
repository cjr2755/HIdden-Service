### Hidden Service 
#### Author: Connor Ricotta

## Description:
This tool pretends to be the service NetworkManager created by dbus-org.freedesktop, calling the file nm-startup. This file is in reality a bash script. This tool opens reverse shells that an attacker can connect to. 

## Installation:
1. Run install.sh as sudo

## Core Functionality:
1. Upon first start up, wait 2 minutes
2. Open up a shell (using ncat) on a random port from 41784 to 46784.
3. Send a POST message about the open port
4. Sleep anywhere from 60-90 seconds
5. Repeat

## Pre-Requirements
1. Must have ncat installed 
2. Must have ip installed
3. The environment variables REMOTE_IP and REMOTE_PORT must be set, otherwise this script will not properly call back to pwnboard.

## Usage:
There is a wait when running this service before the shells begin (it's about two minutes). The program will then start spawning root shells from ports 45000-50000.
