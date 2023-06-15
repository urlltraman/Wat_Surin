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
${FILE_PATH}                  C:/Users/Game/Desktop/Regocile/05-2566/test1112.xlsx
${BTN_TEMPLETE_SAVE}            xpath=//*[@id="btnSaveTemplate"]
${BTN_TEMPLETE_CANCEL}             xpath=//*[@id="btnCancel"]
${BTN_OK}                            xpath=/html/body/div[4]/div/div[6]/button[1]



*** Test Cases ***

Delete Data
    
    Choose Settings
    Choose Filetemplate 
    Sleep          2s
    Input Text                 xpath=//*[@placeholder="Template Name"]                AutomatedEdit
    Sleep          2s
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s

TC01
    
    Choose Settings
    Choose Filetemplate 
    Capture Page Screenshot                    ${OUTPUTDIR}/Filetemplete/TC01/Filetemplate.png


TC02
    
    Choose Settings
    Choose Filetemplate 
    Select From List By Label                   //*[@id="tbl_model_list_length"]/label/select         10
    Mouse Down                    xpath=//*[@id="tbl_model_list_info"]       
    Capture Page Screenshot                    ${OUTPUTDIR}/Filetemplete/TC02/R10.png
    Sleep         2s
    Select From List By Label                   //*[@id="tbl_model_list_length"]/label/select         25
    Mouse Down                    xpath=//*[@id="tbl_model_list_info"]       
    Capture Page Screenshot                    ${OUTPUTDIR}/Filetemplete/TC02/R25.png
    Sleep         2s
    Select From List By Label                   //*[@id="tbl_model_list_length"]/label/select         50
    Mouse Down                    xpath=//*[@id="tbl_model_list_info"]       
    Capture Page Screenshot                    ${OUTPUTDIR}/Filetemplete/TC02/R50.png
    Sleep         2s
    Select From List By Label                   xpath=//*[@id="tbl_model_list_length"]/label/select         100
    Mouse Down                    xpath=//*[@id="tbl_model_list_info"]       
    Capture Page Screenshot                    ${OUTPUTDIR}/Filetemplete/TC02/R100.png
    Sleep         2s



TC03
    
    Choose Settings
    Choose Filetemplate 
    Select From List By Label                   //*[@id="tbl_model_list_length"]/label/select         100
    Mouse Down                    xpath=//*[@id="tbl_model_list_paginate"]/ul/li[4]/a      
    Capture Page Screenshot                    ${OUTPUTDIR}/Filetemplete/TC03/R100Before.png
    Sleep         2s
    Click Element                     //*[@id="tbl_model_list_paginate"]/ul/li[6]/a
    Mouse Down                    xpath=//*[@id="tbl_model_list_paginate"]/ul/li[4]/a   
    Capture Page Screenshot                    ${OUTPUTDIR}/Filetemplete/TC03/R100After.png
    Sleep         2s
    Select From List By Label                   //*[@id="tbl_model_list_length"]/label/select         50
    Mouse Down                    xpath=//*[@id="tbl_model_list_paginate"]/ul/li[2]/a      
    Capture Page Screenshot                    ${OUTPUTDIR}/Filetemplete/TC03/R50Before.png
    Sleep         2s
    Click Element                     //*[@id="tbl_model_list_paginate"]/ul/li[2]/a
    Mouse Down                    xpath=//*[@id="tbl_model_list_paginate"]/ul/li[2]/a   
    Capture Page Screenshot                    ${OUTPUTDIR}/Filetemplete/TC03/R50After.png
    Sleep         2s
    Select From List By Label                   //*[@id="tbl_model_list_length"]/label/select         25
    Mouse Down                    xpath=//*[@id="tbl_model_list_paginate"]/ul/li[2]/a      
    Capture Page Screenshot                    ${OUTPUTDIR}/Filetemplete/TC03/R25Before.png
    Sleep         2s
    Click Element                     //*[@id="tbl_model_list_paginate"]/ul/li[8]/a
    Mouse Down                    xpath=//*[@id="tbl_model_list_paginate"]/ul/li[2]/a   
    Capture Page Screenshot                    ${OUTPUTDIR}/Filetemplete/TC03/R25After.png
    Sleep         2s
    Select From List By Label                   //*[@id="tbl_model_list_length"]/label/select         10
    Mouse Down                    xpath=//*[@id="tbl_model_list_paginate"]/ul/li[2]/a      
    Capture Page Screenshot                    ${OUTPUTDIR}/Filetemplete/TC03/R10Before.png
    Sleep         2s
    Click Element                     //*[@id="tbl_model_list_paginate"]/ul/li[1]/a
    Mouse Down                    xpath=//*[@id="tbl_model_list_paginate"]/ul/li[2]/a   
    Capture Page Screenshot                    ${OUTPUTDIR}/Filetemplete/TC03/R10After.png
    Sleep         2s



