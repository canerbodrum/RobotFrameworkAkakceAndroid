*** Settings ***
Resource         ../Resources/resources.robot
Test Setup       Open Akakce Application
Test Teardown    Close Application

*** Test Cases ***
Register Akakce Application     # generate random credentials from faker
    [Tags]     register
    Close Pop Up Message
    Click Right Icon Button
    Click Register Button
    Enter Register Details
    Accept Turns and Conditions
    Click On Register Button
    Verify New User Is Created
Login With Standart User        # login with saved user data from userdetail.yaml
    [Tags]     login

    Close Pop Up Message
    Click Right Icon Button
    Verify Login Page Displayed
    Enter Standart User Login Credentials
    Click on Login Button
    Verify User Is Logged In

Search For Bilgisayar

    Close Pop Up Message
    Type Bilgisayar In The Search Box And Click Enter
    Select First Product
    Go To Selected Product
