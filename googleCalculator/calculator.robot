*** Settings ***
Library    SeleniumLibrary
Test Setup    Open Google
Test Teardown    Close Browser

*** Variables ***
${url}        https://www.google.com/
${browser}    gc
${locator_search}    name=q
${locator_2}    xpath=//*[@id="rso"]/div[1]/div/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[4]/td[2]/div/div
${locator_4}    xpath=//*[@id="rso"]/div[1]/div/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[3]/td[1]/div/div
${locator_plus}    xpath=//*[@id="rso"]/div[1]/div/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[5]/td[4]/div/div
${locator_minus}       xpath=//*[@id="rso"]/div[1]/div/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[4]/td[4]/div/div
${locator_multiply}    xpath=//*[@id="rso"]/div[1]/div/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[3]/td[4]/div/div
${locator_divide}    xpath=//*[@id="rso"]/div[1]/div/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[2]/td[4]/div/div
${locator_ans}        xpath=//*[@id="rso"]/div[1]/div/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[5]/td[3]/div/div
${locator_result}    id=cwos

*** Keywords ***
Open Google
    [Documentation]    ทำการเปิด web Google
    [Tags]    open browser
    # เรียกใช้คำสั่ง open browser เพื่อทำการเปิด google chrome
    # โดยการส่ง             url     และ         ชื่อ brower ที่ใช้
    Open Browser           ${url}                ${browser}
    # ใช้คำสั่งเพื่อทำการขยายหน้าเว็บ
    Maximize Browser Window

Input Keyword for search
    [Documentation]     ใช้สำหรับกรอก keyword ที่ต้องการ
    [Tags]    search
    # ให้รอจนกว่าช่อง input search จะแสดงบนหน้าจอเว็บ
    Wait Until Element Is Visible    ${locator_search}
    # ทำการกรอกข้อมูล "calculator" ในช่อง input
    Input Text    ${locator_search}    calculator
    # สั่งให้ตัวของโปรแกรมกด Enter    อัตโนมัติ
    Press Keys    ${locator_search}    ENTER
    # รอจนกว่าหน้าจอจะแสดงคำว่า "calculator"
    Wait Until Page Contains    calculator

Verify Check result calculator - plus
    [Documentation]    ใช้สำหรับการบวก
    [Tags]    +
    # ให้กดเลข 4 ในหน้าเว็บ
    Click Element    ${locator_4}
    # ให้กด + ในหน้าเว็บ
    Click Element    ${locator_plus}
    # ให้กดเลข 2 ในหน้าเว็บ
    Click Element    ${locator_2}
    # ให้กด = ในหน้าเว็บ
    Click Element    ${locator_ans}
    # ทำการดึงข้อมูลผลลัพธ์ที่ได้มาเก็ยไว้ในตัวแปร ans
    ${ans}    Get Text    ${locator_result}
    # ทำการตรวจสอบค่าผลลัพธ์ที่ได้ โดยการเทียบกับคำตอบที่ถูก
    Should Be Equal As Integers    6    ${ans}

Verify Check result calculator - minus
    [Documentation]    ใช้สำหรับการลบ
    [Tags]    -
    # ให้กดเลข 4 ในหน้าเว็บ
    Click Element    ${locator_4}
    # ให้กด - ในหน้าเว็บ
    Click Element    ${locator_minus}
    # ให้กดเลข 2 ในหน้าเว็บ
    Click Element    ${locator_2}
    # ให้กด = ในหน้าเว็บ
    Click Element    ${locator_ans}
    # ทำการดึงข้อมูลผลลัพธ์ที่ได้มาเก็ยไว้ในตัวแปร ans
    ${ans}    Get Text    ${locator_result}
    # ทำการตรวจสอบค่าผลลัพธ์ที่ได้ โดยการเทียบกับคำตอบที่ถูก
    Should Be Equal As Integers    2    ${ans}

Verify Check result calculator - multiply
    [Documentation]    ใช้สำหรับการคูณ
    [Tags]    *
    # ให้กดเลข 4 ในหน้าเว็บ
    Click Element    ${locator_4}
    # ให้กด * ในหน้าเว็บ
    Click Element    ${locator_multiply}
    # ให้กดเลข 2 ในหน้าเว็บ
    Click Element    ${locator_2}
    # ให้กด = ในหน้าเว็บ
    Click Element    ${locator_ans}
    # ทำการดึงข้อมูลผลลัพธ์ที่ได้มาเก็ยไว้ในตัวแปร ans
    ${ans}    Get Text    ${locator_result}
    # ทำการตรวจสอบค่าผลลัพธ์ที่ได้ โดยการเทียบกับคำตอบที่ถูก
    Should Be Equal As Integers    8    ${ans}

Verify Check result calculator - divide
    [Documentation]    ใช้สำหรับการหาร
    [Tags]    /
    # ให้กดเลข 4 ในหน้าเว็บ
    Click Element    ${locator_4}
    # ให้กด / ในหน้าเว็บ
    Click Element    ${locator_divide}
    # ให้กดเลข 2 ในหน้าเว็บ
    Click Element    ${locator_2}
    # ให้กด = ในหน้าเว็บ
    Click Element    ${locator_ans}
    # ทำการดึงข้อมูลผลลัพธ์ที่ได้มาเก็ยไว้ในตัวแปร ans
    ${ans}    Get Text    ${locator_result}
    # ทำการตรวจสอบค่าผลลัพธ์ที่ได้ โดยการเทียบกับคำตอบที่ถูก
    Should Be Equal As Integers    2    ${ans}

*** Test Cases ***
TC-open web
    [Documentation]    ทดสอบการเปิด web 
    Input Keyword for search
    Close Browser

TC-plus
    [Documentation]    ทดสอบการบวก
    Input Keyword for search
    Verify Check result calculator - plus

TC-minus
    [Documentation]    ทดสอบการลบ
    Input Keyword for search
    Verify Check result calculator - minus

TC-multiply
    [Documentation]    ทดสอบการคูณ
    Input Keyword for search
    Verify Check result calculator - multiply

TC-divide
    [Documentation]    ทดสอบการหาร
    Input Keyword for search
    Verify Check result calculator - divide
