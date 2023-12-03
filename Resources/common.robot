*** Settings ***
Library       AppiumLibrary
Resource      accounts_page.robot
Resource      home_page.robot
Resource      search_page.robot

#My Locators
*** Variables ***
${pop_up_message}                        id=com.akakce.akakce:id/framePopupLyt
${execution_env}                         local          #default variable
${user}                                  standard_user  #default variable

*** Keywords ***
Open Akakce Application
  Run Keyword If    "${execution_env}"=="local"
  ...  Open Akakce Application In Local
  Run Keyword If    "${execution_env}"=="browserstack"
  ...  Open Akakce Application In Browserstack
Open Akakce Application In Local
    Open Application
    ...  remote_url=http://localhost:4723
    ...  platformName=Android
    ...  platformVersion=11.0
    ...  deviceName=emulator-5554
    ...  appPackage=com.akakce.akakce
    ...  appActivity=com.akakce.akakce.ui.splash.SplashActivity
    ...  automationName=UIautomator2

Scroll to Element
        [Arguments]    ${element}
        ${isElementVisible}      Run Keyword And Return Status        Wait Until Page Contains Element    ${element}
    WHILE   "${isElementVisible}"=="False"
        Swipe By Percent                50  60  50  20  400
        ${isElementVisible}      Run Keyword And Return Status        Wait Until Page Contains Element    ${element}
    END

Close Pop Up Message
    Wait Until Page Contains Element    ${pop_up_message}      timeout=15
    Click Element                       ${pop_up_message}
Open Akakce Application In BrowserStack
    Open Application
    ...  remote_url=http://ahmetcaner_ujEcyh:Zv4XbZjysxeVEUC51X7A@hub.browserstack.com/wd/hub
    ...  platformName=Android
    ...  platformVersion=11.0
    ...  deviceName=Samsung Galaxy S21
    ...  appPackage=com.akakce.akakce
    ...  appActivity=com.akakce.akakce.ui.splash.SplashActivity
    ...  automationName=Uiautomator2
    ...  app=bs://003daef56cb29b159eaaf6c2c18a6e637c564ed3
    ...  buildName=Smoke Tests
    ...  projectName=Akakce
Set Default Variable
    Set Global Variable    ${execution_env}                         local          #default variable
    Set Global Variable    ${user}                                  standard_user  #default variable