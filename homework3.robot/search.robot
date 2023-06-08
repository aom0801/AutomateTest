*** Settings ***
Library              SeleniumLibrary
Resource             ${CURDIR}/keyword.robot
Suite Setup          Set Selenium Speed                            0.25s
Suite Teardown       Close All Browsers
Test Setup           OpenWebBrowser
Test Teardown        Close Browser

*** Test Cases ***
# Search
TC-Search Data
    [Documentation]                   กรณีค้นหาข้อมูล
    [Tags]                            Pass
    [Setup]
    [Template]    Search Data 
       0    0    0
       1    1    1
       1    0    1
       1    0    0
       0    1    1
       0    1    0
       0    0    1
    [Teardown]

TC-No Data
    [Documentation]                    กรณีค้นหาข้อมูล แต่ไม่มีข้อมูล
    [Tags]                             Data  Empty
    Srearch Data - no role

TC-Clear Data
    [Documentation]                    กรณีเคลียร์ข้อมูล
    [Tags]                             Pass
    Clear Data

TC-Next Page
    [Documentation]                    กรณีมีข้อมูลมากกว่า 10 รายการสามารถกดไปหน้าถัดไปได้
    [Tags]                             Pass
    Next page    

TC-Rows per page
    [Documentation]                     กรณีต้องการแสดงข้อมูลมากกว่า 10 รายการในหน้าเดียวกัน
    [Tags]                              Pass
    Select rows per page

TC-open data user
    [Documentation]                     กรณีต้องการดูรายละเอียดของ user
    [Tags]                              Pass
    Open detail data

TC-Notification
    [Documentation]                     กรณีต้องการดูรายการการแจ้งเตือน
    [Tags]                              Pass
    Notification

TC-Open profile
    [Documentation]                     กรณีต้องการดูโปรไฟล์
    [Tags]                              Pass
    Profile

TC-Logout
    [Documentation]                     กรณีต้องการออกจะระบบ
    [Tags]                              Pass
    Logout

# Add User
TC-Add User - Back
    [Documentation]                      กรณีต้องการ add user แล้วกดย้อนกลับ
    [Tags]                               Pass
    Add User
    Click Element                        ${locator_add_user_back}
    Wait Until Page Contains             Search Filters                              5s

TC-Add User
    [Documentation]                      กรณีต้องการ add user กรณีกรอกข้อมูลครบถ้วน
    [Tags]                               Pass
    Add User
    Input data for register pass
    Sign up 

TC-reset data
    [Documentation]                       ใช้สำหรับกรณีเคลียร์ข้อมูล
    [Tags]                                Pass
    Add User
    Set Focus To Element    ${locator_reset}
    Input data for register pass
    # Reset Data

    
TC-verify formate email
    [Documentation]                        ใช้สำหรับกรณีที่ Email ไม่ถูก formate
    [Tags]                                 Fail
    Add User
    Input data for fail - formate email
    Verify error message - formate email

TC-verify case fail
    [Documentation]                        ใช้สำหรับทดสอบในกรณีกรอกข้อมูลไม่ครบถ้วน
    [Tags]                                 Fail
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

