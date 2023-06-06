*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/variable.robot

*** Keywords ***
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

Add User
        Click Element                        ${locator_btn_add_user}
        Wait Until Page Contains             Form User                                 5s

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
