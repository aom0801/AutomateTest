*** Settings ***
Library              SeleniumLibrary
Resource             ${CURDIR}/variable.robot
Resource             ${CURDIR}/keyword.robot
Suite Setup          Set Selenium Speed                            0.5s
Suite Teardown       Close All Browsers
Test Setup           Open WebBrowser
Test Teardown        Close Browser


*** Test Cases ***

TC-input data pass
    [Documentation]    กรณีกรอกข้อมูลครบถ้วน    
    [Tags]   Test Pass
    Input data for register pass    
    Sign up

TC-reset data
    [Documentation]    ใช้สำหรับกรณีเคลียร์ข้อมูล
    [Tags]    Test Pass
    Input data for register pass
    Click Element                        ${locator_reset}
    
TC-verify formate email
    [Documentation]    ใช้สำหรับกรณีที่ Email ไม่ถูก formate
    [Tags]    Test Fail
    Input data for fail - formate email
    # Verify error message - formate email
    Verify error message - Test Temples    ${locator_error_msg_email}

TC-verify case fail
    [Documentation]    ใช้สำหรับทดสอบในกรณีกรอกข้อมูลไม่ครบถ้วน
    [Tags]        Fail
    [Setup]
    [Template]    Input data for fail - Test Temples
    ${EMPTY}    นามสกุล      aom@gmail.com    0123456     0895737887    male     1    1    1    1    ${locator_error_msg_firstname}    This field is required    
    ชื่อ          ${EMPTY}    aom@gmail.com    0123456     0895737887    male     1    1    1    1    ${locator_error_msg_lastname}     This field is required
    ชื่อ          นามสกุล      ${EMPTY}         0123456     0895737887    male     1    1    1    1    ${locator_error_msg_email}        This field is required
    ชื่อ          นามสกุล      aom@gmail.com    ${EMPTY}    0895737887    male     1    1    1    1    ${locator_error_msg_password}     This field is required
    ชื่อ          นามสกุล      aom@gmail.com    0123456     ${EMPTY}      male     1    1    1    1    ${locator_error_msg_mobile}       This field is required
    ชื่อ          นามสกุล      aom@gmail.com    0123456     0895737887    EMPTY    1    1    1    1    ${locator_error_msg_gender}       This field is required
    ชื่อ          นามสกุล      aom@gmail.com    0123456     0895737887    male     0    1    1    1    ${locator_error_msg_courses}      This field is required
    ชื่อ          นามสกุล      aom@gmail.com    0123456     0895737887    male     1    0    1    1    ${locator_error_msg_nationality}  This field is required
    ชื่อ          นามสกุล      aom@gmail.com    0123456     0895737887    male     1    1    0    1    ${locator_error_msg_role}         This field is required
    ชื่อ          นามสกุล      aom@gmail.com    0123456     0895737887    male     1    1    1    0    ${locator_error_msg_plan}         This field is required
    [Teardown]

