*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/loginKeyword.robot

*** Test Cases ***
Verify login pass
    Opne web browser
    Input username and password