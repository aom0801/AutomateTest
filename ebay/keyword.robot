*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/variable.robot
*** Keywords ***
open ebay web
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Wait Until Element Is Visible    ${locator_search}

Verify input search data - enter
    Wait Until Element Is Visible    ${locator_search}
    Input Text    ${locator_search}    iPhone
    Press Keys    ${locator_search}    ENTER

Verify input search data - cluck btn
    Wait Until Element Is Visible    ${locator_search}
    Input Text    ${locator_search}    iphone
    Click Element    ${locator_btn_search}

Secet Catergory
    Wait Until Element Is Visible    ${locator_categories}
    Click Element    ${locator_categories}
    Select From List By Value    ${locator_categories}    15032

Select product
    Wait Until Element Is Visible    ${locator_name_product}
    Click Element    ${locator_name_product}
    Wait Until Page Contains    Apple iPhone 
    Close Browser

Select product2
    Wait Until Element Is Visible    ${locator_name_product}
    Click Element    ${locator_name_product}
    Wait Until Page Contains    Apple iPhone 
    Close Browser

Result Data
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator_result_number}
      ${num}=    Get Text    ${locator}
        IF  ${num} > 0
            Log To Console    Pass
        END

Verify input search data - enter key Tempale
    [Arguments]    ${txt}
    open ebay web
    Wait Until Element Is Visible    ${locator_search}
    Input Text    ${locator_search}    ${txt}
    Press Keys    ${locator_search}    ENTER
    Close Browser