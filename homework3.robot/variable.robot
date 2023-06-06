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