*** Settings ***
Library       AppiumLibrary
Library       ../Libraries/StringGenerator.py
Variables     ../Data/user_details.yaml

#My Locators
*** Variables ***
${pop_up_message}                        id=com.akakce.akakce:id/framePopupLyt
${search_input_field}                    id=com.akakce.akakce:id/searchTextView
${search_input_field2}                   xpath=(//android.widget.EditText[@resource-id="com.akakce.akakce:id/searchTextView"])[2]
${first_product}                         xpath=(//*[@resource-id='com.akakce.akakce:id/cellContainer'])[1]
${ürüne_git_button}                      id=com.akakce.akakce:id/detailBtnTextView
${ürüne_git_button}                      xpath=*[@text='Takip Et'])
${rightIcon}                             id=com.akakce.akakce:id/rightIcon
${email}                                 id=id/email_edt
${password}                              id=id/password_edt
${login_btn}                             id=com.akakce.akakce:id/login_btn
${login_hesap_olustur}                   id=com.akakce.akakce:id/register_btn_text
${register_name}                         id=com.akakce.akakce:id/name_edt
${register_surname}                      id=com.akakce.akakce:id/surname_edt
${register_email}                        xpath=(//*[@resource-id='com.akakce.akakce:id/email_edt'])[2]
${register_email2}                       xpath=//*[@resource-id='com.akakce.akakce:id/email_ag_edt']
${register_password}                     xpath=(//*[@resource-id='com.akakce.akakce:id/password_edt'])[2]
${register_password2}                    xpath=//*[@resource-id='com.akakce.akakce:id/password_ag_edt']
${register_accept_terms_and_conditions}  id=com.akakce.akakce:id/privacyCheck
${register_button}                       xpath=(//*[@resource-id='com.akakce.akakce:id/register_btn'])[1]
${login_username_input_field}            id=com.akakce.akakce:id/email_edt
${login_password_input_field}            id=com.akakce.akakce:id/password_edt
*** Keywords ***
Open Akakce Application
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
Scroll To Urune Git Button
    Scroll To Element                   ${ürüne_git_button}
Close Pop Up Message
    Wait Until Page Contains Element    ${pop_up_message}      timeout=15
    Click Element                       ${pop_up_message}
Type Bilgisayar In The Search Box And Click Enter
    Wait Until Page Contains Element    ${search_input_field}
    Click Element                       ${search_input_field}
    Wait Until Page Contains Element    ${search_input_field2}
    Input Text                          ${search_input_field2}  Bilgisayar
    Press Keycode    66
Select First Product
    Wait Until Page Contains Element    ${first_product}
    Click Element                       ${first_product}
Go To Selected Product
    Scroll To Urune Git Button
Click Right Icon Button
    Wait Until Page Contains Element    ${rightIcon}            timeout=15
    Click Element                       ${rightIcon}
Click Register Button
    Wait Until Page Contains Element    ${login_hesap_olustur}  timeout=15
    Click Element                       ${login_hesap_olustur}
Set Register Values
    ${register_user_name}               Generate Name
    ${register_user_surname}            Generate Surname
    ${register_user_email}              Generate Email
    ${register_user_password}           Generate Password
    Set Test Variable                   ${register_user_name}
    Set Test Variable                   ${register_user_surname}
    Set Test Variable                   ${register_user_email}
    Set Test Variable                   ${register_user_password}

Enter Register Details
    Set Register Values
    Wait Until Page Contains Element    ${register_name}       timeout=15
    Input Text    ${register_name}      ${register_user_name}

    Wait Until Page Contains Element    ${register_name}       timeout=15
    Input Text    ${register_surname}   ${register_user_surname}

    Wait Until Page Contains Element    ${register_email}      timeout=15
    Input Text    ${register_email}     ${register_user_email}

    Wait Until Page Contains Element    ${register_email2}     timeout=15
    Input Text    ${register_email2}    ${register_user_email}

    Wait Until Page Contains Element    ${register_password}   timeout=15
    Input Text  ${register_password}    ${register_user_password}

    Wait Until Page Contains Element    ${register_password2}  timeout=15
    Input Text  ${register_password2}   ${register_user_password}

Accept Turns and Conditions
    Scroll To Element                   ${register_accept_terms_and_conditions}
    Click Element                       ${register_accept_terms_and_conditions}
Click on Register Button
    Wait Until Page Contains Element    ${register_button}
    Click Element                       ${register_button}
Verify New User Is Created
    Wait Until Page Contains            Profilim
    Log To Console                      name and surname=${register_user_name} ${register_user_surname}
    Wait Until Page Contains            ${register_user_name} ${register_user_surname}
Verify Login Page Displayed
    Wait Until Page Contains Element    ${rightIcon}            timeout=15
Enter Standart User Login Credentials
    Input Text                          ${login_username_input_field}     ${standard_user.email}
    Input Text                          ${login_password_input_field}     ${standard_user.password}
Click on Login Button
    Wait Until Page Contains Element    ${login_btn}
    Click Element                       ${login_btn}
Verify User Is Logged In
    Wait Until Page Contains            Profilim
    Wait Until Page Contains            ${standard_user.name} ${standard_user.surname}