*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}                   chrome
${URL}                       https://uat-regocile.getinvoice.net/regocile/login.html
${USERNAME}                  gamekittisak6@gmail.com 
${PASSWORD}                  db99bLydfbN
${LOGINBTN}                  xpath=//button[@id='login_btn'] 
${USERNAME_LOCATOR}          name=username 
${PASSWORD_LOCATOR}          name=password


*** Keywords ***

Open Browser To Login Page
      Open Browser  ${URL}   ${BROWSER}
      Maximize Browser Window

Input username
      Input Text    ${USERNAME_LOCATOR}   ${USERNAME}

Input password
      Input Text    ${PASSWORD_LOCATOR}   ${PASSWORD}

Submit Credentials
      Click Element        ${LOGINBTN}

*** Test Cases ***

TC01
    Open Browser To Login Page
    Input username
    Input password
    Submit Credentials
    Wait Until Page Does Not Contain                    Please wait...               
    Capture Page Screenshot            ${OUTPUTDIR}/Login/TC01/Login.png
    Close Browser

TC02
    Open Browser To Login Page
    Input Text    ${USERNAME_LOCATOR}   qwerty123
    Input Text    ${PASSWORD_LOCATOR}   ${PASSWORD}
    Click Element            xpath=//*[@id="btnTogglePassword"]
    Submit Credentials
    Wait Until Page Contains    Invalid user or password.
    Capture Page Screenshot            ${OUTPUTDIR}/Login/TC02/Login.png
    Close Browser

TC03
    Open Browser To Login Page
    Input Text    ${USERNAME_LOCATOR}   GaMeKitTisAk6@gmail.com 
    Input Text    ${PASSWORD_LOCATOR}   Db99blYdFbn
    Click Element            xpath=//*[@id="btnTogglePassword"]
    Submit Credentials
    Wait Until Page Contains    Invalid user or password.
    Capture Page Screenshot            ${OUTPUTDIR}/Login/TC03/Login.png
    Close Browser

TC04
    Open Browser To Login Page 
    Input Text    ${PASSWORD_LOCATOR}   ${PASSWORD}
    Click Element            xpath=//*[@id="btnTogglePassword"]
    Submit Credentials
    Wait Until Page Contains    Enter any username and password.
    Capture Page Screenshot            ${OUTPUTDIR}/Login/TC04/Login.png
    Close Browser


TC05
    Open Browser To Login Page
    Input Text    ${USERNAME_LOCATOR}   ${USERNAME}
    Input Text    ${PASSWORD_LOCATOR}   zxcvbbnm123
    Click Element            xpath=//*[@id="btnTogglePassword"]
    Submit Credentials
    Wait Until Page Contains    Invalid user or password.
    Capture Page Screenshot            ${OUTPUTDIR}/Login/TC05/Login.png
    Close Browser

TC06
    Open Browser To Login Page
    Input Text    ${USERNAME_LOCATOR}   ${USERNAME}
    Input Text    ${PASSWORD_LOCATOR}   DB99BlYDFBn
    Click Element            xpath=//*[@id="btnTogglePassword"]
    Submit Credentials
    Wait Until Page Contains    Invalid user or password.
    Capture Page Screenshot            ${OUTPUTDIR}/Login/TC06/Login.png
    Close Browser

TC07
    Open Browser To Login Page
    Input Text    ${USERNAME_LOCATOR}   ${USERNAME}
    Click Element            xpath=//*[@id="btnTogglePassword"]
    Submit Credentials
    Wait Until Page Contains    Enter any username and password.
    Capture Page Screenshot            ${OUTPUTDIR}/Login/TC07/Login.png
    Close Browser


TC08
    Open Browser To Login Page
    Click Element            xpath=//*[@id="btnTogglePassword"]
    Submit Credentials
    Wait Until Page Contains    Enter any username and password.
    Capture Page Screenshot            ${OUTPUTDIR}/Login/TC08/Login.png
    Close Browser
