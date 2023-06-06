*** Settings ***
Library   SeleniumLibrary

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

Open web browser
    Set Selenium Speed    0.5
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

#อีเมลผิด formate
Input email format validate fail
    Wait Until Element Is Visible    ${locator_email}
    Input Text    ${locator_email}    Beam1234gmail.com
    Click Element    ${locatot_btn_login}
    ${txt}=    Get Text    ${locator_error_msg_email}
    Should Be Equal As Strings    ${txt}    email must be a valid email

#รหัสผ่านผิด
Input password fail
    Wait Until Element Is Visible    ${locator_password}
    Input Password    ${locator_password}    123
    Click Element    ${locatot_btn_login}
    Wait Until Element Is Visible    ${locator_error_msg_password}
    ${txt}    Get Text    ${locator_error_msg_password}
    Should Be Equal As Strings    ${txt}    password must be at least 5 characters

#ไม่มีข้อมูลในระบบ
Input data for login page fail
    Wait Until Element Is Visible    ${locator_email}
    Wait Until Element Is Visible    ${locator_password}
    Input Text    ${locator_email}    admin@krupbeam.com
    Input Text    ${locator_password}    123456789
    Click Element    ${locatot_btn_login}

#กรอกผ่านหมด email รหัสผ่าน ถูกformat : เข้าหน้า home
Input data for login page pass
    Wait Until Element Is Visible    ${locator_email}
    Wait Until Element Is Visible    ${locator_password}
    Input Text    ${locator_email}    user.test@krupbeam.com
    Input Password    ${locator_password}    123456789
    Click Element    ${locatot_btn_login}
    Wait Until Page Contains    Search Filters

#ไม่กรอกข้อมูลเลย
Input data empty
    Wait Until Element Is Visible    ${locator_email}
    Wait Until Element Is Visible    ${locator_password}
    Input Text    ${locator_email}    ${empty}
    Input Text    ${locator_password}    ${empty}
    Click Element    ${locatot_btn_login}
    Wait Until Element Is Visible    ${locator_error_msg_email}
    ${email}=    Get Text    ${locator_error_msg_email}
    Wait Until Element Is Visible    ${locator_error_msg_password}
    ${pws}=    Get Text    ${locator_error_msg_password}
    Should Be Equal As Strings    ${email}    email is a required field
    Should Be Equal As Strings    ${pws}    password must be at least 5 characters

#hyperlink : ไปหน้า register
Click Hyperlink
    Wait Until Element Is Visible    ${locator_hyperlink}
    Click Element    ${locatot_btn_login}
    Wait Until Page Contains    Kru P' Beam

*** Test Cases ***
TC-Open login page
   Open web browser
    Wait Until Page Contains    Kru P' Beam
    Wait Until Page Contains    Welcome to Kru P' Beam
    Wait Until Element Is Visible    ${locator_email}
    Wait Until Element Is Visible    ${locator_password}
    Wait Until Element Is Visible    ${locatot_btn_login}
    Wait Until Element Is Visible    ${locator_hyperlink}
    Close Browser
        
TC-Input email fail
    Open web browser
    Input email format validate fail
    Close Browser

TC-Input password fail
    Open web browser
    Input password fail
    Close Browser

TC-Login fail
    Open web browser
    Input data for login page fail
    Close Browser

TC-Login pass
    Open web browser
    Input data for login page pass
    Close Browser

TC-Input data Empty
    Open web browser
    Input data empty
    Close Browser

TC-Click hyperlink
    Open web browser
    Click Hyperlink
    Close Browser