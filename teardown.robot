*** Settings ***
Library            SeleniumLibrary
Test Setup         open web browser
Test Teardown      Close Browser
Suite Teardown     Set Selenium Speed    0.5 

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
    Wait Until Page Contains    Welcome to Kru P' Beam
    Wait Until Element Is Visible    ${locator_email}
    Wait Until Element Is Visible    ${locator_password}
    Wait Until Element Is Visible    ${locatot_btn_login}
    Wait Until Element Is Visible    ${locator_hyperlink}

TC-ID02 Show page
    Wait Until Page Contains    Kru P' Beam

TC-ID03 Format validate email pass
     input email format validate pass

TC-ID04 Format validate email fail
    input email format validate fail

TC-ID05 Input password more than 5
    input password pass

TC-ID06 Input password least 5
    input password fail    

TC-ID07 Login pass
    input data for login page pass

TC-ID08 Login fail
    input data for login page fail

TC-ID09 Login requird field
    login page empty

TC-ID10 Click Hyperlink
    [Setup]
    Open Browser    https://automate-test.stpb-digital.com/login/    gc
    click hyperlink
    [Teardown]