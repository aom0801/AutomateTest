*** Settings ***
Library   AppiumLibrary

*** Variables ***
${RemoteUrl}                                    http://localhost:4723/wd/hub
${platformName}                                 Android
${platformVersion}                              12.0
${deviceName}                                   emulator-5554
${appPackage}                                   com.android.settings
${appActivity}                                  .Settings
${locator_search}                               id=com.android.settings:id/search_action_bar_title
${locator_search_text}                          id=com.google.android.settings.intelligence:id/open_search_view_edit_text
${locator_network_internet}                     xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.ScrollView/android.widget.LinearLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.FrameLayout/android.support.v7.widget.RecyclerView/android.widget.LinearLayout[2]/android.widget.LinearLayout
${locator_airplane_switch}                      id=android:id/switch_widget
${locator_btn_back1}                            xpath=//android.widget.ImageButton[@content-desc="Navigate up"]
${locator_btn_back2}                            xpath=//android.widget.ImageButton[@content-desc="Back"]

*** Keywords ***
Open App Setting
    [Documentation]    เปิดแอป Setting
    Open Application                            ${RemoteUrl}
    ...                                         platformName=${platformName}
    ...                                         platformVersion=${platformVersion}
    ...                                         deviceName=${deviceName}
    ...                                         automationName=UiAutomator2
    ...                                         newCommandTimeout=2500
    ...                                         appPackage=${appPackage}
    ...                                         appActivity=${appActivity}

Search
    [Documentation]    ค้นหาคำว่า "Network"
    Wait Until Page Contains                     Settings
    Wait Until Element Is Visible                ${locator_search}
    Click Element                                ${locator_search}
    Wait Until Page Contains                     Search settings
    Wait Until Page Contains Element             ${locator_search_text}                    3s
    Input Text                                   ${locator_search_text}                    Network
    Wait Until Element Is Visible                ${locator_network_internet}               3s
    Tap                                          ${locator_network_internet}

Click Switch Airplane
    [Documentation]    กดสวิชเปิดโหมดเครื่องบิน
    Wait Until Page Contains Element             ${locator_airplane_switch}                3s
    Click Element                                ${locator_airplane_switch}

Click Back to Home
    [Documentation]    กลับหน้าหลัก
    Wait Until Element Is Visible                ${locator_btn_back1}                       3s
    Tap                                          ${locator_btn_back1}
    Wait Until Element Is Visible                ${locator_btn_back2}                       3s
    Tap                                          ${locator_btn_back2}
    Wait Until Page Contains                     Settings                                   3s
    Swipe                                        500     600    500    300    1500
              
*** Test Cases ***
TC - Open Setting airplane mode
    [Documentation]    เปิด - ปิด โหมดเครื่องบิน
    Open App Setting
    Search
    Click Switch Airplane
    Click Back to Home
    Close Application
    