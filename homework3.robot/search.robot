*** Settings ***
Library              SeleniumLibrary
Resource             ${CURDIR}/keyword.robot
Suite Setup          Set Selenium Speed                            0.5s
Suite Teardown       Close All Browsers
Test Setup           OpenWebBrowser
Test Teardown        Close Browser

*** Test Cases ***
TC-Search Data
    [Documentation]    กรณีค้นหาข้อมูล
    [Tags]             Pass
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
    [Documentation]    กรณีค้นหาข้อมูล
    [Tags]             Data  Empty
    Srearch Data - no role

TC-Clear Data
    [Documentation]    กรณีเคลียร์ข้อมูล
    [Tags]             Pass
    Clear Data

TC-Next Page
    [Documentation]    กรณีมีข้อมูลมากกว่า 10 รายการสามารถกดไปหน้าถัดไปได้
    [Tags]             Pass
    Next page

TC-Rows per page
    [Documentation]    กรณีต้องการแสดงข้อมูลมากกว่า 10 รายการในหน้าเดียวกัน
    [Tags]             Pass
    Select rows per page

TC-Add User
    [Documentation]    กรณีต้องการ add user
    [Tags]             Pass
    Add User

TC-open data user
    [Documentation]    กรณีต้องการดูรายละเอียดของ user
    [Tags]             Pass
    Open detail data

TC-Notification
    [Documentation]    กรณีต้องการดูรายการการแจ้งเตือน
    [Tags]             Pass
    Notification

TC-Open profile
    [Documentation]    กรณีต้องการดูโปรไฟล์
    [Tags]             Pass
    Profile

TC-Logout
    [Documentation]    กรณีต้องการออกจะระบบ
    [Tags]             Pass
    Logout