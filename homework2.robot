*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}                                    https://automate-test.stpb-digital.com/register/
${browser}                                gc
${locator_firstname}                      id=firstname
${locator_lastname}                       id=lastname
${locator_email}                          id=email
${locator_password}                       id=password
${locator_mobile_phone}                   id=mobile-phone
${locator_gender}                         validation-basic-radio
${locator_checkbox_sql}                   name=courses.SQL
${locator_checkbox_manual}                name=courses.Test Manual
${locator_checkbox_auto_1}                name=courses.Automate Test
${locator_checkbox_auto_2}                name=courses.Automate Test2
${locator_select_nationality}             id=nationality
${locatoe_select_nationality_list}        //*[@id="menu-"]/div[3]/ul/li[221]
${locatoe_select_role}                    id=select-role
${locator_select_role_list}               xpath=//*[@id="menu-"]/div[3]/ul/li[1]
${locator_select_plan}                    id=select-plan
${locator_select_plan_list}               xpath=//*[@id="menu-"]/div[3]/ul/li[2]
${locator_btn_sign_up}                    id=btn-sign-up
${locator_reset}                          id=reset
${locator_ok}                             id=btn-ok
${locator_error_msg_firstname}            id=error-firstname
${locator_error_msg_lastname}             id=error-lastname
${locator_error_msg_email}                id=error-email
${locator_error_msg_password}             id=error-password
${locator_error_msg_mobile}               id=error-mobile-phone
${locator_error_msg_gender}               id=validation-basic-gender
${locator_error_msg_courses}              id=validation-basic-courses
${locator_error_msg_nationality}          id=validation-basic-nationality
${locator_error_msg_role}                 id=validation-role
${locator_error_msg_plan}                 id=validation-plan

*** Keywords ***

Open WebBrowser
        Set Selenium Speed    0.5s
        Open Browser    ${url}    ${browser}
        Wait Until Page Contains    Kru P' Beam    5s
        Maximize Browser Window

Input data for register pass
        Input Text                       ${locator_firstname}                       Patcharaporn
        Input Text                       ${locator_lastname}                        Kheawsuwan
        Input Text                       ${locator_email}                           aon@gmail.com
        Input Text                       ${locator_password}                        1234567
        Input Text                       ${locator_mobile_phone}                    0897656778
        Select Radio Button              ${locator_gender}                          male
        Select Checkbox                  ${locator_checkbox_sql}
        Select Checkbox                  ${locator_checkbox_manual}
        Select Checkbox                  ${locator_checkbox_auto_1}
        Select Checkbox                  ${locator_checkbox_auto_2}
        Select list nationality
        Select list role
        Select list plan
Sign up
        Click Element                    ${locator_btn_sign_up}
        Wait Until Page Contains          Register Success                            5s
        Click Element                    ${locator_ok}
        Wait Until Page Contains          Welcome to Kru P' Beam                      5s 

Select list nationality
        Click Element                    ${locator_select_nationality}
        Wait Until Element Is Visible    ${locatoe_select_nationality_list}           5s
        Click Element                    ${locatoe_select_nationality_list}

Select list role
        Click Element                    ${locatoe_select_role}
        Wait Until Element Is Visible    ${locator_select_role_list}                  5s
        Click Element                    ${locator_select_role_list}

Select list plan
        Click Element                    ${locator_select_plan}
        Wait Until Element Is Visible    ${locator_select_plan_list}                   5s
        Click Element                    ${locator_select_plan_list}    

Input data for fail - firsename
        Input Text                       ${locator_firstname}                       ${EMPTY}
        Input Text                       ${locator_lastname}                        Kheawsuwan
        Input Text                       ${locator_email}                           aon@gmail.com
        Input Text                       ${locator_password}                        1234567
        Input Text                       ${locator_mobile_phone}                    0897656778
        Select Radio Button              ${locator_gender}                          male
        Select Checkbox                  ${locator_checkbox_sql}
        Select Checkbox                  ${locator_checkbox_manual}
        Select Checkbox                  ${locator_checkbox_auto_1}
        Select Checkbox                  ${locator_checkbox_auto_2}
        Select list nationality
        Select list role
        Select list plan
        Click Element                    ${locator_btn_sign_up}

Verify error message - firstname
        ${txt}=    Get Text              ${locator_error_msg_firstname}
        Should Be Equal As Strings       ${txt}                                     This field is required

Input data for fail - lastname
        Input Text                       ${locator_firstname}                       Patcharaporn
        Input Text                       ${locator_lastname}                        ${EMPTY}
        Input Text                       ${locator_email}                           aon@gmail.com
        Input Text                       ${locator_password}                        1234567
        Input Text                       ${locator_mobile_phone}                    0897656778
        Select Radio Button              ${locator_gender}                          male
        Select Checkbox                  ${locator_checkbox_sql}
        Select Checkbox                  ${locator_checkbox_manual}
        Select Checkbox                  ${locator_checkbox_auto_1}
        Select Checkbox                  ${locator_checkbox_auto_2}
        Select list nationality
        Select list role
        Select list plan
        Click Element                    ${locator_btn_sign_up}

