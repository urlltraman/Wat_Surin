*** Settings ***
Library  SeleniumLibrary
Resource         ${CURDIR}/Resource/ResourceRule.robot
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
${CREATEMODEL}                xpath=//a[@id="create"]
${SEARCH_MODELNAME}            xpath=//*[@id="modelFilter"]/tr/td[1]/input
${SEARCH_CREATE_BY}            xpath=//*[@id="modelFilter"]/tr/td[2]/input
${SEARCH_CREATE_DATE}            xpath=//*[@id="modelFilter"]/tr/td[3]/input
${SEARCH_UPDATE_BY}            xpath=//*[@id="modelFilter"]/tr/td[4]/input
${SEARCH_UPDATE_DATE}            xpath=//*[@id="modelFilter"]/tr/td[5]/input
${BTN_OK}                            xpath=/html/body/div[4]/div/div[6]/button[1]
${BTN_MODEL_CANCLE}                    xpath=//*[@id="btnCancle"]
${BTN_MODEL_SAVE}                       xpath=//button[@id="saveModel"]





*** Test Cases ***

Delete Data
    
    Choose Settings
    Choose Model 
    Sleep         3s
    Input Text                             ${SEARCH_MODELNAME}           AutomatedtestUpdate
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                     ${SEARCH_MODELNAME}      
    Sleep         2s
    Input Text                             ${SEARCH_MODELNAME}           AutomatedtestDuplicate
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s



TS0-TC01
    
    Choose Settings
    Choose Model 
    Sleep         3s
    Capture Page Screenshot                    ${OUTPUTDIR}/Model/TC01/Model.png

TS0-TC02
    
    Choose Settings
    Choose Model 
    Sleep         3s
    Select From List By Label                   xpath=//*[@id="tbl_model_length"]/label/select         25
    Mouse Down                    xpath=//*[@id="tbl_model_info"]          
    Capture Page Screenshot                    ${OUTPUTDIR}/Model/TC02/R25.png
    Sleep         2s
    Select From List By Label                   xpath=//*[@id="tbl_model_length"]/label/select         50
    Mouse Down                    xpath=//*[@id="tbl_model_info"]          
    Capture Page Screenshot                    ${OUTPUTDIR}/Model/TC02/R50.png
    Sleep         2s
    Select From List By Label                   xpath=//*[@id="tbl_model_length"]/label/select         100
    Mouse Down                    xpath=//*[@id="tbl_model_info"]          
    Capture Page Screenshot                    ${OUTPUTDIR}/Model/TC02/R100.png
    Sleep         2s
    Select From List By Label                   xpath=//*[@id="tbl_model_length"]/label/select         10
    Mouse Down                    xpath=//*[@id="tbl_model_info"]          
    Capture Page Screenshot                    ${OUTPUTDIR}/Model/TC02/R10.png
    Sleep         2s


TS0-TC03
    
    Choose Settings
    Choose Model 
    Sleep         3s
    Click Element                    xpath=//*[@id="tbl_model_paginate"]/ul/li[8]/a
    Mouse Down                    xpath=//*[@id="tbl_model_paginate"]/ul/li[4]/a
    Capture Page Screenshot                    ${OUTPUTDIR}/Model/TC03/First-Second.png
    Sleep        1s
    Click Element                 xpath=//*[@id="tbl_model_paginate"]/ul/li[3]/a
    Sleep        2s
    Click Element                 xpath=//*[@id="tbl_model_paginate"]/ul/li[9]/a
    Mouse Down                    xpath=//*[@id="tbl_model_paginate"]/ul/li[4]/a
    Capture Page Screenshot                    ${OUTPUTDIR}/Model/TC03/First-Last.png
    Sleep        2s
    Click Element                 xpath=//*[@id="tbl_model_paginate"]/ul/li[2]/a
    Mouse Down                    xpath=//*[@id="tbl_model_paginate"]/ul/li[4]/a
    Capture Page Screenshot                    ${OUTPUTDIR}/Model/TC03/Last-Preview.png
    Sleep        2s
    Click Element                 xpath=//*[@id="tbl_model_paginate"]/ul/li[9]/a
    Sleep        2s
    Click Element                 xpath=//*[@id="tbl_model_paginate"]/ul/li[1]/a
    Mouse Down                    xpath=//*[@id="tbl_model_paginate"]/ul/li[4]/a
    Capture Page Screenshot                    ${OUTPUTDIR}/Model/TC03/Last-First.png
    Sleep        2s
    

