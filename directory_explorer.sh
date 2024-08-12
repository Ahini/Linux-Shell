#!/bin/bash

echo "Welcome to the Interactive File and Directory Explorer."

while true; do
	echo "Files and Directories in the Current Path:"
	ls -lh | awk '{print $9 "  " $5}'

	read -p "Enter a line of text (Press Enter without text to exit): " input

	if [ -z "$input" ]; then
		echo "Exiting the Interactive Explorer. Goodbye!"
		break
	else
		char_count=$(echo -n "$input" | wc -m)
		echo "Character Count: $char_count"
	fi
done
