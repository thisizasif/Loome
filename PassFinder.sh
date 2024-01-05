#!/bin/bash

echo "██╗░░░░░░█████╗░░█████╗░███╗░░░███╗███████╗"
echo "██║░░░░░██╔══██╗██╔══██╗████╗░████║██╔════╝"
echo "██║░░░░░██║░░██║██║░░██║██╔████╔██║█████╗░░"
echo "██║░░░░░██║░░██║██║░░██║██║╚██╔╝██║██╔══╝░░"
echo "███████╗╚█████╔╝╚█████╔╝██║░╚═╝░██║███████╗"
echo "╚══════╝░╚════╝░░╚════╝░╚═╝░░░░░╚═╝╚══════╝"
echo "   - Comprehensive Info Collection Tool -"
echo "              Made by Thisizasif"
echo "-------------------------------------------------"

# Function to securely read sensitive information
secure_read() {
  prompt="$1"
  variable_name="$2"
  unset "$variable_name"
  prompt_with_hidden_input="Enter $prompt: "
  read -rsp "$prompt_with_hidden_input" "$variable_name"
  echo
}

# Function to generate a secure password
generate_password() {
  input="$1"
  dob="$2"
  combined_input="$input$dob"
  sha256sum <<< "$combined_input" | base64 | head -c 16
}

# Collect information
secure_read "target's name" target_name
secure_read "victim's date of birth (YYYY-MM-DD)" dob

# Generate generic passwords
passwords=""
for i in {1..10}; do
  password=$(generate_password "victim" "$dob")
  passwords+="\n$i password: $password"
done

# Display generated passwords
echo -e "\nGenerated Passwords:$passwords"
