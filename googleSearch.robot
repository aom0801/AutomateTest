*** Settings ***
Library    SeleniumLibrary
Default Tags    Done

*** Variables ***
${url}    http://www.google.co.th
${browser}    gc
${locator_search}    name=q
${locator_result}    id=wob_loc

*** Keywords ***
OpentGoogleWeb
    [Documentation]    เปิดเว็บ
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Wait Until Page Contains Element    ${locator_search}

Input keyword
    [Documentation]    ใช้สำหรับกรอกข้อมูล
    [Arguments]   ${keyword}
    Input Text    ${locator_search}    ${keyword}
    Press Keys    ${locator_search}    ENTER
    Wait Until Page Contains    สภาพอากาศ

*** Test Cases ***
Verify input keyword - water bkk
    [Documentation]    ใช้สำหรับการตรวจสอบข้อมูลสภาพอากาศ กทม
    # [tags]    Done
    OpentGoogleWeb
    Input keyword    สภาพอากาศกทม
    Close Browser

Verify input keyword - cnx
    [Documentation]    ใช้สำหรับการตรวจสอบข้อมูลสภาพอากาศ เชียงใหม่
    [Tags]    Error
    OpentGoogleWeb
    Input keyword    สภาพอากาศเชียงใหม่
    Close Browser
