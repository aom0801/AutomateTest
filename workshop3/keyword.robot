*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/variable.robot

*** Keywords ***
Open WebBrowser
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

Input data for fail - Test Temples
        Open WebBrowser
        [Arguments]    ${firsename}    ${lastname}    ${email}    ${password}    ${mobile}    ${gender}    ${checkbox}    ${national}    ${role}    ${plan}    ${locator_error_msg}    ${msg}
        Input Text                       ${locator_firstname}                       ${firsename}
        Input Text                       ${locator_lastname}                        ${lastname}
        Input Text                       ${locator_email}                           ${email}
        Input Text                       ${locator_password}                        ${password}
        Input Text                       ${locator_mobile_phone}                    ${mobile}
        
        IF  "${gender}" != "EMPTY"
            Select Radio Button              ${locator_gender}                          ${gender}
        END
        
        IF  ${checkbox} == 1
            Select Checkbox                  ${locator_checkbox_sql}
       ELSE IF  ${checkbox} == 2
            Select Checkbox                  ${locator_checkbox_sql}
            Select Checkbox                  ${locator_checkbox_manual}
       ELSE IF  ${checkbox} == 3
            Select Checkbox                  ${locator_checkbox_sql}
            Select Checkbox                  ${locator_checkbox_manual}
            Select Checkbox                  ${locator_checkbox_auto_1}
       ELSE IF  ${checkbox} == 4
            Select Checkbox                  ${locator_checkbox_sql}
            Select Checkbox                  ${locator_checkbox_manual}
            Select Checkbox                  ${locator_checkbox_auto_1}
            Select Checkbox                  ${locator_checkbox_auto_2} 
        END

        IF  ${national} == 1
            Select list nationality
        END
        IF  ${role} == 1
           Select list role
        END
        IF  ${plan} == 1
           Select list plan
        END

        Click Element                    ${locator_btn_sign_up}
        Verify error message - Test Temples    ${locator_error_msg}    ${msg}

Verify error message - Test Temples
        [Arguments]    ${locator}    ${msg}=${EMPTY}
        ${txt}=    Get Text              ${locator}
        Should Be Equal As Strings       ${txt}    ${msg}