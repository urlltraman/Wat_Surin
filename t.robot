*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Open Chrome with custom options
    ${options}    Evaluate    selenium.webdriver.ChromeOptions()    selenium.webdriver.chrome.options
    Call Method    ${options}    add_argument   --headless
    Call Method    ${options}    add_argument     --disable-gpu
    Create WebDriver    Chrome    chrome_options=${options}
    Go To    http://google.com/
    # Add your test steps here
    Close All Browsers
