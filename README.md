# finrem-selenium-ide
Financial Remedy Selenium IDE project generator.

Generates a [Selenium IDE](https://www.selenium.dev/selenium-ide/) project file that automates
Financial Remedy case creation.

## Prerequisites
The Selenium IDE extension should be installed in your browser.

Currently, this project only supports generating files that work with the Chrome extension.

In the Chrome Extension Manage Settings the **Allow access to file URLs** option must be selected.

## Script generation
Run `init.sh` to generate a Selenium IDE project file.
```bash
./init.sh
```
You will be prompted to enter some values that will be embedded into the generated file.

## Using the project file
1. Log in to Manage Cases as the applicant solicitor who is going to create the case. 
2. Import the project file using the Selenium IDE browser extension.
3. Select the appropriate Manage Cases URL from the dropdown list (AAT or localhost)
4. Click the **Run current test** Play button.

A new browser window will open and the Selenium IDE will input the values to create a case.

Once the case has been created the case number will be shown in a popup.
