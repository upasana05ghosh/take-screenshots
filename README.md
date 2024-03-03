# Take full page screenshot using script
Take full page screenshot from the provided url

## To run the script:
 1. Save this script to a file
 2. Make it executable using chmod +x screenshot_script.sh
 3. Run it with ./screenshot_script.sh

## Input
 1. Enter the folder name where you want to save the screenshot. It will use relative path. By default it will create/use `screenshots` folder
 2. Input name of URLs you want to take screenshot. Enter them in next line. Type done when you are done
 Ex: 
 ```
https://github.com/upasana05ghosh
https://github.com/upasana05ghosh?tab=repositories
done
```
 3. Please wait for sometime so screenshots are captured. The wait time is 5s for now. 

## What does this script do? 
 1. It will open chrome browser
 2. Open the input url one by one
 3. Wait for 5 sec/wait time so URL is open by the time being.
 4. Take full page screenshots 
 5. Save it to a folder provided or default `screenshots` folder