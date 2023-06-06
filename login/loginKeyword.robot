*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/loginVariables.robot

*** Keywords ***
Opne web browser
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Wait Until Element Is Visible    ${locatoe_user}

Input username and password
    Wait Until Element Is Visible    ${locatoe_user}
    Wait Until Element Is Visible    ${locator_password} 
    Input Text     ${locatoe_user}   standard_user
    Input Text     ${locator_password}    secret_sauce
    Click Element    ${locatot_btn_login}
    Wait Until Page Contains    Products
