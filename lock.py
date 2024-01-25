#!/data/data/com.termux/files/usr/bin/python

import os
import hashlib
import getpass

PASSWORD_FILE = "/data/data/com.termux/files/home/.termux_lock"
STARTUP_SCRIPT = "/data/data/com.termux/files/usr/etc/bash.bashrc"

def main():
    print("Welcome to Termux Lock Setup")

    # Check if password already set
    if os.path.exists(PASSWORD_FILE):
        print("Password already set.")
    else:
        # Prompt user to set password
        password = getpass.getpass("Enter your desired password: ")
        confirm_password = getpass.getpass("Confirm your password: ")

        if password == confirm_password:
            # Save hashed password to file
            save_password(hash_password(password))
            print("Password set successfully.")
        else:
            print("Passwords do not match. Please try again.")

    # Modify Termux startup script
    modify_startup_script()

def hash_password(password):
    # Hash the password using SHA256
    return hashlib.sha256(password.encode()).hexdigest()

def save_password(password_hash):
    with open(PASSWORD_FILE, "w") as file:
        file.write(password_hash)

def modify_startup_script():
    with open(STARTUP_SCRIPT, "r") as file:
        script_content = file.read()

    # Check if lock check already exists in the script
    if "lock.py" not in script_content:
        # Add lock check to the beginning of the script
        with open(STARTUP_SCRIPT, "w") as file:
            file.write("#!/data/data/com.termux/files/usr/bin/sh\n")
            file.write("python /data/data/com.termux/files/home/lock.py\n")
            file.write("if [ ! -f /data/data/com.termux/files/home/.termux_lock ]; then\n")
            file.write("    exit\n")
            file.write("fi\n")
            file.write("# Existing script content below:\n")
            file.write(script_content)

if __name__ == "__main__":
    main()