TC04
    
    Choose Settings
    Choose Filetemplate 
    Input Text             xpath=//*[@placeholder="Template Name"]                equal
    Capture Page Screenshot                    ${OUTPUTDIR}/Filetemplete/TC04/Templetename.png
    Sleep          1s
    Clear Element Text        xpath=//*[@placeholder="Template Name"]   
    Sleep          1s
    Input Text             xpath=//*[@placeholder="Model Name"]                Model
    Capture Page Screenshot                    ${OUTPUTDIR}/Filetemplete/TC04/Modelname.png
    Sleep          1s
    Clear Element Text        xpath=//*[@placeholder="Model Name"]   
    Sleep          1s
    Input Text             xpath=//*[@placeholder="Create By"]                gamekittisak6
    Capture Page Screenshot                    ${OUTPUTDIR}/Filetemplete/TC04/Createby.png
    Sleep          1s
    Clear Element Text        xpath=//*[@placeholder="Create By"]   
    Sleep          1s
    Input Text             xpath=//*[@placeholder="Create Date"]                2022
    Capture Page Screenshot                    ${OUTPUTDIR}/Filetemplete/TC04/Createdate.png
    Sleep          1s
    Clear Element Text        xpath=//*[@placeholder="Create Date"]   
    Sleep          1s
    Input Text             xpath=//*[@placeholder="Update By"]                gamekittisak6
    Capture Page Screenshot                    ${OUTPUTDIR}/Filetemplete/TC04/Updateby.png
    Sleep          1s
    Clear Element Text        xpath=//*[@placeholder="Update By"]   
    Sleep          1s
    Input Text             xpath=//*[@placeholder="Update Date"]                2023
    Capture Page Screenshot                    ${OUTPUTDIR}/Filetemplete/TC04/Updatedate.png
    Sleep          1s
    Clear Element Text        xpath=//*[@placeholder="Update Date"]   
    Sleep          1s
    Input Text             xpath=//*[@placeholder="Active/InActive"]                Active
    Capture Page Screenshot                    ${OUTPUTDIR}/Filetemplete/TC04/Active.png
    Sleep          1s
    Clear Element Text        xpath=//*[@placeholder="Active/InActive"]   
    Sleep          1s
    Input Text             xpath=//*[@placeholder="Active/InActive"]                InActive
    Capture Page Screenshot                    ${OUTPUTDIR}/Filetemplete/TC04/InActive.png
    Sleep          1s
    Clear Element Text        xpath=//*[@placeholder="Active/InActive"]   
    Sleep          1s


TC 05
    
    Choose Settings
    Choose Filetemplate 
    Click Element                    xpath=//*[@id="create"]
    Sleep                             3s
    Choose File                        xpath=//input[@id="file"]                  ${CURDIR}/VARIABLES/Data/Equal/MRecordA.xlsx
    Select From List By Label                 xpath=//select[@id="cboModel"]                            AutomatedtestUpdate
    Input Text                xpath=//input[@id="txtTemplateName"]                  AutomatedTemplete
    Input Text    xpath=//input[@name="model1"]    2 
    Sleep            2s
    Input Text    xpath=//input[@name="model1"]    1
    Sleep            1s
    Click Element                    xpath=//*[@for="rdbInActive"]
    Sleep          1s
    Click Element                    xpath=//*[@for="rdbActive"]
    Sleep          1s
    Click Element                     xpath=//*[@id="tbl_template_col"]/tbody/tr[1]/td[1]/label/span
    Select From List By Label            xpath=//select[@id="cboFieldName_0"]                Dateupdate
    Select From List By Label            xpath=//select[@id="cboformat_0"]                    DD/MM/YYYY
    Sleep          1s
    Click Element                     xpath=//*[@id="tbl_template_col"]/tbody/tr[2]/td[1]/label/span
    Select From List By Label            xpath=//select[@id="cboFieldName_1"]                Userupdate
    Sleep          1s
    Click Element                     xpath=//*[@id="tbl_template_col"]/tbody/tr[3]/td[1]/label/span
    Select From List By Label            xpath=//select[@id="cboFieldName_2"]                Typeupdate
    Sleep          1s
    Click Element                     xpath=//*[@id="tbl_template_col"]/tbody/tr[4]/td[1]/label/span
    Select From List By Label            xpath=//select[@id="cboFieldName_3"]                Productupdate
    Sleep          1s
    Click Element                     xpath=//*[@id="tbl_template_col"]/tbody/tr[5]/td[1]/label/span
    Select From List By Label            xpath=//select[@id="cboFieldName_4"]                Amountupdate
    Click Element                    ${BTN_TEMPLETE_SAVE}
    Wait Until Page Contains                        Create Success
    Click Element                    ${BTN_OK}
    Sleep              2s
    Input Text                 xpath=//*[@placeholder="Template Name"]                AutomatedTemplete
    Capture Page Screenshot                    ${OUTPUTDIR}/Filetemplete/TC05/Success.png
    Sleep              2s
    Click Element             //*[@id="tbl_model_list"]/tbody/tr[1]/td[1]/a
    Sleep              2s
    Capture Page Screenshot                    ${OUTPUTDIR}/Filetemplete/TC05/Details.png



