#!/bin/bash
set -x

# PassFinder - Comprehensive Info Collection Tool
# Copyright (c) 2024 Thisizasif
# https://github.com/Thisizasif/PassFinder


echo "__________                      ___________.__            .___            ";
echo "\______   \_____    ______ _____\_   _____/|__| ____    __| _/___________ ";
echo "|     ___/\__  \  /  ___//  ___/|    __)  |  |/    \  / __ |/ __ \_  __ \";
echo "|    |     / __ \_\___ \ \___ \ |     \   |  |   |  \/ /_/ \  ___/|  | \/";
echo "|____|    (____  /____  >____  >\___  /   |__|___|  /\____ |\___  >__|   ";
echo "                \/     \/     \/     \/            \/      \/    \/       ";

echo "   - Comprehensive Password Generating Tool -"
echo "              Made by Thisizasif"
echo "-------------------------------------------------"

# Function to securely read sensitive information
secure_read() {
  prompt="$1"
  variable_name="$2"
  unset "$variable_name"
  prompt_with_hidden_input="Enter $prompt: "
  while IFS= read -p "$prompt_with_hidden_input" -r -s -n 1 char; do
    if [[ $char == $'\0' ]]; then
      break
    fi
    prompt_with_hidden_input='*'
    eval "$variable_name+=\$char"
  done
  echo
}

# Function to generate a secure password
generate_password() {
  input="$1"
  sha256sum <<< "$input" | base64 | head -c 16
}

# Collect information
secure_read "target's name" target_name
secure_read "target's father's name" father_name
secure_read "target's mother's name" mother_name
secure_read "target's pet's name" pet_name
secure_read "target's sister's name" sister_name
secure_read "target's brother's name" brother_name
secure_read "target's son's name" son_name
secure_read "target's girlfriend's name" girlfriend_name
secure_read "target's first car's name" first_car_name

# Collect additional essential names (optional)
read -p "Enter additional essential names (comma-separated, or press Enter to skip): " additional_names

# Generate secure passwords
password_target=$(generate_password "$target_name")
password_father=$(generate_password "$father_name")
password_mother=$(generate_password "$mother_name")
password_pet=$(generate_password "$pet_name")
password_sister=$(generate_password "$sister_name")
password_brother=$(generate_password "$brother_name")
password_son=$(generate_password "$son_name")
password_girlfriend=$(generate_password "$girlfriend_name")
password_first_car=$(generate_password "$first_car_name")
password_additional=$(generate_password "$additional_names")

# Display collected information
echo -e "\nCollected Information:"
echo "Target's Name: $target_name"
echo "Father's Name: $father_name"
echo "Mother's Name: $mother_name"
echo "Pet's Name: $pet_name"
echo "Sister's Name: $sister_name"
echo "Brother's Name: $brother_name"
echo "Son's Name: $son_name"
echo "Girlfriend's Name: $girlfriend_name"
echo "First Car's Name: $first_car_name"
echo "Additional Essential Names: $additional_names"

# Display generated passwords
echo -e "\nGenerated Passwords:"
echo "Target's Password: $password_target"
echo "Father's Password: $password_father"
echo "Mother's Password: $password_mother"
echo "Pet's Password: $password_pet"
echo "Sister's Password: $password_sister"
echo "Brother's Password: $password_brother"
echo "Son's Password: $password_son"
echo "Girlfriend's Password: $password_girlfriend"
echo "First Car's Password: $password_first_car"
echo "Additional Passwords: $password_additional"
