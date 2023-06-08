*** Settings ***
Library    AppiumLibrary

*** Variables ***
${RemoteUrl}            http://localhost:4723/wd/hub
${platformName}         Android
${platformVersion}      12.0
${deviceName}           emulator-5554
${appPackage}           com.google.android.youtube
${appActivity}          com.google.android.apps.youtube.app.watchwhile.WatchWhileActivity

*** Keywords ***
OpenAppStart
    Open Application    ${RemoteUrl}    
    ...                 platformName=${platformName}
    ...                 platformVersion=${platformVersion}
    ...                 deviceName=${deviceName}
    ...                 automationName=UiAutomator2
    ...                 newCommandTimeout=2500
    ...                 appPackage=${appPackage}
    ...                 appActivity=${appActivity}

YouTubeStart
    Wait Until Page Contains         YouTube
    Tap                              id=com.google.android.youtube:id/youtube_logo
    # Tap                            xPath=//android.widget.Button[@content-desc="Shorts"]/android.widget.ImageView
    Click Element                    xpath=//android.widget.ImageView[@content-desc="Search"]
    Wait Until Element Is Visible    id=com.google.android.youtube:id/search_edit_text
    Input Text                       id=com.google.android.youtube:id/search_edit_text        เพลง
    Wait Until Element Is Visible    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/androidx.drawerlayout.widget.DrawerLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[2]/android.view.ViewGroup/android.widget.ScrollView/android.widget.FrameLayout[2]/android.widget.FrameLayout/android.widget.ListView/android.view.ViewGroup[1]/android.widget.TextView
    Tap                              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/androidx.drawerlayout.widget.DrawerLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[2]/android.view.ViewGroup/android.widget.ScrollView/android.widget.FrameLayout[2]/android.widget.FrameLayout/android.widget.ListView/android.view.ViewGroup[1]/android.widget.TextView
    FOR  ${i}  IN  RANGE    5
         Swipe    500      1500    500    300    2000
    END  

*** Test Cases ***
First Scrip
    OpenAppStart
    YouTubeStart
    Close Application