# To run the script:
# 1. Save this script to a file
# 2. Make it executable using chmod +x screenshot_script.sh
# 3. Run it with ./screenshot_script.sh

# Input
# 1. Enter the folder name where you want to save the screenshot. It will use relative path. By default it will create/use `screenshots` folder
# 2. Input name of URLs you want to take screenshot. Enter them in next line. Type done when you are done
# Ex: 
#https://github.com/upasana05ghosh
#https://github.com/upasana05ghosh?tab=repositories
#done
# 3. Please wait for sometime so screenshots are captured. The wait time is 5s for now. 

# What does this script do? 
# 1. It will open chrome browser
# 2. Open the input url one by one
# 3. Wait for 5 sec/wait time so URL is open by the time being.
# 4. Take full page screenshots 
# 5. Save it to a folder provided or default `screenshots` folder


#!/bin/bash

# Time to wait for page to load (adjust as needed)
wait_time=5

# Function to capture screenshot
capture_screenshot() {
    local url=$1
    local repo_name=$(echo "$url" | awk -F'/' '{print $(NF-1)}')
    local timestamp=$(date +"%Y%m%d%H%M%S")
    
    # Open Chrome and the specified URL
    open -a "Google Chrome" "$url"

    # Wait for 5 seconds for the browser to open and load the page
    sleep "$wait_time"

    # Extract filename from URL (remove leading slash and .git extension)
    filename=$(echo "$url" | sed 's#.*/##' | sed 's/\.git$//')

    # Capture a full page screenshot and save it to the screenshots folder
    screencapture -x -S -t jpg "$folder_name/${filename}_${timestamp}_screenshot.jpg"


    #Wait for the capture process to finish
    #wait

    # Close Chrome (optional, comment out if not needed)
    #osascript -e 'tell application "Google Chrome" to quit'

    echo "\nScreenshot captured for $url. Saved at $folder_name/${filename}_${timestamp}_screenshot.jpg"
}

# Function to print asterisks
print_asterisks() {
    local num_asterisks=$1
    printf "%*s\n" "$num_asterisks" | tr ' ' '*'
}

function print_message {
  local message="$1"

  local padding_length=${#message}
  local border=$(printf '%.0s*' $(seq 1 $padding_length))
  local header=" $border $message $border"

  echo "\n\n $border \n $message \n $border\n\n"
}

# Ask the user to input the folder name
read -p "Enter the folder name (press Enter for default 'screenshots'): " input_folder

# Use the default folder name if no input is provided
folder_name=${input_folder:-"screenshots"}

# Check if the folder exists, create it if not
if [ ! -d "$folder_name" ]; then
    mkdir "$folder_name"
    echo "Created folder: $folder_name"
fi


# Ask the user to input GitHub repository URLs
echo "Enter each GitHub repository URL on a new line. Type 'done' when finished."
echo "Example: https://github.com/example-repo"
echo ""

# Read all input into an array until the user types 'done'
input_urls=()
while true; do
    read -rp "" input_url

    # Check if the user wants to exit
    if [ "$input_url" == "done" ]; then
        break
    fi

    input_urls+=("$input_url")
done

print_message "Capturing screenshots:"

# Process each URL
for url in "${input_urls[@]}"; do
    capture_screenshot "$url"
done

# Display a notification
print_message "Screenshots captured. Check the default 'screenshots' folder or your input folder for the images."