TC06
    
    Choose Settings
    Choose Filetemplate 
    Sleep              2s
    Input Text                 xpath=//*[@placeholder="Template Name"]                AutomatedTemplete
    Sleep              1s
    Click Element             xpath=//*[@id="tbl_model_list"]/tbody/tr[1]/td[1]/a
    Sleep              2s
    Select From List By Label                 xpath=//select[@id="cboModel"]                            AutomatedtestDuplicate
    Input Text                xpath=//input[@id="txtTemplateName"]                  AutomatedEdit
    Select From List By Label            xpath=//select[@id="cboFieldName_0"]                DateDuplicate
    Select From List By Label            xpath=//select[@id="cboformat_0"]                    DD/MM/YYYY
    Sleep          1s
    Select From List By Label            xpath=//select[@id="cboFieldName_1"]                UserDuplicate
    Sleep          1s
    Click Element                     xpath=//*[@id="tbl_template_col"]/tbody/tr[3]/td[1]/label/span
    #Select From List By Label            xpath=//select[@id="cboFieldName_2"]                TypeDuplicate
    Sleep          1s
    Click Element                     xpath=//*[@id="tbl_template_col"]/tbody/tr[4]/td[1]/label/span
    #Select From List By Label            xpath=//select[@id="cboFieldName_3"]                ProductDuplicate
    Sleep          1s
    Select From List By Label            xpath=//select[@id="cboFieldName_4"]                AmountDuplicate
    Click Element                    ${BTN_TEMPLETE_SAVE}
    Wait Until Page Contains                        Update Success
    Click Element                    ${BTN_OK}
    Sleep          2s
    Input Text                 xpath=//*[@placeholder="Template Name"]                AutomatedEdit
    Capture Page Screenshot                    ${OUTPUTDIR}/Filetemplete/TC06/Success.png
    Sleep              2s
    Click Element             xpath=//*[@id="tbl_model_list"]/tbody/tr[1]/td[1]/a
    Sleep              2s
    Capture Page Screenshot                    ${OUTPUTDIR}/Filetemplete/TC06/Details.png





TC07
    
    Choose Settings
    Choose Filetemplate 
    Sleep              2s
    Input Text                 xpath=//*[@placeholder="Template Name"]                AutomatedEdit
    Sleep              1s
    Click Element             xpath=//*[@id="tbl_model_list"]/tbody/tr[1]/td[1]/a
    Sleep              2s
    Click Element                  xpath=//*[@for="rdbInActive"]
    Click Element                    ${BTN_TEMPLETE_SAVE}
    Wait Until Page Contains                        Update Success
    Click Element                    ${BTN_OK}
    Sleep          2s
    Input Text                 xpath=//*[@placeholder="Template Name"]                AutomatedEdit
    Capture Page Screenshot                    ${OUTPUTDIR}/Filetemplete/TC07/Success.png
    Sleep              2s
    Click Element             xpath=//*[@id="tbl_model_list"]/tbody/tr[1]/td[1]/a
    Sleep              2s
    Capture Page Screenshot                    ${OUTPUTDIR}/Filetemplete/TC07/Details.png
