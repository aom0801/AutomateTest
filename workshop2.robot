*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://automate-test.stpb-digital.com/register/
${browser}    gc
${locator_firstname}    id=firstname
${locator_lastname}    id=lastname
${locator_email}    id=email
${locator_mobile_phone}    id=mobile-phone
${locator_gender}    validation-basic-radio
${locator_checkbox}    name=courses.Automate Test
# ${locator_select_nationality}    id=nationality
${locatoe_select_role}    id=select-role
${locator_select_role_list}    xpath=//*[@id="menu-"]/div[3]/ul/li[1]
# ${locator_select_plan}    id=select-plan
${locator_btn_sign_up}    id=btn-sign-up
${locator_reset}    id=reset


*** Keywords ***
Open WebBrowser
        Set Selenium Speed    0.5s
        Open Browser    ${url}    ${browser}
        Wait Until Page Contains    Kru P' Beam    5s
        Maximize Browser Window

Input data for register
        Input Text    ${locator_firstname}    Patcharaporn
        Input Text    ${locator_lastname}    Kheawsuwan
        Input Text    ${locator_email}    aon@gmail.com
        Input Text    ${locator_mobile_phone}    0897656778
        Select Radio Button    ${locator_gender}    male
        Select Checkbox    ${locator_checkbox}
        Select list role
        # Click Element    ${locator_select_nationality}
        # Wait Until Element Is Visible    //*[@id="menu-"]/div[3]/ul/li[221]    5s
        # Click Element    xpath=//*[@id="menu-"]/div[3]/ul/li[221]
        # Click Element    ${locatoe_select_role}
        # Wait Until Element Is Visible    xpath=//*[@id="menu-"]/div[3]/ul/li[2]    5s
        # Click Element    xpath=//*[@id="menu-"]/div[3]/ul/li[2]
        # Click Element    ${locator_select_plan}
        # Wait Until Element Is Visible    xpath=//*[@id="menu-"]/div[3]/ul/li[2]    5s
        # Click Element    xpath=//*[@id="menu-"]/div[3]/ul/li[2]
        Click Element    ${locator_btn_sign_up}

Select list role
        Click Element    ${locatoe_select_role}
        Wait Until Element Is Visible    ${locator_select_role_list}    5s
        Click Element    ${locator_select_role_list}





*** Test Cases ***
TC01-input data
    Open WebBrowser
    Input data for register
    Close Browser

TC02-reset data
    Open WebBrowser
    Input data for register
    Click Element    ${locator_reset}
    Close Browser