Verify error message - lastname
        ${txt}=    Get Text              ${locator_error_msg_lastname}
        Should Be Equal As Strings       ${txt}                                     This field is required

Input data for fail - email
        Input Text                       ${locator_firstname}                       Patcharaporn
        Input Text                       ${locator_lastname}                        Kheawsuwan
        Input Text                       ${locator_email}                           ${EMPTY}
        Input Text                       ${locator_password}                        1234567
        Input Text                       ${locator_mobile_phone}                    0897656778
        Select Radio Button              ${locator_gender}                          male
        Select Checkbox                  ${locator_checkbox_sql}
        Select Checkbox                  ${locator_checkbox_manual}
        Select Checkbox                  ${locator_checkbox_auto_1}
        Select Checkbox                  ${locator_checkbox_auto_2}
        Select list nationality
        Select list role
        Select list plan
        Click Element                    ${locator_btn_sign_up}

Verify error message - email
        ${txt}=    Get Text              ${locator_error_msg_email}
        Should Be Equal As Strings       ${txt}                                     This field is required

Input data for fail - password
        Input Text                       ${locator_firstname}                       Patcharaporn
        Input Text                       ${locator_lastname}                        Kheawsuwan
        Input Text                       ${locator_email}                           aom@gmail.com
        Input Text                       ${locator_password}                        ${EMPTY}
        Input Text                       ${locator_mobile_phone}                    0897656778
        Select Radio Button              ${locator_gender}                          male
        Select Checkbox                  ${locator_checkbox_sql}
        Select Checkbox                  ${locator_checkbox_manual}
        Select Checkbox                  ${locator_checkbox_auto_1}
        Select Checkbox                  ${locator_checkbox_auto_2}
        Select list nationality
        Select list role
        Select list plan
        Click Element                    ${locator_btn_sign_up}

Verify error message - password
        ${txt}=    Get Text              ${locator_error_msg_password}
        Should Be Equal As Strings       ${txt}                                     This field is required


Input data for fail - mobile
        Input Text                       ${locator_firstname}                       Patcharaporn
        Input Text                       ${locator_lastname}                        Kheawsuwan
        Input Text                       ${locator_email}                           aom@gmail.com
        Input Text                       ${locator_password}                        1357908642
        Input Text                       ${locator_mobile_phone}                    ${EMPTY}
        Select Radio Button              ${locator_gender}                          male
        Select Checkbox                  ${locator_checkbox_sql}
        Select Checkbox                  ${locator_checkbox_manual}
        Select Checkbox                  ${locator_checkbox_auto_1}
        Select Checkbox                  ${locator_checkbox_auto_2}
        Select list nationality
        Select list role
        Select list plan
        Click Element                    ${locator_btn_sign_up}

Verify error message - mobile
        ${txt}=    Get Text              ${locator_error_msg_mobile}
        Should Be Equal As Strings       ${txt}                                     This field is required

Input data for fail - gender
        Input Text                       ${locator_firstname}                       Patcharaporn
        Input Text                       ${locator_lastname}                        Kheawsuwan
        Input Text                       ${locator_email}                           aom@gmail.com
        Input Text                       ${locator_password}                        1357908642
        Input Text                       ${locator_mobile_phone}                    0894678998
        Select Checkbox                  ${locator_checkbox_sql}
        Select Checkbox                  ${locator_checkbox_manual}
        Select Checkbox                  ${locator_checkbox_auto_1}
        Select Checkbox                  ${locator_checkbox_auto_2}
        Select list nationality
        Select list role
        Select list plan
        Click Element                    ${locator_btn_sign_up}

Verify error message - gender
        ${txt}=    Get Text              ${locator_error_msg_gender}
        Should Be Equal As Strings       ${txt}                                     This field is required

Input data for fail - check box courses
        Input Text                       ${locator_firstname}                       Patcharaporn
        Input Text                       ${locator_lastname}                        Kheawsuwan
        Input Text                       ${locator_email}                           aom@gmail.com
        Input Text                       ${locator_password}                        1357908642
        Input Text                       ${locator_mobile_phone}                    0894678998
        Select Radio Button              ${locator_gender}                          male
        Select list nationality
        Select list role
        Select list plan
        Click Element                    ${locator_btn_sign_up}

Verify error message - courses
        ${txt}=    Get Text              ${locator_error_msg_courses}
        Should Be Equal As Strings       ${txt}                                     This field is required

Input data for fail - nation
        Input Text                       ${locator_firstname}                       Patcharaporn
        Input Text                       ${locator_lastname}                        Kheawsuwan
        Input Text                       ${locator_email}                           aom@gmail.com
        Input Text                       ${locator_password}                        1357908642
        Input Text                       ${locator_mobile_phone}                    0894678998
        Select Radio Button              ${locator_gender}                          male
        Select Checkbox                  ${locator_checkbox_sql}
        Select Checkbox                  ${locator_checkbox_manual}
        Select Checkbox                  ${locator_checkbox_auto_1}
        Select Checkbox                  ${locator_checkbox_auto_2}
        Select list role
        Select list plan
        Click Element                    ${locator_btn_sign_up}

