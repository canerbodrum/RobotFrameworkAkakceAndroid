*** Settings ***
Resource    ../Resources/common.robot

Test Setup    Open Akakce Application In BrowserStack
Test Teardown    Close Application
*** Test Cases ***
Search For Bilgisayar

    Close Pop Up Message
    Type Bilgisayar In The Search Box And Click Enter
    Select First Product
    Go To Selected Product