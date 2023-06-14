*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Open Chrome with custom options
    ${options}    Evaluate    selenium.webdriver.ChromeOptions()    selenium.webdriver.chrome.options
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Create WebDriver    Chrome    chrome_options=${options}
    Go To    http://google.com/
    # Add your test steps here
    Close All Browsers
