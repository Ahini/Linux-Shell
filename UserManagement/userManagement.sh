
#!/bin/bash

echo "Welcome to User Management System."

function usage(){
	echo "Usage Information"
    	echo "  -c, --create     Create a new user account."
    	echo "  -d, --delete     Delete an existing user account."
    	echo "  -r, --reset      Reset password for an existing user account."
    	echo "  -l, --list       List all user accounts on the system."
    	echo "  -h, --help       Display this help and exit."
}
function account_creation(){
	echo "USER CREATION"
	read -p "Enter username: " username
	if id "$username"; then
		echo "$username already exists. 
		Choose another username."
	else
		read -p "Enter password: " password
		sudo useradd -m "$username" -p "$password"
		echo "User $username created successfully."
	fi
}

function account_deletion(){
	echo "USER DELETION"
	read -p "Enter username: " username
        if id "$username"; then
		sudo userdel -r "$username"
                echo "User $username deleted successfully."
        else
		echo "User $username does not exists.Choose another username."
	fi
}

function password_reset(){
	echo "PASSWORD RESET"
	read -p "Enter username: " username
        if id "$username"; then
                read -p "Enter the new password for $username: " password
		echo "$username:$password" | sudo chpasswd	
		echo "Password for $username reset successfully."
        else
                echo "User $username does not exists.Choose another username."
        fi
}

function user_list(){
	echo "User accounts on the system:"
    	cat /etc/passwd
}


if [ $# -gt 0 ]; then
	case "$1" in 
		-c | --create)
			account_creation
			;;
		-d | --delete)
			account_deletion
			;;

		-h | --help)
			usage
			exit 0
			;;
		-r | --reset)
			password_reset
			;;
		-l | --list)
			user_list
			;;
		*)
			echo "Invalid option: $1"
			usage
			exit 1
			;;
	esac
else
	usage
fi
