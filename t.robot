*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Open Browser with Chrome Options
    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_experimental_option    useAutomationExtension    ${False}
    ${chrome_driver}    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Go To    https://www.example.com
    # Perform your test steps here
    Close All Browsers
