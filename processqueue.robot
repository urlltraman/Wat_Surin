*** Settings ***
Library  SeleniumLibrary
Test Setup    Open Browser and Login Regocile
Test Teardown    Close Browser
*** Variables ***
${BROWSER}                   chrome
${URL}                       https://uat-regocile.getinvoice.net/regocile/login.html
${USERNAME}                  gamekittisak6@gmail.com 
${PASSWORD}                  db99bLydfbN
${LOGINBTN}                  xpath=//button[@id='login_btn'] 
${USERNAME_LOCATOR}          name=username 
${PASSWORD_LOCATOR}          name=password
${REGOCILE}                  xpath=(//span[@class='title'])[1]
${BATCHLIST}                 xpath=(//span[@class='title'])[2]
${NEWBATCH}                  xpath=(//span[@class='title'])[3]
${TRASH}                     xpath=(//span[@class='title'])[4]
${SETTING}                   xpath=(//span[@class='title'])[5]
${MODEL}                     xpath=(//span[@class='title'])[6]
${FILETEMPLATE}              xpath=(//span[@class='title'])[7]
${RULE}                      xpath=(//span[@class='title'])[8]
${ADMIN}                     xpath=(//span[@class='title'])[9]
${PROCESSQUEUE}              xpath=(//span[@class='title'])[10]
${USERMENU}                  xpath=(//span[@class='title'])[11]
${COMPANY}                   xpath=(//span[@class='title'])[12]
${AUDITLOG}                  xpath=(//span[@class='title'])[13]
${CREATECOMPANY}             xpath=//*[@id='createOU']
${SHORTNAME}                 xpath=//*[@name='txtShortName'] 
${FULLTH}                    xpath=//*[@name="txtFullnameTH"]
${FULLEN}                    xpath=//*[@name="txtFullnameEN"]
${ADDRESSTH}                 xpath=//*[@name="txtAddressTH"]
${ADDRESSEN}                 xpath=//*[@name="txtAddressEN"] 
${TAXID}                     xpath=//*[@id="ou_tax_id"]
${BTN_COMPANY_SAVE}          xpath=//button[@id='saveou']
${BTN_COMPANY_CANCLE}        xpath=//button[@id='btnCancleOu']
${BTN_INVITE}                xpath=//div/a[@id='btnCreateUser']
${INVITE_EMAIL}              xpath=//input[@id='txtEmail']
${INVITE_ADMIN}              xpath=//span[@class='bootstrap-switch-label']
${INVITE_SAVE}               xpath=//button[@id='btnSaveUser']
${INVITE_CANCLE}             xpath=//button[@id='btnCancel']
${EMAIL}                     gamekittisak6@gmail.com
${LIST_COMPANY}              xpath=//select[@id='cboCompany']
${ERR_FULLNAMETH}            xpath=//label[@id='ou_full_name_th-error']
${ERR_TAXID}                 xpath=//label[@id='ou_tax_id-error']
${PROCESS_STATUS}            xpath=//thead[@id='queueFilter']/tr/td[1]/input[@class='form-control']
${PROCESS_QUEUEID}           xpath=//thead[@id='queueFilter']/tr/td[2]/input[@class='form-control']
${PROCESS_BATCH}             xpath=//thead[@id='queueFilter']/tr/td[3]/input[@class='form-control']
${PROCESS_RULE}              xpath=//thead[@id='queueFilter']/tr/td[4]/input[@class='form-control']
${PROCESS_LOGIN}             xpath=//thead[@id='queueFilter']/tr/td[5]/input[@class='form-control']
${PROCESS_CREATE}            xpath=//thead[@id='queueFilter']/tr/td[6]/input[@class='form-control']
${PROCESS_UPDATE}            xpath=//thead[@id='queueFilter']/tr/td[7]/input[@class='form-control']
${PROCESS_USAGE}             xpath=//thead[@id='queueFilter']/tr/td[8]/input[@class='form-control']
${RECORDS}                   xpath=//label/select[@class='form-control input-sm input-xsmall input-inline']
${PROCESS_ERROR}             xpath=//td[@class='dataTables_empty']

*** Keywords ***
Open Browser and Login Regocile
    Open Browser  ${URL}   ${BROWSER}
    Maximize Browser Window
    Input Text    ${USERNAME_LOCATOR}   ${USERNAME}
    Input Text    ${PASSWORD_LOCATOR}   ${PASSWORD}
    Click Element        ${LOGINBTN}
    Sleep         3s




*** Test Cases ***

TC01
     
     Click Element                ${ADMIN}
     Sleep          2s
     Click Element               ${PROCESSQUEUE}
     Capture Page Screenshot                    ${OUTPUTDIR}/Process/TC01/ProcessQueue.png

TC02
     
     Click Element                ${ADMIN}
     Sleep          2s
     Click Element               ${PROCESSQUEUE}
     Sleep         2
     Select From List By Label                       ${RECORDS}           10
     Mouse Down                    xpath=//*[@id="tbl_queue_info"]           
     Capture Page Screenshot                    ${OUTPUTDIR}/Process/TC02/R10.png
     Sleep         2s
     Select From List By Label                        ${RECORDS}           25
     Mouse Down                    xpath=//*[@id="tbl_queue_info"]           
     Capture Page Screenshot                    ${OUTPUTDIR}/Process/TC02/R25.png
     Sleep         2s
     Select From List By Label                        ${RECORDS}           50
     Mouse Down                    xpath=//*[@id="tbl_queue_info"]           
     Capture Page Screenshot                    ${OUTPUTDIR}/Process/TC02/R50.png
     Sleep         2s
     Select From List By Label                      ${RECORDS}           100
     Mouse Down                    xpath=//*[@id="tbl_queue_info"]        
     Capture Page Screenshot                    ${OUTPUTDIR}/Process/TC02/R100.png


TC03
     
     Click Element                ${ADMIN}
     Sleep          2s
     Click Element               ${PROCESSQUEUE}
     Sleep         2s
     Select From List By Label                       ${RECORDS}          10
     Click Element                        xpath=//*[@id="tbl_queue_paginate"]/ul/li[9]/a
     Sleep          2s
     Mouse Down                    xpath=//*[@id="tbl_queue_info"]           
     Capture Page Screenshot                    ${OUTPUTDIR}/Process/TC03/R10.png
     Sleep         2s
     Select From List By Label                       ${RECORDS}          25
     Click Element                        xpath=//*[@id="tbl_queue_paginate"]/ul/li[5]/a
     Sleep          2s
     Mouse Down                    xpath=//*[@id="tbl_queue_info"]           
     Capture Page Screenshot                    ${OUTPUTDIR}/Process/TC03/R25.png
     Sleep         2s
     Select From List By Label                       ${RECORDS}           50
     Click Element                        xpath=//*[@id="tbl_queue_paginate"]/ul/li[6]/a
     Sleep          2s
     Mouse Down                    xpath=//*[@id="tbl_queue_info"]           
     Capture Page Screenshot                    ${OUTPUTDIR}/Process/TC03/R50.png
     Sleep         2s
     Select From List By Label                       ${RECORDS}          100
     Click Element                        xpath=//*[@id="tbl_queue_paginate"]/ul/li[4]/a
     Sleep          2s
     Mouse Down                    xpath=//*[@id="tbl_queue_info"]        
     Capture Page Screenshot                    ${OUTPUTDIR}/Process/TC03/R100.png


TC04
     
     Click Element      ${ADMIN}
     Sleep         2s
     Click Element      ${PROCESSQUEUE}
     Sleep         2s
     Input Text     ${PROCESS_STATUS}    Success
     Select From List By Label      ${RECORDS}      25
     Capture Page Screenshot                    ${OUTPUTDIR}/Process/TC04/Success.png
     Click Element                    xpath=//*[@id="refreshQueue"]
     Sleep          2s
     Input Text     ${PROCESS_STATUS}    Error
     Select From List By Label      ${RECORDS}      50
     Capture Page Screenshot                    ${OUTPUTDIR}/Process/TC04/Error.png
     Click Element                    xpath=//*[@id="refreshQueue"]
     Sleep          2s
     Input Text     ${PROCESS_QUEUEID}    3
     Select From List By Label      ${RECORDS}      50
     Capture Page Screenshot                    ${OUTPUTDIR}/Process/TC04/Queueid.png
     Click Element                    xpath=//*[@id="refreshQueue"]
     Sleep          2s
     Input Text     ${PROCESS_BATCH}    test
     Select From List By Label      ${RECORDS}      25
     Capture Page Screenshot                    ${OUTPUTDIR}/Process/TC04/Batchname.png
     Click Element                    xpath=//*[@id="refreshQueue"]
     Sleep          2s
     Input Text     ${PROCESS_RULE}    simple
     Select From List By Label      ${RECORDS}      25
     Capture Page Screenshot                    ${OUTPUTDIR}/Process/TC04/Rule.png
     Click Element                    xpath=//*[@id="refreshQueue"]
     Sleep          2s
     Input Text     ${PROCESS_LOGIN}    gamekittisak6
     Select From List By Label      ${RECORDS}      25
     Capture Page Screenshot                    ${OUTPUTDIR}/Process/TC04/Loginname.png
     Click Element                    xpath=//*[@id="refreshQueue"]
     Sleep          2s
     Input Text     ${PROCESS_CREATE}    2022
     Select From List By Label      ${RECORDS}      50
     Capture Page Screenshot                    ${OUTPUTDIR}/Process/TC04/Createdate.png
     Click Element                    xpath=//*[@id="refreshQueue"]
     Sleep          2s
     Input Text     ${PROCESS_UPDATE}    2023
     Select From List By Label      ${RECORDS}      50
     Capture Page Screenshot                    ${OUTPUTDIR}/Process/TC04/Update.png
     Click Element                    xpath=//*[@id="refreshQueue"]
     Sleep          2s
     Input Text     ${PROCESS_USAGE}    10
     Select From List By Label      ${RECORDS}      50
     Capture Page Screenshot                    ${OUTPUTDIR}/Process/TC04/Usage.png
     Click Element                    xpath=//*[@id="refreshQueue"]
     Sleep          2s
     



























