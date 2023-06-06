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
