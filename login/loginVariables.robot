*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://www.saucedemo.com/
${browser}    gc
${locatoe_user}    id=user-name
${locator_password}    id=password
${locatot_btn_login}    id=login-button
${locator_error_msg}    xpath=//*[@id="login_button_container"]/div/form/div[3]/h3
