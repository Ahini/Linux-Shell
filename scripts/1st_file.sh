#!/bin/bash

echo "This is my first shell script"

echo "Lets give a demo"

echo "Single lines with single commands"

echo "Date: $(date)"
echo "Storage: $(df -h |awk 'NR==2 {print $2}')"

echo "Single lines with multiple commands"
echo "Storage is $(df -h |awk 'NR==2 {print $2}') and RAM is $(free -h |awk 'NR==2 {print $2}')"