TS0-TC04
    
    Choose Settings
    Choose Model 
    Sleep         3s
    Input Text                 ${SEARCH_MODELNAME}              simple
    Capture Page Screenshot                    ${OUTPUTDIR}/Model/TC04/Modelname.png
    Clear Element Text            ${SEARCH_MODELNAME}
    Sleep          1s
    Input Text                 ${SEARCH_CREATE_BY}              gamekittisak6
    Capture Page Screenshot                    ${OUTPUTDIR}/Model/TC04/CreatBy.png
    Clear Element Text            ${SEARCH_CREATE_BY}  
    Sleep          1s
    Input Text                 ${SEARCH_CREATE_DATE}              2022
    Capture Page Screenshot                    ${OUTPUTDIR}/Model/TC04/CreatDate.png
    Clear Element Text            ${SEARCH_CREATE_DATE} 
    Sleep          1s
    Input Text                 ${SEARCH_UPDATE_BY}              p
    Capture Page Screenshot                    ${OUTPUTDIR}/Model/TC04/UpdateBy.png
    Clear Element Text            ${SEARCH_UPDATE_BY}  
    Sleep          1s
    Input Text                 ${SEARCH_UPDATE_DATE}              2022
    Capture Page Screenshot                    ${OUTPUTDIR}/Model/TC04/UpdateDate.png
    Clear Element Text            ${SEARCH_UPDATE_DATE} 
    Sleep          1s


TS0-TC05
    
    Choose Settings
    Choose Model 
    Creat Model
    Input Text                             xpath=//input[@id="modelName"]            Automatedtest
    Select Checkbox                        xpath=//input[@id="check0"]
    Input Text                             xpath=//input[@id="Feild0"]        number
    Select From List By Label              xpath=//select[@id="select0"]            number
    Add Row
    Wait Until Element Is Enabled          xpath=//input[@id="Feild1"]       
    Select Checkbox                        xpath=//input[@id="check1"]
    Input Text                             xpath=//input[@id="Feild1"]        date
    Select From List By Label              xpath=//select[@id="select1"]            date  
    Add Row
    Wait Until Element Is Enabled          xpath=//input[@id="Feild2"]
    Select Checkbox                        xpath=//input[@id="check2"]
    Input Text                             xpath=//input[@id="Feild2"]        text
    Select From List By Label              xpath=//select[@id="select2"]            text
    Add Row
    Wait Until Element Is Enabled          xpath=//input[@id="Feild3"] 
    Select Checkbox                        xpath=//input[@id="check3"]
    Input Text                             xpath=//input[@id="Feild3"]        timestamp
    Select From List By Label              xpath=//select[@id="select3"]            timestamp
    Save Row
    Verify Save Row Complete
    Sleep         2
    Input Text                    ${SEARCH_MODELNAME}                Automatedtest
    Capture Page Screenshot                    ${OUTPUTDIR}/Model/TC05/Model.png
    Sleep            1s
    Click Element                    xpath=//*[@id="tbl_model"]/tbody/tr/td[1]/a
    Sleep            2s
    Capture Page Screenshot                    ${OUTPUTDIR}/Model/TC05/Modeldetails.png

TS0-TC06
    
    Choose Settings
    Choose Model 
    Creat Model
    Input Text                             xpath=//input[@id="modelName"]            Automatedtest
    Select Checkbox                        xpath=//input[@id="check0"]
    Input Text                             xpath=//input[@id="Feild0"]        number
    Select From List By Label              xpath=//select[@id="select0"]            number
    Add Row
    Wait Until Element Is Enabled          xpath=//input[@id="Feild1"]       
    Select Checkbox                        xpath=//input[@id="check1"]
    Input Text                             xpath=//input[@id="Feild1"]        date
    Select From List By Label              xpath=//select[@id="select1"]            date  
    Add Row
    Wait Until Element Is Enabled          xpath=//input[@id="Feild2"]
    Select Checkbox                        xpath=//input[@id="check2"]
    Input Text                             xpath=//input[@id="Feild2"]        text
    Select From List By Label              xpath=//select[@id="select2"]            text
    Add Row
    Wait Until Element Is Enabled          xpath=//input[@id="Feild3"] 
    Select Checkbox                        xpath=//input[@id="check3"]
    Input Text                             xpath=//input[@id="Feild3"]        timestamp
    Select From List By Label              xpath=//select[@id="select3"]            timestamp
    Save Row
    Sleep         2s
    Verify Model Name Duplicate
    Capture Page Screenshot                    ${OUTPUTDIR}/Model/TC06/NameDup.png




    
TS0-TC07
    
    Choose Settings
    Choose Model 
    Creat Model
    Save Row
    Wait Until Page Contains               This field is required.
    Capture Page Screenshot                    ${OUTPUTDIR}/Model/TC07/Notinput.png
    Sleep        2s
    Input Text                         xpath=//input[@id="modelName"]          1
    Save Row
    Sleep        2s
    Wait Until Page Contains               Please input a-z, A-Z and _ (underscore) only for model name.
    Capture Page Screenshot                    ${OUTPUTDIR}/Model/TC07/Number.png
    Click Element            xpath=/html/body/div[4]/div/div[6]/button[1]              
    Sleep        2s
    Clear Element Text                xpath=//input[@id="modelName"] 
    Input Text                         xpath=//input[@id="modelName"]          @#$
    Save Row
    Sleep        2s
    Wait Until Page Contains               Please input a-z, A-Z and _ (underscore) only for model name.
    Capture Page Screenshot                    ${OUTPUTDIR}/Model/TC07/SPCha.png
    Click Element            xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep        2s
    Clear Element Text                xpath=//input[@id="modelName"] 
    Input Text                         xpath=//input[@id="modelName"]          auto
    Save Row
    Sleep        2s
    Wait Until Page Contains               Please input data field name.
    Capture Page Screenshot                    ${OUTPUTDIR}/Model/TC07/Nodata.png
    Click Element            xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep        2s


