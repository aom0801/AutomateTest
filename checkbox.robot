*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***

# TC-LAZada
#     Open Browser    https://member.lazada.co.th/user/register?spm=a2o4m.home.header.d6.11257f6dhtOtor    chrome
#     Wait Until Page Contains    รับข้อมูลสิทธิพิเศษ และโปรโมชั่นจากลาซาด้า ผ่านทาง SMS
#     Select Checkbox    id=enableSmsNewsletter
#     Sleep    5s
#     Close Browser

# TC-kru p'beam
#     Open Browser    https://automate-test.stpb-digital.com/register/    gc
#     Wait Until Page Contains    SQL
#     Select Checkbox    name=courses.SQL
#     Sleep    5s
#     Close Browser

# TC-ebay
#     Open Browser    https://signin.ebay.com/ws/eBayISAPI.dll?SignIn&ru=https%3A%2F%2Fwww.ebay.com%2F    gc
#     Wait Until Location Is Not    Stay signed in    5s
#     Select Checkbox    id=kmsi-checkbox
#     Sleep    5s
#     Close Browser    

TC-ThaiAirway
    Open Browser    https://www.thaiairways.com/app/rop/enroll/    gc
    Wait Until Page Contains    Enrolment    5s
    Select Checkbox    id=cb_accept
    Sleep    5s
    Close Browser     