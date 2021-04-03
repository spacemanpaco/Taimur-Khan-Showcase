#!/bin/bash

#Partial Lynis Security Scan for Specified groups
lynis audit --tests-from-group malware,authentication,networking,storage,filesystems >> /tmp/lynis.partial_scan.log
