#!/bin/bash

# Check for unowned files
find / -type f -not -user root -exec ls -la {} \;

# Check for SUID files
find / -type f -user root -perm /4000 -exec ls -la {} \;

# Check for world-writable files
find / -type f -perm 0777 -exec ls -la {} \;

# Check for world-writable directories
find / -type d -perm 0777 -exec ls -la {} \;

# Check for world-writable files in /etc/
find /etc/ -type f -perm 0777 -exec ls -la {} \;

# Check for world-writable directories in /etc/
find /etc/ -type d -perm 0777 -exec ls -la {} \;

# Check for files with sticky bits
find / -type d -perm /1000 -exec ls -la {} \;

# Check for processes running as root
ps aux | grep root

# Check for processes running as other users
ps aux | grep -v root

# Check for running services
service --status-all
