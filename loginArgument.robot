*** Settings ***
Library    SeleniumLibrary
# เรียกใช้อข้อมูลหน้าอื่นๆ
# Resource    ${CURDIR}/checkbox.robot 

*** Variables ***
${url}                     https://www.saucedemo.com/
${browser}                 gc
${locatoe_user}            id=user-name
${locator_pass}            id=password
${locator_error_msg}       xpath=//*[@id="login_button_container"]/div/form/div[3]/h3
${locator_btn_login}       id=login-button

*** Keywords ***
Opne web browser
    [Arguments]    ${link}    ${browserName}
    Open Browser    ${link}    ${browserName}
    Maximize Browser Window

Input data
    [Arguments]    ${username}    ${textname}    ${password}    ${textPassword}
    Wait Until Element Is Visible    ${username}
    Input Text     ${username}    ${textname}
    Wait Until Element Is Visible    ${password}    
    Input Text     ${password}    ${textPassword}
    Click Element    ${locator_btn_login}

Verify check error message
    [Arguments]    ${errormsg}    ${txt}
    Wait Until Element Is Visible    ${errormsg}
    ${text}    Get Text    ${errormsg}
    Should Be Equal As Strings    ${text}    ${txt}

    
*** Test Cases ***

Verify input dat - pass
    Opne web browser    ${url}    ${browser}
    Input data    ${locatoe_user}    patcharaporn    ${locator_pass}    123456789
    Close Browser

Verify input dat - EMPTY
    Opne web browser    ${url}    ${browser}
    Input data    ${locatoe_user}    ${EMPTY}    ${locator_pass}    ${EMPTY}
    Verify check error message    ${locator_error_msg}    Epic sadface: Username is required
    Close Browser

Verify input dat - fail
    Opne web browser    ${url}    ${browser}
    Input data    ${locatoe_user}    aomxxxx    ${locator_pass}    890098
    Verify check error message    ${locator_error_msg}    Epic sadface: Username and password do not match any user in this service
    Close Browser

Verify input email
    Opne web browser    ${url}    ${browser}
    Input data    ${locatoe_user}    ${EMPTY}    ${locator_pass}    secret_sauce
    Verify check error message    ${locator_error_msg}    Epic sadface: Username is required
    Close Browser

Verify input password
    Opne web browser    ${url}    ${browser}
    Input data    ${locatoe_user}    aomxxxx    ${locator_pass}    ${EMPTY}
    Verify check error message    ${locator_error_msg}    Epic sadface: Password is required
    Close Browser
