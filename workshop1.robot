*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${url}    https://automate-test.stpb-digital.com/login/
${browser}    gc
${locator_email}    id=email
${locator_password}    name=password
${locatot_btn_login}    id=btn-login
${locator_msg_email}    css=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div > div > div > form > div.MuiFormControl-root.MuiFormControl-fullWidth.css-m5bgtg > p

*** Keywords ***
open web browser
    Set Selenium Speed    0.5
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

input data for login page
    #ใช้คำสั่ง        ส่ง locator        ส่งข้อความเป็น text
    Input Text    ${locator_email}    user.test@krupbeam.com
    Input Text    ${locator_password}    123456789
    Click Element    ${locatot_btn_login}

input data for login page fail
    #ใช้คำสั่ง        ส่ง locator        ส่งข้อความเป็น text
    Input Text    ${locator_email}    admin@krupbeam.com
    Input Text    ${locator_password}    123456789
    Click Element    ${locatot_btn_login}

# input data for login page empty
#     #ใช้คำสั่ง        ส่ง locator        ส่งข้อความเป็น text
#     Input Text    ${locator_email}    ${empty}
#     Input Text    ${locator_password}    ${empty}
#     Click Element    ${locatot_btn_login}

*** Test Cases ***
# TC000 Showpage
#     open web browser
#     Wait Until Page Contains    Kru P' Beam

TC001 login pass
    open web browser
    input data for login page
    Close Browser

TC002 login fail
    open web browser
    input data for login page fail
    ${txt}=    Get Text    ${locator_msg_email}
    Should Be Equal As Strings    ${txt}    Email or Password is invalid
    Close Browser