TS0-TC08
    
    Choose Settings
    Choose Model 
    Sleep           2s
    Input Text                    ${SEARCH_MODELNAME}          Automatedtest
    Sleep           2s
    Click Element                    xpath=//*[@id="tbl_model"]/tbody/tr/td[1]/a
    Sleep           2s
    Capture Page Screenshot                    ${OUTPUTDIR}/Model/TC08/Beforeupdate.png
    Input Text                  xpath=//*[@id="modelName"]                AutomatedtestUpdate 
    Input Text                             xpath=//input[@id="Feild0"]        Dateupdate
    Select From List By Label              xpath=//select[@id="select0"]            date
    Input Text                             xpath=//input[@id="Feild1"]        Userupdate
    Select From List By Label              xpath=//select[@id="select1"]            text
    Input Text                             xpath=//input[@id="Feild2"]        Typeupdate
    Select From List By Label              xpath=//select[@id="select2"]            text
    Input Text                             xpath=//input[@id="Feild3"]        Productupdate
    Select From List By Label              xpath=//select[@id="select3"]            text
    Add Row
    Wait Until Element Is Enabled          xpath=//input[@id="Feild4"] 
    Select Checkbox                        xpath=//input[@id="check4"]
    Input Text                             xpath=//input[@id="Feild4"]        Amountupdate
    Select From List By Label              xpath=//select[@id="select4"]            number
    Save Row
    Wait Until Page Contains               Update Success
    Click Element                                ${BTN_OK}
    Sleep               2s
    Input Text                    ${SEARCH_MODELNAME}          AutomatedtestUpdate 
    Sleep           2s
    Click Element                    xpath=//*[@id="tbl_model"]/tbody/tr/td[1]/a
    Sleep           2s
    Capture Page Screenshot                    ${OUTPUTDIR}/Model/TC08/Afterupdate.png
    Click Element                     xpath=//*[@id="copyModel"]
    Wait Until Page Contains               Duplicate Model
    Sleep           1s
    Input Text                  xpath=//*[@id="modelName"]                AutomatedtestDuplicate
    Input Text                             xpath=//input[@id="Feild0"]        DateDuplicate
    Input Text                             xpath=//input[@id="Feild1"]        UserDuplicate
    Input Text                             xpath=//input[@id="Feild2"]        TypeDuplicate
    Input Text                             xpath=//input[@id="Feild3"]        ProductDuplicate
    Input Text                             xpath=//input[@id="Feild4"]        AmountDuplicate
    Save Row
    Wait Until Page Contains                        Create Success
    Click Element                    ${BTN_OK}
    Sleep                        2s
    Input Text                    ${SEARCH_MODELNAME}          Automatedtest
    Sleep                     2s
    Capture Page Screenshot                    ${OUTPUTDIR}/Model/TC08/Search.png
    Sleep                      2s
    Clear Element Text                     ${SEARCH_MODELNAME} 
    Sleep                    1s
    Input Text                    ${SEARCH_MODELNAME}          AutomatedtestDuplicate
    Capture Page Screenshot                    ${OUTPUTDIR}/Model/TC08/Searchdup.png
    Sleep         2s
    Click Element                    xpath=//*[@id="tbl_model"]/tbody/tr/td[1]/a
    Sleep           2s
    Capture Page Screenshot                    ${OUTPUTDIR}/Model/TC08/Detailsdup.png
    Click Element                            ${BTN_MODEL_CANCLE}
    Sleep             2s
    Input Text                     ${SEARCH_MODELNAME}                    test_simple_a
    Sleep         2s
    Click Element                    xpath=//*[@id="tbl_model"]/tbody/tr/td[1]/a
    Sleep           2s
    Capture Page Screenshot                    ${OUTPUTDIR}/Model/TC08/UsemodelBefore.png
    Sleep           2s
    Click Element                 xpath=//*[@id="check0"]
    Click Element                 xpath=//*[@id="check2"]
    Click Element                 xpath=//*[@id="check4"]
    Save Row
    Wait Until Page Contains                        Update Success
    Click Element                      ${BTN_OK}
    Sleep               2s
    Input Text                     ${SEARCH_MODELNAME}                    test_simple_a
    Sleep         2s
    Click Element                    xpath=//*[@id="tbl_model"]/tbody/tr/td[1]/a
    Sleep           2s
    Capture Page Screenshot                    ${OUTPUTDIR}/Model/TC08/UsemodelAfter.png







