*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://automate-test.stpb-digital.com/login/
${browser}    gc
${locator_email}    id=email
${locator_password}    name=password
${locatot_btn_login}    id=btn-login
${locator_error_msg_email}    css=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div > div > div > form > div.MuiFormControl-root.MuiFormControl-fullWidth.css-m5bgtg > p
${locator_error_msg_password}    css=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div > div > div > form > div.MuiFormControl-root.MuiFormControl-fullWidth.css-tzsjye > p
${locator_hyperlink}    css=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div > div > div > form > div.MuiBox-root.css-z0xj7h > p.MuiTypography-root.MuiTypography-body1.css-azsy9a > a

*** Keywords ***
open web browser
    Set Selenium Speed    0.5
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

input email format validate pass
    Wait Until Element Is Visible    ${locator_email}
    Input Text    ${locator_email}    Beam1234@gmail.com
    Click Element    ${locatot_btn_login}

input email format validate fail
    Wait Until Element Is Visible    ${locator_email}
    Input Text    ${locator_email}    Beam1234gmail.com
    Click Element    ${locatot_btn_login}
    ${txt}=    Get Text    ${locator_error_msg_email}
    Should Be Equal As Strings    ${txt}    email must be a valid email

input password pass
    Wait Until Element Is Visible    ${locator_password}
    Input Password    ${locator_password}    1234567890
    Click Element    ${locatot_btn_login}

input password fail
    Wait Until Element Is Visible    ${locator_password}
    Input Password    ${locator_password}    123
    Click Element    ${locatot_btn_login}
    ${txt}=    Get Text    ${locator_error_msg_password}
    Should Be Equal As Strings    ${txt}    password must be at least 5 characters

input data for login page pass
    Input Text    ${locator_email}    user.test@krupbeam.com
    Input Text    ${locator_password}    123456789
    Click Element    ${locatot_btn_login}
    Wait Until Page Contains    Search Filters

input data for login page fail
    Input Text    ${locator_email}    admin@krupbeam.com
    Input Text    ${locator_password}    123456789
    Click Element    ${locatot_btn_login}
    ${txt}=    Get Text    ${locator_error_msg_email}
    Should Be Equal As Strings    ${txt}    Email or Password is invalid

login page empty
    Wait Until Element Is Visible    ${locator_email}
    Wait Until Element Is Visible    ${locator_password}
    Input Text    ${locator_email}    ${empty}
    Input Text    ${locator_password}    ${empty}
    Click Element    ${locatot_btn_login}
    ${txt}=    Get Text    ${locator_error_msg_email}
    Should Be Equal As Strings    ${txt}    email is a required field

click hyperlink
    Click Element    ${locator_hyperlink}
    Wait Until Page Contains    Kru P' Beam

*** Test Cases ***
TC-ID01 Open web browser
    open web browser
    Wait Until Page Contains    Welcome to Kru P' Beam
    Wait Until Element Is Visible    ${locator_email}
    Wait Until Element Is Visible    ${locator_password}
    Wait Until Element Is Visible    ${locatot_btn_login}
    Wait Until Element Is Visible    ${locator_hyperlink}
    Close Browser

TC-ID02 Show page
    open web browser
    Wait Until Page Contains    Kru P' Beam
    Close Browser

TC-ID03 Format validate email pass
     open web browser
     input email format validate pass
     Close Browser

TC-ID04 Format validate email fail
    open web browser
    input email format validate fail
    Close Browser

TC-ID05 Input password more than 5
    open web browser
    input password pass
    Close Browser

TC-ID06 Input password least 5
    open web browser
    input password fail    
    Close Browser

TC-ID07 Login pass
    open web browser
    input data for login page pass
    Close Browser

TC-ID08 Login fail
    open web browser
    input data for login page fail
    Close Browser

TC-ID09 Login requird field
    open web browser
    login page empty
    Close Browser

TC-ID10 Click Hyperlink
    open web browser
    click hyperlink
    Close Browser
