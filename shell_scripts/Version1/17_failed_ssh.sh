#!/bin/bash

 cat /var/log/secure | grep failed > failed_ssh_report.txt
echo "result stored "
