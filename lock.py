#!/data/data/com.termux/files/usr/bin/python

import os
import hashlib

PASSWORD_FILE = "/data/data/com.termux/files/home/.termux_lock"
STARTUP_FILE = "/data/data/com.termux/files/home/.bashrc"

def main():
    print("Welcome to Termux Lock Setup")
    
    # Check if password already exists
    if os.path.exists(PASSWORD_FILE):
        print("Password already set. Exiting.")
        return
    
    # Prompt user to set password
    password = get_password()
    
    # Save hashed password to file
    save_password(password)
    
    print("Password set successfully.")
    
    # Automatically add command to Termux startup file
    add_startup_command()

def get_password():
    while True:
        password = input("Enter your desired password: ")
        confirm_password = input("Confirm your password: ")
        
        if password == confirm_password:
            return hash_password(password)
        else:
            print("Passwords do not match. Please try again.")

def hash_password(password):
    # Hash the password using SHA256
    return hashlib.sha256(password.encode()).hexdigest()

def save_password(password):
    with open(PASSWORD_FILE, "w") as file:
        file.write(password)

def add_startup_command():
    command = "python /data/data/com.termux/files/home/lock.py"
    with open(STARTUP_FILE, "a") as file:
        file.write("\n" + command)

if __name__ == "__main__":
    main()