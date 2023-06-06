*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}                              https://www.saucedemo.com/
${browser}                          gc
${locator_username}                 id=user-name
${locator_password}                 id=password
${locator_error_msg}                xpath=//*[@id="login_button_container"]/div/form/div[3]/h3
${locator_btn_login}                id=login-button

*** Keywords ***
Open web browser
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Input Data - fail
    #สร้าง Arguments 3 ตัวแปร
    [Arguments]    ${user}    ${pass}    ${errormsg}
    # เปิดเว็บ
    Open web browser
    # ตรวจสอบการแสดช่องกรอกของ username
    Wait Until Element Is Visible    ${locator_username}
    # ตรวจสอบการแสดช่องกรอกของ username password
    Wait Until Element Is Visible    ${locator_password}
    # กรอกข้อมูล username password
    Input Text    ${locator_username}    ${user}
    Input Text    ${locator_password}    ${pass}
    # กดปุ่ม login
    Click Element    ${locator_btn_login}
    # ตรวจสอบว่า msg ขึ้นไหม โดยรอใหตำแหน่งของตัว msg แจ้งเตือนแสดง
    Wait Until Element Is Visible    ${locator_error_msg}
    # รับข้อมูลจากเว็บไซต์ โดยดึงข้อมูลของ error msg
    ${txt}    Get Text    ${locator_error_msg}
    # เปรียบเทียบค่าระหว่างข้อในเว็บกับข้อมูลในตัวของ Requiestment
    Should Be Equal As Strings    ${txt}    ${errormsg}
    # ปิดเว็บ
    Close Browser



*** Test Cases ***
Verify input data fail
    [Template]    Input Data - fail
    ${EMPTY}    ${EMPTY}    Epic sadface: Username is required
    ${EMPTY}    aom         Epic sadface: Username is required
    aom         ${EMPTY}    Epic sadface: Password is required
    aom         aom         Epic sadface: Username and password do not match any user in this service

    