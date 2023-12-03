*** Settings ***
Library    AppiumLibrary
*** Variables ***
${rightIcon}                             id=com.akakce.akakce:id/rightIcon
*** Keywords ***
Click On User Icon
    Wait Until Page Contains Element    ${rightIcon}            timeout=15
    Click Element                       ${rightIcon}