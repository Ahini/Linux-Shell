read -p "Enter Username: " username
read -p "Enter Password: " password

sudo useradd -m $username -p $password

echo "User $username created successfully."

cat /etc/passwd | tail -n 3

sudo userdel -r $username

echo "User $username deleted successfully."
