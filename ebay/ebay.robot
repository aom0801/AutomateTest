*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/keyword.robot
Suite Setup    set selenium Speed    0.5s
Test Setup    open ebay web
Test Teardown    Close Browser
Suite Teardown    Close All Browsers
Default Tags    Pass

*** Test Cases ***
TC-Input Text - enter
    [Documentation]    กรอกข้อมูล ด้วยการกดปุ่ม
    [Tags]    btn
    Secet Catergory
    Verify input search data - cluck btn

TC-Input Text - bth
    Secet Catergory
    Verify input search data - enter

TC-Result data
    Verify input search data - enter
    Wait Until Element Is Visible    ${locator_result_number}
    Result Data    ${locator_result_number}
    
TC-Checkbox
    Verify input search data - cluck btn
    Wait Until Element Is Visible    ${locator_result_number}
    Set Focus To Element    ${locator_checkbox_brand}
    Click Element    ${locator_checkbox_brand}
    Wait Until Element Is Visible    ${locator_result_number}
    Result Data    ${locator_result_number}

TC-result - check box Condition
    Verify input search data - cluck btn
    Wait Until Element Is Visible    ${locator_result_number}
    Set Focus To Element    ${locator_condition}
    Click Element     ${locator_condition}
    Wait Until Element Is Visible    ${locator_result_number}
    Result Data    ${locator_result_number}
    
TC-result - check price
    Verify input search data - cluck btn
    Wait Until Element Is Visible    ${locator_result_number}
    Set Focus To Element    ${locator_price}
    Click Element    ${locator_price}
    Result Data    ${locator_result_number}

Verify Result Data to Keyword
    [Setup]
    [Documentation]    ตรวจสอบการกรอกข้อมูล
    [Tags]    tmp
    [Template]    Verify input search data - enter key Tempale
    iphone
    huawai
    sumsung
    oppo
    [Teardown]