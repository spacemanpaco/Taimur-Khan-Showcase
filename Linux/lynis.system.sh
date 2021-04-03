#!/bin/bash

#Full System Lynis Security Scan
lynis audit system >> /tmp/lynis.system_scan.log
