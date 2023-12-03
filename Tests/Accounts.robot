*** Settings ***
Resource         ../Resources/common.robot
Test Setup       Open Akakce Application
Test Teardown    Close Application

*** Test Cases ***

Register Akakce Application     # generate random credentials from faker
    [Tags]     register
    Close Pop Up Message
    Click On User Icon
    Verify Login Page Displayed
    Click On Hesap Olustur Button
    Enter Register Details
    Accept Turns and Conditions
    Click On Register Button
    Verify New User Is Created
Login With Standart User        # login with saved user data from userdetail.yaml
    [Tags]     login

    Close Pop Up Message
    Click On User Icon
    Verify Login Page Displayed
    Enter Standart User Login Credentials
    Click on Login Button
    Verify User Is Logged In