*** Settings ***
Library    SeleniumLibrary

*** Variables ***
# Search
${url}                             https://automate-test.stpb-digital.com/login/
${browser}                         gc
${locator_email}                   id=email
${locator_password}                name=password
${locatot_btn_login}               id=btn-login
${locator_search_role}             id=select-role
${locator_search_role_list}        id=option-select-role-1
${locator_search_plan}             id=select-plan
${locator_search_plan_list}        id=option-select-plan-1
${locator_search_status}           id=select-status
${locator_search_status_list}      id=option-select-status-1
${locator_btn_clear}               id=btn-clear
${locatorr_btn_search}             id=btn-search
${locator_btn_add_user}            xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[1]/div/a
${locator_rows_per_page}           xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[3]/div/div[2]/div/div[2]
${locator_rows_per_page_list}      xpath=//*[@id="menu-"]/div[3]/ul/li[3]
${locatoer_noti}                   xpath=//*[@id="__next"]/div[1]/div[2]/header/div/div/div[2]/button
${locator_profile}                 xpath=//*[@id="__next"]/div[1]/div[2]/header/div/div/div[2]/span/div/img
${locator_profile_user}            xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[2]/div[2]/div/div/div/div[1]/div[1]/div/div[1]
${locator_next_page}               xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[3]/div/div[2]/div/div[3]/button[2]
${locator_signin}                  xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[3]/div/div/div/form/button
${locator_no_role}                 xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[2]/div[3]/div/div
${locator_resd_noti}               css=body > div.MuiModal-root.MuiPopover-root.css-bdbmf5 > div.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation1.MuiMenu-paper.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation8.MuiPopover-paper.css-1u9pw9f > ul > li.MuiMenuItem-root.MuiMenuItem-gutters.MuiButtonBase-root.css-1p3ebxb > button
${locator_logout}                  css=body > div.MuiModal-root.MuiPopover-root.MuiMenu-root.css-hxcdyb > div.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation1.MuiMenu-paper.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation8.MuiPopover-paper.css-1u9pw9f > ul > li

#add user
${locator_firstname}                      id=firstname
${locator_lastname}                       id=lastname
${locator_password_adduser}               id=password
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
${locator_btn_sign_up}                    xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[3]/div/div/div/form/button
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
${locator_add_user_back}                  xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[1]/button
