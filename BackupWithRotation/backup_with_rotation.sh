#!/bin/bash

echo "AUTOMATED BACKUP WITH ROTATION OF DIRECTORY"

# Function to display usage information
function usage_info() {
    echo "Usage: $0 <source directory> <target directory if not hardcoded>"
}

# Check if the required arguments are provided and if the source directory is valid
if [ $# -eq 0 ] || [ ! -d "$1" ]; then
    echo "Error: Please provide a valid directory path as a command-line argument."
    usage_info
    exit 1
fi

source_dir="$1"
target_dir="/home/ubuntu/backup"

# Function to create a backup
function create_backup() {
    local timestamp=$(date '+%Y-%m-%d_%H-%M-%S')
    local backup_file_name="${target_dir}/backup_${timestamp}"

    zip -r "${backup_file_name}.zip" "$source_dir" >/dev/null
    if [ $? -eq 0 ]; then
        echo "Backup created successfully: ${backup_file_name}.zip"
    else
        echo "Error: Failed to create backup for $timestamp."
    fi
}

# Function to perform backup rotation
function perform_rotation() {
    local backups=($(ls -t "${target_dir}/backup_"*.zip 2>/dev/null))

    if [ "${#backups[@]}" -gt 5 ]; then
        local backups_to_remove=("${backups[@]:5}")
        for backup in "${backups_to_remove[@]}"; do
            rm -f "$backup"
        done
    fi
}

# Call the functions
create_backup
perform_rotation

# Crontab automation
# * * * * * bash /home/ubuntu/project-1/backup_with_rotation.sh /home/ubuntu/scripts 
# set the above arguement in crontab -e
