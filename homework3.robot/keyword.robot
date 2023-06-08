*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/variable.robot

*** Keywords ***
#  search
OpenWebBrowser
        Open Browser                         ${url}                             ${browser}
        Maximize Browser Window
        Wait Until Element Is Visible        ${locator_email}
        Input Text                           ${locator_email}                    user.test@krupbeam.com
        Input Text                           ${locator_password}                 123456789
        Click Element                        ${locatot_btn_login}
        Wait Until Page Contains             Search Filters
        Wait Until Element Is Visible        ${locator_search_role}
        Wait Until Element Is Visible        ${locator_search_plan}
        Wait Until Element Is Visible        ${locator_search_status}
        Wait Until Element Is Visible        ${locatorr_btn_search}

Seach role
        Click Element                        ${locator_search_role}
        Wait Until Element Is Visible        ${locator_search_role_list}            5s
        Click Element                        ${locator_search_role_list}

Search plan
        Click Element                        ${locator_search_plan}
        Wait Until Element Is Visible        ${locator_search_plan_list}            5s
        Click Element                        ${locator_search_plan_list}

Search status
        Click Element                        ${locator_search_status}
        Wait Until Element Is Visible        ${locator_search_status_list}          5s
        Click Element                        ${locator_search_status_list}

Search Data
        OpenWebBrowser
        [Arguments]    ${role}    ${plan}    ${status}
    IF  ${role} == 1
        Seach role
    END
    IF  ${plan} == 1
        Search plan
    END
    IF  ${status} == 1
        Search status
    END
        Click Element                        ${locatorr_btn_search}
        Wait Until Element Is Not Visible    ${locator_no_role}
        Close Browser

Srearch Data - no role
        Click Element                        ${locator_search_role}
        Wait Until Element Is Visible        id=option-select-role-2
        Click Element                        id=option-select-role-2
        Click Element                        ${locator_search_plan}
        Wait Until Element Is Visible        id=option-select-plan-1
        Click Element                        id=option-select-plan-1
        Click Element                        ${locatorr_btn_search}
        Wait Until Element Is Visible        ${locator_no_role}

Next page
        Click Element                        ${locatorr_btn_search}
        Wait Until Element Is Not Visible    ${locator_no_role}
        Wait Until Element Is Visible        xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[3]/div/div[2]/div/p[2]
        Click Element                        ${locator_next_page}
        Wait Until Element Is Visible        xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[3]/div/div[2]/div/p[2]
    
Clear Data
        Click Element                        ${locatorr_btn_search}
        Wait Until Element Is Not Visible    ${locator_no_role}
        Click Element                        ${locator_btn_clear}
        Wait Until Element Is Visible        ${locator_no_role}

Select rows per page
        Click Element                        ${locatorr_btn_search}
        Wait Until Element Is Not Visible    ${locator_no_role}
        Click Element                        ${locator_rows_per_page}
        Wait Until Element Is Visible        ${locator_rows_per_page_list}      
        Click Element                        ${locator_rows_per_page_list}


Open detail data
        Click Element                        ${locatorr_btn_search}
        Wait Until Element Is Not Visible    ${locator_no_role}
        Click Element                        ${locator_profile_user}
        Wait Until Page Contains             Details                                   5s

Notification
        Click Element                        ${locatoer_noti}
        Wait Until Page Contains             Notifications                             5s
        Click Element                        ${locator_resd_noti}

Profile
        Click Element                        ${locator_profile}
        Wait Until Element Is Visible        ${locator_logout}

Logout
        Click Element                        ${locator_profile}
        Wait Until Element Is Visible        ${locator_logout}
        Click Element                        ${locator_logout}
        Wait Until Page Contains             Welcome to Kru P' Beam                    5s 

# Add User

Add User
        Click Element                        ${locator_btn_add_user}
        Wait Until Page Contains             Form User                                 5s

Input data for register pass
        Input Text                       ${locator_firstname}                       Patcharaporn
        Input Text                       ${locator_lastname}                        Kheawsuwan
        Input Text                       ${locator_email}                           aom@gmail.com
        Input Text                       ${locator_password_adduser}                1234567
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
        Wait Until Page Contains          Search Filters                              5s 

Reset Data
        Wait Until Element Is Visible    ${locator_reset}
        Input Text                       ${locator_firstname}                       Patcharaporn
        Input Text                       ${locator_lastname}                        Kheawsuwan
        Input Text                       ${locator_email}                           aom@gmail.com
        Click Element                    ${locator_reset}

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
        Input Text                       ${locator_password_adduser}                1357908642
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
        Add User
        [Arguments]    ${firsename}    ${lastname}    ${email}    ${password}    ${mobile}    ${gender}    ${checkbox}    ${national}    ${role}    ${plan}    ${locator_error_msg}    ${msg}
        Input Text                       ${locator_firstname}                       ${firsename}
        Input Text                       ${locator_lastname}                        ${lastname}
        Input Text                       ${locator_email}                           ${email}
        Input Text                       ${locator_password_adduser}                ${password}
        Input Text                       ${locator_mobile_phone}                    ${mobile}
        
        IF  "${gender}" != "EMPTY"
            Select Radio Button              ${locator_gender}                       ${gender}
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
        Close Browser

Verify error message - Test Temples
        [Arguments]    ${locator}    ${msg}=${EMPTY}
        ${txt}=    Get Text              ${locator}
        Should Be Equal As Strings       ${txt}    ${msg}