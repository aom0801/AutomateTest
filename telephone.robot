*** Settings ***
Library    AppiumLibrary

*** Variables ***
${RemoteUrl}            http://localhost:4723/wd/hub
${platformName}         Android
${platformVersion}      12.0
${deviceName}           emulator-5554
${appPackage}           com.android.dialer
${appActivity}          .main.impl.MainActivity
${locator_touhPad}       id=com.android.dialer:id/fab
${locator_num_0}        xpath=//android.widget.FrameLayout[@content-desc="0"]/android.widget.LinearLayout/android.widget.TextView
${locator_num_8}        xpath=//android.widget.FrameLayout[@content-desc="8,TUV"]/android.widget.LinearLayout/android.widget.TextView
${locator_tel}           id=com.android.dialer:id/dialpad_floating_action_button
${locator_finish}        id=com.android.dialer:id/incall_end_call
${locator_Specker}        id=com.android.dialer:id/incall_third_button
${locator_recents}        id=com.android.dialer:id/call_log_tab



*** Keywords ***
Set Open App
    Open Application    ${RemoteUrl}
    ...                 platformName=${platformName}
    ...                 platformVersion=${platformVersion}
    ...                 deviceName=${deviceName}
    ...                 automationName=UiAutomator2
    ...                 newCommandTimeout=2500
    ...                 appPackage=${appPackage}
    ...                 appActivity=${appActivity}

Click Mobile phone
    Wait Until Page Contains    ADD A FAVORITE    3s
    Click Element    ${locator_touhPad}
    Tap    ${locator_num_0}
    Tap    ${locator_num_8}
    Tap    ${locator_num_8}
    Tap    ${locator_num_8}


Click Tel
    Wait Until Element Is Visible    ${locator_tel}    3s
    Tap    ${locator_tel}

Wait Call Finish
    Wait Until Page Contains Element    ${locator_finish}
    Tap    ${locator_finish}
    Wait Until Page Contains    ADD A FAVORITE    3s

Block Number
    Wait Until Element Is Visible    ${locator_recents}    3s
    Click Element    ${locator_recents}
    Tap                xpath=//hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup[2]/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.support.v7.widget.RecyclerView/android.widget.LinearLayout[1]/android.widget.FrameLayout
    Wait Until Element Is Visible    id=com.android.dialer:id/block_action
    Click Element    id=com.android.dialer:id/block_action
    Wait Until Page Contains Element    id=android:id/button1
    Click Element    id=android:id/button1
    Wait Until Element Is Visible    id=com.android.dialer:id/unblock_action

    
    
*** Test Cases ***
Open Phone
    Set Open App
    Click Mobile phone
    Click Tel
    Wait Call Finish
    Close Application

Block
    Set Open App
    Block Number