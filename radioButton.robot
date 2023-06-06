*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
# TC-FB
#     Open Browser    https://th-th.facebook.com/r.php?locale=th_TH&display=page    gc
#     Wait Until Element Is Visible    name=sex    5s
#     Select Radio Button    sex    1
#     Sleep    5s
#     Close Browser

# TC-Kru p'Beam register
#     Set Selenium Speed    1s
#     Open Browser    https://automate-test.stpb-digital.com/register/    gc
#     Wait Until Page Contains    Gender
#     Select Radio Button    validation-basic-radio    female
#     Sleep    5s
#     Close Browser

TC-ebay
    Open Browser    https://signup.ebay.com/pa/crte?ru=https%3A%2F%2Fwww.ebay.com%2F    gc
    Wait Until Page Contains    Create an account
    Select Radio Button    accountcreate    personalaccount
    Sleep    5s
    Close Browser