Verify error message - nation
        ${txt}=    Get Text              ${locator_error_msg_nationality}
        Should Be Equal As Strings       ${txt}                                     This field is required

Input data for fail - role
        Input Text                       ${locator_firstname}                       Patcharaporn
        Input Text                       ${locator_lastname}                        Kheawsuwan
        Input Text                       ${locator_email}                           aom@gmail.com
        Input Text                       ${locator_password}                        1357908642
        Input Text                       ${locator_mobile_phone}                    0894678998
        Select Radio Button              ${locator_gender}                          male
        Select Checkbox                  ${locator_checkbox_sql}
        Select Checkbox                  ${locator_checkbox_manual}
        Select Checkbox                  ${locator_checkbox_auto_1}
        Select Checkbox                  ${locator_checkbox_auto_2}
        Select list nationality
        Select list plan
        Click Element                    ${locator_btn_sign_up}

Verify error message - role
        ${txt}=    Get Text              ${locator_error_msg_role}
        Should Be Equal As Strings       ${txt}                                     This field is required

Input data for fail - plan
        Input Text                       ${locator_firstname}                       Patcharaporn
        Input Text                       ${locator_lastname}                        Kheawsuwan
        Input Text                       ${locator_email}                           aom@gmail.com
        Input Text                       ${locator_password}                        1357908642
        Input Text                       ${locator_mobile_phone}                    0894678998
        Select Radio Button              ${locator_gender}                          male
        Select Checkbox                  ${locator_checkbox_sql}
        Select Checkbox                  ${locator_checkbox_manual}
        Select Checkbox                  ${locator_checkbox_auto_1}
        Select Checkbox                  ${locator_checkbox_auto_2}
        Select list nationality
        Select list role
        Click Element                    ${locator_btn_sign_up}

Verify error message - plan
        ${txt}=    Get Text              ${locator_error_msg_plan}
        Should Be Equal As Strings       ${txt}                                     This field is required

Input data for fail - formate email
        Input Text                       ${locator_firstname}                       Patcharaporn
        Input Text                       ${locator_lastname}                        Kheawsuwan
        Input Text                       ${locator_email}                           aomgmail.com
        Input Text                       ${locator_password}                        1357908642
        Input Text                       ${locator_mobile_phone}                    0894678998
        Select Radio Button              ${locator_gender}                          male
        Select Checkbox                  ${locator_checkbox_sql}
        Select Checkbox                  ${locator_checkbox_manual}
        Select Checkbox                  ${locator_checkbox_auto_1}
        Select Checkbox                  ${locator_checkbox_auto_2}
        Select list nationality
        Select list role
        Click Element                    ${locator_btn_sign_up}

Verify error message - formate email
        ${txt}=    Get Text              ${locator_error_msg_email}
        Should Be Equal As Strings       ${txt}                                     Invalid email address


*** Test Cases ***

TC-input data pass
    Open WebBrowser
    Input data for register pass
    Sign up     
    Close Browser

TC-reset data
    Open WebBrowser
    Input data for register pass
    Click Element                        ${locator_reset}
    Close Browser

TC-verify firstname
    Open WebBrowser
    Input data for fail - firsename
    Verify error message - firstname
    Close Browser

TC-verify lastname
    Open WebBrowser
    Input data for fail - lastname
    Verify error message - lastname
    Close Browser

TC-verify email
    Open WebBrowser
    Input data for fail - email
    Verify error message - email
    Close Browser

TC-verify password
    Open WebBrowser
    Input data for fail - password
    Verify error message - password
    Close Browser

TC-verify mobile
    Open WebBrowser
    Input data for fail - mobile
    Verify error message - mobile
    Close Browser

TC-verify gender
    Open WebBrowser
    Input data for fail - gender
    Verify error message - gender
    Close Browser

TC-verify check box courses
    Open WebBrowser
    Input data for fail - check box courses
    Verify error message - courses
    Close Browser

TC-verify nation
    Open WebBrowser
    Input data for fail - nation
    Verify error message - nation
    Close Browser

TC11-verify role
    Open WebBrowser
    Input data for fail - role
    Verify error message - role
    Close Browser

TC-verify plan
    Open WebBrowser
    Input data for fail - plan
    Verify error message - plan
    Close Browser

TC-verify formate email
    Open WebBrowser
    Input data for fail - formate email
    Verify error message - formate email
    Close Browser

TC-required field
    Open WebBrowser
    Wait Until Element Is Visible            ${locator_btn_sign_up}                       5s    
    Click Element                            ${locator_btn_sign_up}
    Verify error message - firstname
    Close Browser