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

Input data for login page
    ${pws}    Set Variable    ${123456789}
    Wait Until Element Is Visible    ${locator_email}
    Wait Until Element Is Visible    ${locator_password}
    Input Text    ${locator_email}    user.test@krupbeam.com
    Input Password    ${locator_password}    ${pws}
    Click Element    ${locatot_btn_login}
    Wait Until Page Contains    Search Filters

Input Email fail
    Wait Until Element Is Visible    ${locator_email}
    Input Text    ${locator_email}    Beam1234gmail.com
    Click Element    ${locatot_btn_login}
    Wait Until Element Is Visible    ${locator_error_msg_email}
    ${txt}    Get Text    ${locator_error_msg_email}
    Should Be Equal As Strings    ${txt}    email must be a valid email

Input password fail
    ${pws}    Set Variable    ${129}
    Wait Until Element Is Visible    ${locator_password}
    Input Password    ${locator_password}    ${pws}
    Click Element    ${locatot_btn_login}
    Wait Until Element Is Visible    ${locator_error_msg_password}
    ${txt}    Get Text    ${locator_error_msg_password}
    Should Be Equal As Strings    ${txt}    password must be at least 5 characters

link register
    Wait Until Element Is Visible    ${locator_hyperlink}
    Click Element    ${locatot_btn_login}
    Wait Until Page Contains    Kru P' Beam

verify input Data
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

inpur email not fail
    ${pws}    Set Variable    123456789
    Wait Until Element Is Visible    ${locator_email}
    Wait Until Element Is Visible    ${locator_password}
    Input Text    ${locator_email}    admin@krupbeam.com
    Input Password    ${locator_password}    ${pws}  
    Click Element    ${locatot_btn_login} 
    Wait Until Element Is Visible    ${locator_error_msg_email}
    ${email}=    Get Text    ${locator_error_msg_email}
    Should Be Equal As Strings    ${email}    Email or Password is invalid

*** Test Cases ***
#เปิดเว็บ
Open login page
    open web browser
    Wait Until Page Contains    Kru P' Beam
    Wait Until Page Contains    Welcome to Kru P' Beam
    Wait Until Element Is Visible    ${locator_email}
    Wait Until Element Is Visible    ${locator_password}
    Wait Until Element Is Visible    ${locatot_btn_login}
    Wait Until Element Is Visible    ${locator_hyperlink}
    Close Browser
#อีเมลผิด
Input Email - fail
    open web browser
    Input Email fail
    Close Browser
#password ผิด
Input Password - fail
    open web browser
    Input password fail
    Close Browser
#ไม่มีอีเมลในระบบ
Input email not fail
    open web browser
    inpur email not fail
    Close Browser
#ไม่กรอก
verify input data - fail
    open web browser
    verify input Data
    Close Browser
#กรอกครบ ผ่าน
Verify inpur data - pass
    open web browser
    Input data for login page
    Close Browser
#กดลิ้ง
hyperlink
    open web browser
    link register
    Close Browser