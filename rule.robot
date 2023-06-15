*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}               chrome
${URL}                   https://uat-regocile.getinvoice.net/regocile/login.html
${USERNAME}              gamekittisak6@gmail.com
${PASSWORD}              db99bLydfbN
${LOGINBTN}              xpath=//button[@id='login_btn'] 
${USERNAME_LOCATOR}      name=username 
${PASSWORD_LOCATOR}      name=password
${REGOCILE}              xpath=(//span[@class='title'])[1]
${BATCHLIST}             xpath=(//span[@class='title'])[2]
${NEWBATCH}              xpath=(//span[@class='title'])[3]
${TRASH}                 xpath=(//span[@class='title'])[4]
${SETTING}               xpath=(//span[@class='title'])[5]
${MODEL}                 xpath=(//span[@class='title'])[6]
${FILETEMPLATE}          xpath=(//span[@class='title'])[7]
${RULE}                  xpath=(//span[@class='title'])[8]
${ADMIN}                 xpath=(//span[@class='title'])[9]
${PROCESSQUEUE}          xpath=(//span[@class='title'])[10]
${USERMENU}              xpath=(//span[@class='title'])[11]
${COMPANY}               xpath=(//span[@class='title'])[12]
${AUDITLOG}              xpath=(//span[@class='title'])[13]
${CREATECOMPANY}         xpath=//*[@id='createOU']
${SHORTNAME}             xpath=//*[@name='txtShortName'] 
${FULLTH}                xpath=//*[@name="txtFullnameTH"]
${FULLEN}                xpath=//*[@name="txtFullnameEN"]
${ADDRESSTH}             xpath=//*[@name="txtAddressTH"]
${ADDRESSEN}             xpath=//*[@name="txtAddressEN"] 
${TAXID}                 xpath=//*[@id="ou_tax_id"]
${BTN_COMPANY_SAVE}      xpath=//button[@id='saveou']
${BTN_COMPANY_CANCLE}    xpath=//button[@id='btnCancleOu']
${BTN_INVITE}            xpath=//div/a[@id='btnCreateUser']
${INVITE_EMAIL}          xpath=//input[@id='txtEmail']
${INVITE_ADMIN}          xpath=//span[@class='bootstrap-switch-label']
${INVITE_SAVE}           xpath=//button[@id='btnSaveUser']
${INVITE_CANCLE}         xpath=//button[@id='btnCancel']
${EMAIL}                 gamekittisak6@gmail.com
${LIST_COMPANY}          xpath=//select[@id='cboCompany']
${CREATEMODEL}           xpath=//a[@id="create"]
${BTN_RULE_AND}          xpath=//label[@class="btn btn-xs active"]
${BTN_RULE_OR}           xpath=//label[@class="btn btn-xs"]
${BTN_OK}                xpath=/html/body/div[4]/div/div[6]/button[1]
${SEARCH_TRASH}          xpath=//*[@placeholder="Batch Name"]  
${SEARCH_RULE}           xpath=//*[@placeholder="Rule Name"] 



*** Keywords ***

Open Browser and Login Regocile
    Open Browser               ${URL}                                             ${BROWSER}
    ...                        options=add_experimental_option("detach", True)
    Maximize Browser Window
    Input Text                 ${USERNAME_LOCATOR}                                ${USERNAME}
    Input Text                 ${PASSWORD_LOCATOR}                                ${PASSWORD}
    Click Element              ${LOGINBTN}
    Sleep                      3s

Choose Settings
    Click Element    ${SETTING}
    Sleep            3s


Choose Rule
    Click Element    ${RULE}
    Sleep            3s

Select Credit/Debit
    Select From List By Label    xpath=//select[@id="crleft1"]     test_data_number
    Select From List By Label    xpath=//select[@id="crleft2"]     test_data_number
    Select From List By Label    xpath=//select[@id="crright1"]    test_data_number
    Select From List By Label    xpath=//select[@id="crright2"]    test_data_number

Create Rule
    Click Element               xpath=//a[@id="createRule"]
    Wait Until Page Contains    Create Rule

Select Data Model Left
    Select From List By Label    xpath=//select[@id="sl_model_left"]                       test_one
    Sleep                        3s
    Click Element                xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[2]
    Wait Until Page Contains     Credit
    Sleep                        3s


Select Data Model Right
    Select From List By Label    xpath=//select[@id="sl_model_right"]                      test_two
    Sleep                        3s
    Click Element                xpath=//*[@id="check2"]/div[2]/div[2]/div/div/label[2]
    Wait Until Page Contains     Debit

Create Simple Rule
    Click Element                xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                        2s
    Click Element                xpath=//a[@id="type1"]
    Sleep                        2s
    Input Text                   xpath=//input[@id="txt_Rulename1_"]            simple_1
    Select From List By Label    xpath=//select[@id="matchingtype1_"]           Suggest


Select Filter Rule Equal Text
    Select From List By Label    xpath=//*[@id="model1_1_1"]         test_one.test_data_number
    Select From List By Label    xpath=//*[@id="model2_1_1"]         Text                         
    Input Text                   xpath=//input[@id='valtext_1_1']    CR

Select Filter Rule Equal Data Type
    Select From List By Label    xpath=//*[@id="model1_1_1"]    test_one.test_data_number
    Select From List By Label    xpath=//*[@id="model2_1_1"]    test_two.test_data_timestamp    

Add Round Valid
    Select From List By Label    xpath=//select[@id="round_1_"]      ROUND UP
    Input Text                   xpath=//input[@id="roundval_1_"]    10


Add Round Invalid
    Select From List By Label    xpath=//select[@id="round_1_"]                      ROUND UP
    Input Text                   xpath=//input[@id="roundval_1_"]                    -1
    Click Element                xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains     Please enter a value greater than or equal to 0.

Verify Save Rule Success
    Click Element               xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains    Create Success.


Verify Save Rule Name Duplicate
    Click Element               xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains    Rule Set Name is duplicate

Verify Save Rule Fail Not Input
    Click Element               xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains    This field is required.

Verify Save Rule Fail Same Data Model
    Click Element               xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains    Left data model can't be same as right data model.    

Verify Save Rule Fail Add Simple Rule
    Click Element               xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains    Please add at least 1 rules.

Verify Save Rule Fail Text
    Click Element               xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains    Please input require field.


Select Filter Rule Not Equal Text
    Select From List By Label    xpath=//select[@id="express_1_1"]    Not Equal
    Select From List By Label    xpath=//*[@id="model1_1_1"]          test_one.test_data_number
    Select From List By Label    xpath=//*[@id="model2_1_1"]          Text                         
    Input Text                   xpath=//input[@id='valtext_1_1']     CR

Select Filter Rule Not Equal Data Type
    Select From List By Label    xpath=//select[@id="express_1_1"]    Not Equal
    Select From List By Label    xpath=//*[@id="model1_1_1"]          test_one.test_data_number
    Select From List By Label    xpath=//*[@id="model2_1_1"]          test_two.test_data_timestamp

Select Filter Rule Greater Than Text
    Select From List By Label    xpath=//select[@id="express_1_1"]    Greater Than
    Select From List By Label    xpath=//*[@id="model1_1_1"]          test_one.test_data_number
    Select From List By Label    xpath=//*[@id="model2_1_1"]          Text                         
    Input Text                   xpath=//input[@id='valtext_1_1']     CR

Select Filter Rule Greater Than Data Type
    Select From List By Label    xpath=//select[@id="express_1_1"]    Greater Than
    Select From List By Label    xpath=//*[@id="model1_1_1"]          test_one.test_data_number
    Select From List By Label    xpath=//*[@id="model2_1_1"]          test_two.test_data_timestamp


Select Filter Rule Less Than Text
    Select From List By Label    xpath=//select[@id="express_1_1"]    Less Than
    Select From List By Label    xpath=//*[@id="model1_1_1"]          test_one.test_data_number
    Select From List By Label    xpath=//*[@id="model2_1_1"]          Text                         
    Input Text                   xpath=//input[@id='valtext_1_1']     CR

Select Filter Rule Less Than Data Type
    Select From List By Label    xpath=//select[@id="express_1_1"]    Less Than
    Select From List By Label    xpath=//*[@id="model1_1_1"]          test_one.test_data_number
    Select From List By Label    xpath=//*[@id="model2_1_1"]          test_two.test_data_timestamp


Select Filter Rule Start With Text
    Select From List By Label    xpath=//select[@id="express_1_1"]    Start With
    Select From List By Label    xpath=//*[@id="model1_1_1"]          test_one.test_data_number
    Select From List By Label    xpath=//*[@id="model2_1_1"]          Text                         
    Input Text                   xpath=//input[@id='valtext_1_1']     CR


Select Filter Rule End With Text
    Select From List By Label    xpath=//select[@id="express_1_1"]    End With
    Select From List By Label    xpath=//*[@id="model1_1_1"]          test_one.test_data_number
    Select From List By Label    xpath=//*[@id="model2_1_1"]          Text                         
    Input Text                   xpath=//input[@id='valtext_1_1']     CR


Select Filter Rule Not Contain Text
    Select From List By Label    xpath=//select[@id="express_1_1"]    Not Contain
    Select From List By Label    xpath=//*[@id="model1_1_1"]          test_one.test_data_number
    Select From List By Label    xpath=//*[@id="model2_1_1"]          Text                         
    Input Text                   xpath=//input[@id='valtext_1_1']     CR

Select Filter Rule Not Contain Data Type
    Select From List By Label    xpath=//select[@id="express_1_1"]    Not Contain
    Select From List By Label    xpath=//*[@id="model1_1_1"]          test_one.test_data_number
    Select From List By Label    xpath=//*[@id="model2_1_1"]          test_two.test_data_timestamp


Select Filter Rule Contain Text
    Select From List By Label    xpath=//select[@id="express_1_1"]    Contain
    Select From List By Label    xpath=//*[@id="model1_1_1"]          test_one.test_data_number
    Select From List By Label    xpath=//*[@id="model2_1_1"]          Text                         
    Input Text                   xpath=//input[@id='valtext_1_1']     CR

Select Filter Rule Contain Data Type
    Select From List By Label    xpath=//select[@id="express_1_1"]    Contain
    Select From List By Label    xpath=//*[@id="model1_1_1"]          test_one.test_data_number
    Select From List By Label    xpath=//*[@id="model2_1_1"]          test_two.test_data_timestamp



Select Filter Rule Is Null
    Select From List By Label    xpath=//select[@id="express_1_1"]    Is Null
    Select From List By Label    xpath=//*[@id="model1_1_1"]          test_one.test_data_number


Select Filter Rule Not Null
    Select From List By Label    xpath=//select[@id="express_1_1"]    Not Null
    Select From List By Label    xpath=//*[@id="model1_1_1"]          test_one.test_data_number



Choose Reconcile
    Click Element    ${REGOCILE}
    Sleep            3s

Choose New Batch
    Click Element               ${NEWBATCH}
    Wait Until Page Contains    UPLOAD

Choose Trash
    Click Element                ${TRASH}
    Sleep            3s

Choose Model
    Click Element    ${MODEL}
    Sleep            3s

*** Test Cases ***

Delete Trash
    Open Browser and Login Regocile
    Choose Reconcile
    Choose Trash
    Input Text                ${SEARCH_TRASH}                AutomateTC01
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC1.1
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC1.2
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC1.3
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC1.4
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC02
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC2.1
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC2.2
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC2.3
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC2.4
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC03
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC3.1
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC3.2
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC3.3
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC3.4
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC04
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC4.1
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC4.2
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC4.3
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC4.4
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC05
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC5.1
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC5.2
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
        Input Text                ${SEARCH_TRASH}                AutomateTC5.3
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
        Input Text                ${SEARCH_TRASH}                AutomateTC5.4
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC06
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC6.1
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC6.2
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC6.3
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC6.4
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC07
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC7.1
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC7.2
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC7.3
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC7.4
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC08
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC8.1
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC8.2
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC8.3
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC8.4
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC09
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC9.1
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC9.2
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC9.3
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC9.4
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC10
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC10.1
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC10.2
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC10.3
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC10.4
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC11
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC11.1
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC11.2
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC11.3
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC11.4
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC12
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC12.1
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC12.2
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC12.3
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC12.4
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC13
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC13.1
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC13.2
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC13.3
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC13.4
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC14
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC14.1
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC14.2
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC14.3
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s
    Input Text                ${SEARCH_TRASH}                AutomateTC14.4
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_TRASH}    
    Sleep         2s






Delete Rule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Input Text                ${SEARCH_RULE}                Auto-EqualNoRound(And)
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s
    

    Input Text                ${SEARCH_RULE}                Auto-EqualUp2Digits(And)
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s


    Input Text                ${SEARCH_RULE}                Auto-EqualDown2Digits(And)
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s


Input Text                ${SEARCH_RULE}                Auto-EqualNoRound(OR)
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s
    

    Input Text                ${SEARCH_RULE}                Auto-EqualUp2Digits(OR)
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s


    Input Text                ${SEARCH_RULE}                Auto-EqualDown2Digits(OR)
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s





    Input Text                ${SEARCH_RULE}                Auto-EqualAndStartWithNoRound(And)
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s




    Input Text                ${SEARCH_RULE}                Auto-EqualAndStartWithUp2Digits(And)
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s





    Input Text                ${SEARCH_RULE}                Auto-EqualAndStartWithDown2Digits(And)
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s




    Input Text                ${SEARCH_RULE}                Auto-EqualAndStartWithNoRound(OR)
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s




    Input Text                ${SEARCH_RULE}                Auto-EqualAndStartWithUp2Digits(OR)
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s





    Input Text                ${SEARCH_RULE}                Auto-EqualAndStartWithDown2Digits(OR)
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s



    Input Text                ${SEARCH_RULE}                Auto-EqualAndEndWithNoRound(And)
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s



    Input Text                ${SEARCH_RULE}               Auto-EqualAndEndtWithUp2Digits(And)
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s



    Input Text                ${SEARCH_RULE}               Auto-EqualAndEndWithDown2Digits(And)
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s




    Input Text                ${SEARCH_RULE}                Auto-EqualAndEndWithNoRound(OR)
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s



    Input Text                ${SEARCH_RULE}               Auto-EqualAndEndtWithUp2Digits(OR)
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s



    Input Text                ${SEARCH_RULE}               Auto-EqualAndEndWithDown2Digits(OR)
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s




    Input Text                ${SEARCH_RULE}               Auto-EqualAndContainNoRound(And)
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s



    Input Text                ${SEARCH_RULE}               Auto-EqualAndContainUp2Digits(And)
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s



    Input Text                ${SEARCH_RULE}               Auto-EqualAndContainDown2Digits(And)
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s




    Input Text                ${SEARCH_RULE}               Auto-EqualAndContainNoRound(OR)
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s



    Input Text                ${SEARCH_RULE}               Auto-EqualAndContainUp2Digits(OR)
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s



    Input Text                ${SEARCH_RULE}               Auto-EqualAndContainDown2Digits(OR)
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s




    Input Text                ${SEARCH_RULE}               Auto-EqualAndNotContainNoRound(And)
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s





    Input Text                ${SEARCH_RULE}               Auto-EqualAndNotContainUp2Digits(And)
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s

    Input Text                ${SEARCH_RULE}               Auto-EqualAndNotContainDown2Digits(And)
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s






    Input Text                ${SEARCH_RULE}               Auto-EqualAndNotContainNoRound(OR)
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s





    Input Text                ${SEARCH_RULE}               Auto-EqualAndNotContainUp2Digits(OR)
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s

    Input Text                ${SEARCH_RULE}               Auto-EqualAndNotContainDown2Digits(OR)
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s




    Input Text                ${SEARCH_RULE}               Auto-EqualAndIsNullNoRound(And)	
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s




    Input Text                ${SEARCH_RULE}               Auto-EqualAndIsNullUp2Digits(And)
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s




    Input Text                ${SEARCH_RULE}               Auto-EqualAndIsNullDown2Digits(And)
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s




    Input Text                ${SEARCH_RULE}               Auto-EqualAndIsNullNoRound(OR)
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s




    Input Text                ${SEARCH_RULE}               Auto-EqualAndIsNullUp2Digits(OR)
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s




    Input Text                ${SEARCH_RULE}               Auto-EqualAndIsNullDown2Digits(OR)
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s




    Input Text                ${SEARCH_RULE}               Auto-EqualAndNotNullNoRound(And)
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s



    Input Text                ${SEARCH_RULE}               Auto-EqualAndNotNullUp2Digits(And)
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s




    Input Text                ${SEARCH_RULE}              Auto-EqualAndNotNullDown2Digits(And)
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s




    Input Text                ${SEARCH_RULE}               Auto-EqualAndNotNullNoRound(OR)	
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s



    Input Text                ${SEARCH_RULE}               Auto-EqualAndNotNullUp2Digits(OR)	
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s




    Input Text                ${SEARCH_RULE}              Auto-EqualAndNotNullDown2Digits(OR)	
    Click Element                xpath=//i[@class="icon-trash"]
    Wait Until Page Contains                Do you want to delete?
    Sleep            1s
    Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep         2s
    Clear Element Text                    ${SEARCH_RULE}      
    Sleep         2s








TC01-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualNoRound(And)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                       Auto-EqualNoRound(And)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="AND"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                       Auto-EqualNoRound(And)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC01/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC01/Details.png



TC01-Userule
    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC01
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/1RecordA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_1RecordA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/1RecordB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_1RecordB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualNoRound(And)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC01/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC01/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC01/Step5.png

TC01-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC01
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s


TC1.1-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC1.1
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/MRecordA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_MRecordA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/MRecordB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_MRecordB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualNoRound(And)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC1.1/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC1.1/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC1.1/Step5.png



TC1.1-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC1.1
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s




TC1.2-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC1.2
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualNoRound(And)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC1.2/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC1.2/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC1.2/Step5.png


TC1.2-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC1.2
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s





TC1.3-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualUp2Digits(And)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                       Auto-EqualUp2Digits(And)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="AND"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Sleep                              1s
    Select From List By Label          xpath=//*[@id="round_1_"]                                 ROUND UP
    Input Text                         xpath=//*[@id="roundval_1_"]                              2
    Sleep                              1s
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                       Auto-EqualUp2Digits(And)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC1.3/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC1.3/Details.png




TC1.3-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC1.3
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsUpA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsUpA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsUpB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsUpB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualUp2Digits(And)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC1.3/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC1.3/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC1.3/Step5.png




TC1.3-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC1.3
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s




TC1.4-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualDown2Digits(And)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                       Auto-EqualDown2Digits(And)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="AND"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Sleep                              1s
    Select From List By Label          xpath=//*[@id="round_1_"]                                 ROUND DOWN
    Input Text                         xpath=//*[@id="roundval_1_"]                              2
    Sleep                              1s
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                       Auto-EqualDown2Digits(And)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC1.4/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC1.4/Details.png



TC1.4-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC1.4
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsDownA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsDownA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsDownB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsDownB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualDown2Digits(And)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC1.4/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC1.4/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC1.4/Step5.png




TC1.4-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC1.4
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s











TC02-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualNoRound(OR)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                       Auto-EqualNoRound(OR)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="OR"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                       Auto-EqualNoRound(OR)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC02/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC02/Details.png



TC02-Userule
    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC02
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/1RecordA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_1RecordA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/1RecordB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_1RecordB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualNoRound(OR)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC02/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC02/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC02/Step5.png

TC02-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC02
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s




TC2.1-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC2.1
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/MRecordA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_MRecordA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/MRecordB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_MRecordB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualNoRound(OR)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC2.1/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC2.1/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC2.1/Step5.png



TC2.1-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC2.1
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s





TC2.2-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC2.2
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualNoRound(OR)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC2.2/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC2.2/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC2.2/Step5.png


TC2.2-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC2.2
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s





TC2.3-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualUp2Digits(OR)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                       Auto-EqualUp2Digits(OR)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="OR"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Sleep                              1s
    Select From List By Label          xpath=//*[@id="round_1_"]                                 ROUND UP
    Input Text                         xpath=//*[@id="roundval_1_"]                              2
    Sleep                              1s
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                       Auto-EqualUp2Digits(OR)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC2.3/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC2.3/Details.png




TC2.3-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC2.3
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsUpA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsUpA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsUpB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsUpB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualUp2Digits(OR)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC2.3/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC2.3/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC2.3/Step5.png




TC2.3-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC2.3
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s






TC2.4-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualDown2Digits(OR)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                       Auto-EqualDown2Digits(OR)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="OR"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Sleep                              1s
    Select From List By Label          xpath=//*[@id="round_1_"]                                 ROUND DOWN
    Input Text                         xpath=//*[@id="roundval_1_"]                              2
    Sleep                              1s
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                       Auto-EqualDown2Digits(OR)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC2.4/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC2.4/Details.png



TC2.4-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC2.4
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsDownA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsDownA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsDownB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsDownB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualDown2Digits(OR)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC2.4/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC2.4/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC2.4/Step5.png




TC2.4-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC2.4
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s



TC03-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualAndStartWithNoRound(And)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                       Auto-EqualAndStartWithNoRound(And)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="AND"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_2"]                               A_Model.Type_A
    Select From List By Label          xpath=//*[@id="express_1_2"]                              Start With                            
    Input Text                         xpath=//*[@id="valtext_1_2"]                              DR
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_3"]                               B_Model.Type_B
    Select From List By Label          xpath=//*[@id="express_1_3"]                              Start With
    Input Text                         xpath=//*[@id="valtext_1_3"]                              DR
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                       Auto-EqualAndStartWithNoRound(And)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC03/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC03/Details.png




TC03-Userule
    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC03
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/1RecordA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_1RecordA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/1RecordB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_1RecordB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndStartWithNoRound(And)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC03/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC03/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC03/Step5.png


TC03-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC03
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s





TC3.1-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC3.1
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/MRecordA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_MRecordA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/MRecordB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_MRecordB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndStartWithNoRound(And)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC3.1/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC3.1/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC3.1/Step5.png



TC3.1-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC3.1
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s







TC3.2-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC3.2
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndStartWithNoRound(And)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC3.2/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC3.2/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC3.2/Step5.png


TC3.2-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC3.2
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s






TC3.3-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualAndStartWithUp2Digits(And)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                       Auto-EqualAndStartWithUp2Digits(And)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="AND"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_2"]                               A_Model.Type_A
    Select From List By Label          xpath=//*[@id="express_1_2"]                              Start With
    Input Text                         xpath=//*[@id="valtext_1_2"]                              DR
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_3"]                               B_Model.Type_B
    Select From List By Label          xpath=//*[@id="express_1_3"]                              Start With
    Input Text                         xpath=//*[@id="valtext_1_3"]                              DR
    Sleep                              1s
    Select From List By Label          xpath=//*[@id="round_1_"]                                 ROUND UP
    Input Text                         xpath=//*[@id="roundval_1_"]                              2
    Sleep                              1s
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                       Auto-EqualAndStartWithUp2Digits(And)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC3.3/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC3.3/Details.png




TC3.3-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC3.3
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsUpA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsUpA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsUpB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsUpB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndStartWithUp2Digits(And)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC3.3/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC3.3/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC3.3/Step5.png




TC3.3-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC3.3
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s




TC3.4-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualAndStartWithDown2Digits(And)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                       Auto-EqualAndStartWithDown2Digits(And)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="AND"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_2"]                               A_Model.Type_A
    Select From List By Label          xpath=//*[@id="express_1_2"]                              Start With
    Input Text                         xpath=//*[@id="valtext_1_2"]                              DR
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_3"]                               B_Model.Type_B
    Select From List By Label          xpath=//*[@id="express_1_3"]                              Start With
    Input Text                         xpath=//*[@id="valtext_1_3"]                              DR
    Sleep                              1s
    Select From List By Label          xpath=//*[@id="round_1_"]                                 ROUND DOWN
    Input Text                         xpath=//*[@id="roundval_1_"]                              2
    Sleep                              1s
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                       Auto-EqualAndStartWithDown2Digits(And)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC3.4/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC3.4/Details.png




TC3.4-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC3.4
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsDownA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsDownA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsDownB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsDownB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndStartWithDown2Digits(And)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC3.4/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC3.4/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC3.4/Step5.png




TC3.4-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC3.4
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s







TC04-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualAndStartWithNoRound(OR)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                       Auto-EqualAndStartWithNoRound(OR)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="OR"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_2"]                               A_Model.Type_A
    Select From List By Label          xpath=//*[@id="express_1_2"]                              Start With
    Input Text                         xpath=//*[@id="valtext_1_2"]                              DR
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_3"]                               B_Model.Type_B
    Select From List By Label          xpath=//*[@id="express_1_3"]                              Start With
    Input Text                         xpath=//*[@id="valtext_1_3"]                              DR
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                       Auto-EqualAndStartWithNoRound(OR)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC04/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC04/Details.png




TC04-Userule
    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC04
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/1RecordA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_1RecordA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/1RecordB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_1RecordB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndStartWithNoRound(OR)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC04/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC04/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC04/Step5.png


TC04-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC04
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s





TC4.1-Userulec

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC4.1
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/MRecordA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_MRecordA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/MRecordB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_MRecordB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndStartWithNoRound(OR)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC4.1/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC4.1/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC4.1/Step5.png



TC4.1-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC4.1
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s







TC4.2-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC4.2
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndStartWithNoRound(OR)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC4.2/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC4.2/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC4.2/Step5.png


TC4.2-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC4.2
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s






TC4.3-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualAndStartWithUp2Digits(OR)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                       Auto-EqualAndStartWithUp2Digits(OR)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="OR"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_2"]                               A_Model.Type_A
    Select From List By Label          xpath=//*[@id="express_1_2"]                              Start With
    Input Text                         xpath=//*[@id="valtext_1_2"]                              DR
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_3"]                               B_Model.Type_B
    Select From List By Label          xpath=//*[@id="express_1_3"]                              Start With
    Input Text                         xpath=//*[@id="valtext_1_3"]                              DR
    Sleep                              1s
    Select From List By Label          xpath=//*[@id="round_1_"]                                 ROUND UP
    Input Text                         xpath=//*[@id="roundval_1_"]                              2
    Sleep                              1s
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                       Auto-EqualAndStartWithUp2Digits(OR)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC4.3/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC4.3/Details.png




TC4.3-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC4.3
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsUpA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsUpA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsUpB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsUpB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndStartWithUp2Digits(OR)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC4.3/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC4.3/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC4.3/Step5.png




TC4.3-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC4.3
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s




TC4.4-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualAndStartWithDown2Digits(OR)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                       Auto-EqualAndStartWithDown2Digits(OR)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="OR"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_2"]                               A_Model.Type_A
    Select From List By Label          xpath=//*[@id="express_1_2"]                              Start With
    Input Text                         xpath=//*[@id="valtext_1_2"]                              DR
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_3"]                               B_Model.Type_B
    Select From List By Label          xpath=//*[@id="express_1_3"]                              Start With
    Input Text                         xpath=//*[@id="valtext_1_3"]                              DR
    Sleep                              1s
    Select From List By Label          xpath=//*[@id="round_1_"]                                 ROUND DOWN
    Input Text                         xpath=//*[@id="roundval_1_"]                              2
    Sleep                              1s
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                       Auto-EqualAndStartWithDown2Digits(OR)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC4.4/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC4.4/Details.png




TC4.4-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC4.4
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsDownA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsDownA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsDownB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsDownB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndStartWithDown2Digits(OR)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC4.4/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC4.4/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC4.4/Step5.png




TC4.4-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC4.4
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s






TC05-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualAndEndWithNoRound(And)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                       Auto-EqualAndEndWithNoRound(And)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="AND"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_2"]                               A_Model.Product_A
    Select From List By Label          xpath=//*[@id="express_1_2"]                              End With                            
    Input Text                         xpath=//*[@id="valtext_1_2"]                              NE
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_3"]                               B_Model.Product_B
    Select From List By Label          xpath=//*[@id="express_1_3"]                              End With
    Input Text                         xpath=//*[@id="valtext_1_3"]                              NE
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                       Auto-EqualAndEndWithNoRound(And)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC05/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC05/Details.png




TC05-Userule
    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC05
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/1RecordA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_1RecordA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/1RecordB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_1RecordB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndEndWithNoRound(And)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC05/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC05/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC05/Step5.png


TC05-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC05
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s





TC5.1-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC5.1
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/MRecordA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_MRecordA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/MRecordB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_MRecordB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndEndWithNoRound(And)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC5.1/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC5.1/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC5.1/Step5.png



TC5.1-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC5.1
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s







TC5.2-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC5.2
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndEndWithNoRound(And)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC5.2/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC5.2/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC5.2/Step5.png


TC5.2-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC5.2
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s






TC5.3-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualAndEndtWithUp2Digits(And)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                       Auto-EqualAndEndtWithUp2Digits(And)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="AND"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_2"]                               A_Model.Product_A
    Select From List By Label          xpath=//*[@id="express_1_2"]                              End With
    Input Text                         xpath=//*[@id="valtext_1_2"]                              NE
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_3"]                               B_Model.Product_B
    Select From List By Label          xpath=//*[@id="express_1_3"]                              End With
    Input Text                         xpath=//*[@id="valtext_1_3"]                              NE
    Sleep                              1s
    Select From List By Label          xpath=//*[@id="round_1_"]                                 ROUND UP
    Input Text                         xpath=//*[@id="roundval_1_"]                              2
    Sleep                              1s
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                       Auto-EqualAndEndtWithUp2Digits(And)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC5.3/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC5.3/Details.png




TC5.3-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC5.3
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsUpA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsUpA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsUpB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsUpB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndEndtWithUp2Digits(And)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC5.3/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC5.3/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC5.3/Step5.png




TC5.3-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC5.3
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s




TC5.4-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualAndEndWithDown2Digits(And)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                       Auto-EqualAndEndWithDown2Digits(And)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="AND"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_2"]                               A_Model.Product_A
    Select From List By Label          xpath=//*[@id="express_1_2"]                              End With
    Input Text                         xpath=//*[@id="valtext_1_2"]                              NE
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_3"]                               B_Model.Product_B
    Select From List By Label          xpath=//*[@id="express_1_3"]                              End With
    Input Text                         xpath=//*[@id="valtext_1_3"]                              NE
    Sleep                              1s
    Select From List By Label          xpath=//*[@id="round_1_"]                                 ROUND DOWN
    Input Text                         xpath=//*[@id="roundval_1_"]                              2
    Sleep                              1s
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                       Auto-EqualAndEndWithDown2Digits(And)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC5.4/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC5.4/Details.png




TC5.4-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC5.4
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsDownA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsDownA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsDownB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsDownB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndEndWithDown2Digits(And)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC5.4/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC5.4/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC5.4/Step5.png




TC5.4-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC5.4
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s





TC06-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualAndEndWithNoRound(OR)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                       Auto-EqualAndEndWithNoRound(OR)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="OR"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_2"]                               A_Model.Product_A
    Select From List By Label          xpath=//*[@id="express_1_2"]                              End With
    Input Text                         xpath=//*[@id="valtext_1_2"]                              NE
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_3"]                               B_Model.Product_B
    Select From List By Label          xpath=//*[@id="express_1_3"]                              End With
    Input Text                         xpath=//*[@id="valtext_1_3"]                              NE
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                       Auto-EqualAndEndWithNoRound(OR)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC06/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC06/Details.png




TC06-Userule
    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC06
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/1RecordA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_1RecordA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/1RecordB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_1RecordB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndEndWithNoRound(OR)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC06/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC06/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC06/Step5.png


TC06-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC06
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s





TC6.1-Userulec

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC6.1
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/MRecordA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_MRecordA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/MRecordB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_MRecordB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndEndWithNoRound(OR)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC6.1/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC6.1/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC6.1/Step5.png



TC6.1-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC6.1
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s







TC6.2-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC6.2
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndEndWithNoRound(OR)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC6.2/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC6.2/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC6.2/Step5.png


TC6.2-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC6.2
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s






TC6.3-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualAndEndWithUp2Digits(OR)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                       Auto-EqualAndEndWithUp2Digits(OR)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="OR"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_2"]                               A_Model.Product_A
    Select From List By Label          xpath=//*[@id="express_1_2"]                              End With
    Input Text                         xpath=//*[@id="valtext_1_2"]                              NE
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_3"]                               B_Model.Product_B
    Select From List By Label          xpath=//*[@id="express_1_3"]                              End With
    Input Text                         xpath=//*[@id="valtext_1_3"]                              NE
    Sleep                              1s
    Select From List By Label          xpath=//*[@id="round_1_"]                                 ROUND UP
    Input Text                         xpath=//*[@id="roundval_1_"]                              2
    Sleep                              1s
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                       Auto-EqualAndEndWithUp2Digits(OR)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC6.3/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC6.3/Details.png




TC6.3-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC6.3
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsUpA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsUpA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsUpB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsUpB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndEndWithUp2Digits(OR)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC6.3/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC6.3/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC6.3/Step5.png




TC6.3-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC6.3
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s




TC6.4-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualAndEndWithDown2Digits(OR)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                       Auto-EqualAndEndWithDown2Digits(OR)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="OR"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_2"]                               A_Model.Product_A
    Select From List By Label          xpath=//*[@id="express_1_2"]                              End With
    Input Text                         xpath=//*[@id="valtext_1_2"]                              NE
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_3"]                               B_Model.Product_B
    Select From List By Label          xpath=//*[@id="express_1_3"]                              End With
    Input Text                         xpath=//*[@id="valtext_1_3"]                              NE
    Sleep                              1s
    Select From List By Label          xpath=//*[@id="round_1_"]                                 ROUND DOWN
    Input Text                         xpath=//*[@id="roundval_1_"]                              2
    Sleep                              1s
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                       Auto-EqualAndEndWithDown2Digits(OR)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC6.4/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC6.4/Details.png




TC6.4-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC6.4
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsDownA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsDownA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsDownB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsDownB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndEndWithDown2Digits(OR)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC6.4/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC6.4/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC6.4/Step5.png




TC6.4-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC6.4
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s







TC07-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualAndContainNoRound(And)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                       Auto-EqualAndContainNoRound(And)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="AND"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_2"]                               A_Model.Product_A
    Select From List By Label          xpath=//*[@id="express_1_2"]                              Contain                             
    Input Text                         xpath=//*[@id="valtext_1_2"]                              HON
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_3"]                               B_Model.Product_B
    Select From List By Label          xpath=//*[@id="express_1_3"]                              Contain
    Input Text                         xpath=//*[@id="valtext_1_3"]                              HON
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                       Auto-EqualAndContainNoRound(And)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC07/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC07/Details.png




TC07-Userule
    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC07
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/1RecordA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_1RecordA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/1RecordB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_1RecordB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndContainNoRound(And)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC07/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC07/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC07/Step5.png


TC07-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC07
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s





TC7.1-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC7.1
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/MRecordA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_MRecordA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/MRecordB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_MRecordB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndContainNoRound(And)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC7.1/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC7.1/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC7.1/Step5.png



TC7.1-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC7.1
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s







TC7.2-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC7.2
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndContainNoRound(And)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC7.2/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC7.2/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC7.2/Step5.png


TC7.2-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC7.2
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s






TC7.3-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualAndContainUp2Digits(And)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                       Auto-EqualAndContainUp2Digits(And)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="AND"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_2"]                               A_Model.Product_A
    Select From List By Label          xpath=//*[@id="express_1_2"]                              Contain
    Input Text                         xpath=//*[@id="valtext_1_2"]                              HON
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_3"]                               B_Model.Product_B
    Select From List By Label          xpath=//*[@id="express_1_3"]                              Contain
    Input Text                         xpath=//*[@id="valtext_1_3"]                              HON
    Sleep                              1s
    Select From List By Label          xpath=//*[@id="round_1_"]                                 ROUND UP
    Input Text                         xpath=//*[@id="roundval_1_"]                              2
    Sleep                              1s
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                       Auto-EqualAndContainUp2Digits(And)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC7.3/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC7.3/Details.png




TC7.3-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC7.3
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsUpA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsUpA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsUpB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsUpB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndContainUp2Digits(And)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC7.3/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC7.3/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC7.3/Step5.png




TC7.3-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC7.3
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s




TC7.4-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualAndContainDown2Digits(And)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                       Auto-EqualAndContainDown2Digits(And)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="AND"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_2"]                               A_Model.Product_A
    Select From List By Label          xpath=//*[@id="express_1_2"]                              Contain
    Input Text                         xpath=//*[@id="valtext_1_2"]                              HON
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_3"]                               B_Model.Product_B
    Select From List By Label          xpath=//*[@id="express_1_3"]                              Contain
    Input Text                         xpath=//*[@id="valtext_1_3"]                              HON
    Sleep                              1s
    Select From List By Label          xpath=//*[@id="round_1_"]                                 ROUND DOWN
    Input Text                         xpath=//*[@id="roundval_1_"]                              2
    Sleep                              1s
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                       Auto-EqualAndContainDown2Digits(And)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC7.4/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC7.4/Details.png




TC7.4-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC7.4
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsDownA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsDownA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsDownB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsDownB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndContainDown2Digits(And)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC7.4/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC7.4/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC7.4/Step5.png




TC7.4-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC7.4
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s







TC08-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualAndContainNoRound(OR)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                       Auto-EqualAndContainNoRound(OR)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="OR"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_2"]                               A_Model.Product_A
    Select From List By Label          xpath=//*[@id="express_1_2"]                              Contain
    Input Text                         xpath=//*[@id="valtext_1_2"]                              HON
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_3"]                               B_Model.Product_B
    Select From List By Label          xpath=//*[@id="express_1_3"]                              Contain
    Input Text                         xpath=//*[@id="valtext_1_3"]                              HON
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                       Auto-EqualAndContainNoRound(OR)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC08/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC08/Details.png




TC08-Userule
    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC08
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/1RecordA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_1RecordA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/1RecordB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_1RecordB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndContainNoRound(OR)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC08/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC08/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC08/Step5.png


TC08-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC08
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s





TC8.1-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC8.1
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/MRecordA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_MRecordA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/MRecordB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_MRecordB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndContainNoRound(OR)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC8.1/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC8.1/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC8.1/Step5.png



TC8.1-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC8.1
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s







TC8.2-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC8.2
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndContainNoRound(OR)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC8.2/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC8.2/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC8.2/Step5.png


TC8.2-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC8.2
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s






TC8.3-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualAndContainUp2Digits(OR)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                       Auto-EqualAndContainUp2Digits(OR)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="OR"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_2"]                               A_Model.Product_A
    Select From List By Label          xpath=//*[@id="express_1_2"]                              Contain
    Input Text                         xpath=//*[@id="valtext_1_2"]                              HON
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_3"]                               B_Model.Product_B
    Select From List By Label          xpath=//*[@id="express_1_3"]                              Contain
    Input Text                         xpath=//*[@id="valtext_1_3"]                              HON
    Sleep                              1s
    Select From List By Label          xpath=//*[@id="round_1_"]                                 ROUND UP
    Input Text                         xpath=//*[@id="roundval_1_"]                              2
    Sleep                              1s
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                       Auto-EqualAndContainUp2Digits(OR)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC8.3/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC8.3/Details.png




TC8.3-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC8.3
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsUpA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsUpA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsUpB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsUpB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndContainUp2Digits(OR)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC8.3/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC8.3/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC8.3/Step5.png




TC8.3-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC8.3
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s




TC8.4-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualAndContainDown2Digits(OR)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                       Auto-EqualAndContainDown2Digits(OR)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="OR"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_2"]                               A_Model.Product_A
    Select From List By Label          xpath=//*[@id="express_1_2"]                              Contain
    Input Text                         xpath=//*[@id="valtext_1_2"]                              HON
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_3"]                               B_Model.Product_B
    Select From List By Label          xpath=//*[@id="express_1_3"]                              Contain
    Input Text                         xpath=//*[@id="valtext_1_3"]                              HON
    Sleep                              1s
    Select From List By Label          xpath=//*[@id="round_1_"]                                 ROUND DOWN
    Input Text                         xpath=//*[@id="roundval_1_"]                              2
    Sleep                              1s
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                        Auto-EqualAndContainDown2Digits(OR)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC8.4/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC8.4/Details.png




TC8.4-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC8.4
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsDownA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsDownA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsDownB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsDownB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                       Auto-EqualAndContainDown2Digits(OR)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC8.4/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC8.4/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC8.4/Step5.png




TC8.4-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC8.4
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s








TC09-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualAndNotContainNoRound(And)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                       Auto-EqualAndNotContainNoRound(And)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="AND"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_2"]                               A_Model.Product_A
    Select From List By Label          xpath=//*[@id="express_1_2"]                              Not Contain                             
    Input Text                         xpath=//*[@id="valtext_1_2"]                              TABLET
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_3"]                               B_Model.Product_B
    Select From List By Label          xpath=//*[@id="express_1_3"]                              Not Contain
    Input Text                         xpath=//*[@id="valtext_1_3"]                              TABLET
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                      Auto-EqualAndNotContainNoRound(And)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC09/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC09/Details.png




TC09-Userule
    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC09
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/1RecordA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_1RecordA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/1RecordB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_1RecordB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndNotContainNoRound(And)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC09/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC09/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC09/Step5.png


TC09-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC09
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s





TC9.1-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC9.1
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/MRecordA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_MRecordA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/MRecordB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_MRecordB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndNotContainNoRound(And)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC9.1/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC9.1/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC9.1/Step5.png



TC9.1-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC9.1
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s







TC9.2-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC9.2
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndNotContainNoRound(And)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC9.2/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC9.2/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC9.2/Step5.png


TC9.2-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC9.2
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s






TC9.3-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualAndNotContainUp2Digits(And)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                       Auto-EqualAndNotContainUp2Digits(And)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="AND"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_2"]                               A_Model.Product_A
    Select From List By Label          xpath=//*[@id="express_1_2"]                              Not Contain
    Input Text                         xpath=//*[@id="valtext_1_2"]                              TABLET
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_3"]                               B_Model.Product_B
    Select From List By Label          xpath=//*[@id="express_1_3"]                              Not Contain
    Input Text                         xpath=//*[@id="valtext_1_3"]                              TABLET
    Sleep                              1s
    Select From List By Label          xpath=//*[@id="round_1_"]                                 ROUND UP
    Input Text                         xpath=//*[@id="roundval_1_"]                              2
    Sleep                              1s
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                       Auto-EqualAndNotContainUp2Digits(And)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC9.3/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC9.3/Details.png




TC9.3-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC9.3
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsUpA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsUpA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsUpB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsUpB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndNotContainUp2Digits(And)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC9.3/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC9.3/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC9.3/Step5.png




TC9.3-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC9.3
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s




TC9.4-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualAndNotContainDown2Digits(And)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                       Auto-EqualAndNotContainDown2Digits(And)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="AND"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_2"]                               A_Model.Product_A
    Select From List By Label          xpath=//*[@id="express_1_2"]                              Not Contain
    Input Text                         xpath=//*[@id="valtext_1_2"]                              TABLET
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_3"]                               B_Model.Product_B
    Select From List By Label          xpath=//*[@id="express_1_3"]                              Not Contain
    Input Text                         xpath=//*[@id="valtext_1_3"]                              TABLET
    Sleep                              1s
    Select From List By Label          xpath=//*[@id="round_1_"]                                 ROUND DOWN
    Input Text                         xpath=//*[@id="roundval_1_"]                              2
    Sleep                              1s
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                      Auto-EqualAndNotContainDown2Digits(And)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC9.4/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC9.4/Details.png




TC9.4-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC9.4
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsDownA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsDownA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsDownB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsDownB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndNotContainDown2Digits(And)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC9.4/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC9.4/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC9.4/Step5.png




TC9.4-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC9.4
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s






TC10-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualAndNotContainNoRound(OR)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                      Auto-EqualAndNotContainNoRound(OR)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="OR"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_2"]                               A_Model.Product_A
    Select From List By Label          xpath=//*[@id="express_1_2"]                              Not Contain
    Input Text                         xpath=//*[@id="valtext_1_2"]                              TABLET
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_3"]                               B_Model.Product_B
    Select From List By Label          xpath=//*[@id="express_1_3"]                              Not Contain
    Input Text                         xpath=//*[@id="valtext_1_3"]                              TABLET
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                       Auto-EqualAndNotContainNoRound(OR)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC10/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC10/Details.png




TC10-Userule
    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC10
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/1RecordA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_1RecordA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/1RecordB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_1RecordB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndNotContainNoRound(OR)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC10/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC10/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC10/Step5.png


TC10-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC10
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s





TC10.1-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC10.1
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/MRecordA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_MRecordA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/MRecordB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_MRecordB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndNotContainNoRound(OR)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC10.1/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC10.1/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC10.1/Step5.png



TC10.1-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC10.1
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s







TC10.2-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC10.2
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndNotContainNoRound(OR)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC10.2/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC10.2/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC10.2/Step5.png


TC10.2-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC10.2
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s






TC10.3-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualAndNotContainUp2Digits(OR)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                       Auto-EqualAndNotContainUp2Digits(OR)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="OR"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_2"]                               A_Model.Product_A
    Select From List By Label          xpath=//*[@id="express_1_2"]                              Not Contain
    Input Text                         xpath=//*[@id="valtext_1_2"]                              TABLET
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_3"]                               B_Model.Product_B
    Select From List By Label          xpath=//*[@id="express_1_3"]                              Not Contain
    Input Text                         xpath=//*[@id="valtext_1_3"]                              TABLET
    Sleep                              1s
    Select From List By Label          xpath=//*[@id="round_1_"]                                 ROUND UP
    Input Text                         xpath=//*[@id="roundval_1_"]                              2
    Sleep                              1s
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                        Auto-EqualAndNotContainUp2Digits(OR)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC10.3/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC10.3/Details.png




TC10.3-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC10.3
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsUpA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsUpA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsUpB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsUpB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndNotContainUp2Digits(OR)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC10.3/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC10.3/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC10.3/Step5.png




TC10.3-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC10.3
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s




TC10.4-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualAndNotContainDown2Digits(OR)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                       Auto-EqualAndNotContainDown2Digits(OR)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="OR"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_2"]                               A_Model.Product_A
    Select From List By Label          xpath=//*[@id="express_1_2"]                              Not Contain
    Input Text                         xpath=//*[@id="valtext_1_2"]                              TABLET
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_3"]                               B_Model.Product_B
    Select From List By Label          xpath=//*[@id="express_1_3"]                              Not Contain
    Input Text                         xpath=//*[@id="valtext_1_3"]                              TABLET
    Sleep                              1s
    Select From List By Label          xpath=//*[@id="round_1_"]                                 ROUND DOWN
    Input Text                         xpath=//*[@id="roundval_1_"]                              2
    Sleep                              1s
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                        Auto-EqualAndNotContainDown2Digits(OR)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC10.4/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC10.4/Details.png




TC10.4-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC10.4
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsDownA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsDownA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsDownB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsDownB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                       Auto-EqualAndNotContainDown2Digits(OR)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC10.4/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC10.4/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC10.4/Step5.png




TC10.4-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC10.4
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s








TC11-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualAndIsNullNoRound(And)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                       Auto-EqualAndIsNullNoRound(And)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="AND"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_2"]                               A_Model.Product_A
    Select From List By Label          xpath=//*[@id="express_1_2"]                              Is Null                           
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_3"]                               B_Model.Product_B
    Select From List By Label          xpath=//*[@id="express_1_3"]                              Is Null
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                      Auto-EqualAndIsNullNoRound(And)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC11/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC11/Details.png




TC11-Userule
    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC11
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/1RecordA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_1RecordA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/1RecordB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_1RecordB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndIsNullNoRound(And)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC11/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC11/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC11/Step5.png


TC11-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC11
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s





TC11.1-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC11.1
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/MRecordA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_MRecordA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/MRecordB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_MRecordB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndIsNullNoRound(And)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC11.1/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC11.1/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC11.1/Step5.png



TC11.1-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC11.1
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s







TC11.2-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC11.2
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndIsNullNoRound(And)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC11.2/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC11.2/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC11.2/Step5.png


TC11.2-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC11.2
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s






TC11.3-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualAndIsNullUp2Digits(And)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                       Auto-EqualAndIsNullUp2Digits(And)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="AND"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_2"]                               A_Model.Product_A
    Select From List By Label          xpath=//*[@id="express_1_2"]                              Is Null
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_3"]                               B_Model.Product_B
    Select From List By Label          xpath=//*[@id="express_1_3"]                              Is Null
    Sleep                              1s
    Select From List By Label          xpath=//*[@id="round_1_"]                                 ROUND UP
    Input Text                         xpath=//*[@id="roundval_1_"]                              2
    Sleep                              1s
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                       Auto-EqualAndIsNullUp2Digits(And)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC11.3/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC11.3/Details.png




TC11.3-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC11.3
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsUpA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsUpA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsUpB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsUpB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndIsNullUp2Digits(And)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC11.3/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC11.3/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC11.3/Step5.png




TC11.3-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC11.3
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s




TC11.4-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualAndIsNullDown2Digits(And)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                      Auto-EqualAndIsNullDown2Digits(And)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="AND"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_2"]                               A_Model.Product_A
    Select From List By Label          xpath=//*[@id="express_1_2"]                              Is Null
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_3"]                               B_Model.Product_B
    Select From List By Label          xpath=//*[@id="express_1_3"]                              Is Null
    Sleep                              1s
    Select From List By Label          xpath=//*[@id="round_1_"]                                 ROUND DOWN
    Input Text                         xpath=//*[@id="roundval_1_"]                              2
    Sleep                              1s
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                      Auto-EqualAndIsNullDown2Digits(And)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC11.4/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC11.4/Details.png




TC11.4-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC11.4
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsDownA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsDownA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsDownB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsDownB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndIsNullDown2Digits(And)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC11.4/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC11.4/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC11.4/Step5.png




TC11.4-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC11.4
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s






TC12-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualAndIsNullNoRound(OR)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                      Auto-EqualAndIsNullNoRound(OR)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="OR"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_2"]                               A_Model.Product_A
    Select From List By Label          xpath=//*[@id="express_1_2"]                              Is Null
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_3"]                               B_Model.Product_B
    Select From List By Label          xpath=//*[@id="express_1_3"]                              Is Null
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                       Auto-EqualAndIsNullNoRound(OR)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC12/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC12/Details.png




TC12-Userule
    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC12
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/1RecordA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_1RecordA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/1RecordB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_1RecordB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndIsNullNoRound(OR)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC12/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC12/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC12/Step5.png


TC12-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC12
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s





TC12.1-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC12.1
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/MRecordA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_MRecordA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/MRecordB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_MRecordB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndIsNullNoRound(OR)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Sleep                              5s
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC12.1/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC12.1/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC12.1/Step5.png



TC12.1-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC12.1
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s







TC12.2-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC12.2
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndIsNullNoRound(OR)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC12.2/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC12.2/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC12.2/Step5.png


TC12.2-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC12.2
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s






TC12.3-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualAndIsNullUp2Digits(OR)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                       Auto-EqualAndIsNullUp2Digits(OR)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="OR"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_2"]                               A_Model.Product_A
    Select From List By Label          xpath=//*[@id="express_1_2"]                              Is Null
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_3"]                               B_Model.Product_B
    Select From List By Label          xpath=//*[@id="express_1_3"]                              Is Null
    Sleep                              1s
    Select From List By Label          xpath=//*[@id="round_1_"]                                 ROUND UP
    Input Text                         xpath=//*[@id="roundval_1_"]                              2
    Sleep                              1s
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                        Auto-EqualAndIsNullUp2Digits(OR)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC12.3/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC12.3/Details.png




TC12.3-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC12.3
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsUpA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsUpA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsUpB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsUpB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndIsNullUp2Digits(OR)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC12.3/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC12.3/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC12.3/Step5.png




TC12.3-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC12.3
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s




TC12.4-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualAndIsNullDown2Digits(OR)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                       Auto-EqualAndIsNullDown2Digits(OR)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="OR"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_2"]                               A_Model.Product_A
    Select From List By Label          xpath=//*[@id="express_1_2"]                              Is Null
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_3"]                               B_Model.Product_B
    Select From List By Label          xpath=//*[@id="express_1_3"]                              Is Null
    Sleep                              1s
    Select From List By Label          xpath=//*[@id="round_1_"]                                 ROUND DOWN
    Input Text                         xpath=//*[@id="roundval_1_"]                              2
    Sleep                              1s
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                        Auto-EqualAndIsNullDown2Digits(OR)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC12.4/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC12.4/Details.png




TC12.4-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC12.4
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsDownA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsDownA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsDownB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsDownB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                       Auto-EqualAndIsNullDown2Digits(OR)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC12.4/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC12.4/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC12.4/Step5.png




TC12.4-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC12.4
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s










TC13-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualAndNotNullNoRound(And)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                       Auto-EqualAndNotNullNoRound(And)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="AND"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_2"]                               A_Model.Product_A
    Select From List By Label          xpath=//*[@id="express_1_2"]                              Not Null                           
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_3"]                               B_Model.Product_B
    Select From List By Label          xpath=//*[@id="express_1_3"]                              Not Null
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                     Auto-EqualAndNotNullNoRound(And)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC13/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC13/Details.png




TC13-Userule
    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC13
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/1RecordA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_1RecordA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/1RecordB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_1RecordB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndNotNullNoRound(And)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC13/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC13/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC13/Step5.png


TC13-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC13
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s





TC13.1-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC13.1
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/MRecordA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_MRecordA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/MRecordB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_MRecordB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndNotNullNoRound(And)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC13.1/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC13.1/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC13.1/Step5.png



TC13.1-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC13.1
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s







TC13.2-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC13.2
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndNotNullNoRound(And)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC13.2/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC13.2/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC13.2/Step5.png


TC13.2-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC13.2
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s






TC13.3-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualAndNotNullUp2Digits(And)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                       Auto-EqualAndNotNullUp2Digits(And)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="AND"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_2"]                               A_Model.Product_A
    Select From List By Label          xpath=//*[@id="express_1_2"]                              Not Null
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_3"]                               B_Model.Product_B
    Select From List By Label          xpath=//*[@id="express_1_3"]                              Not Null
    Sleep                              1s
    Select From List By Label          xpath=//*[@id="round_1_"]                                 ROUND UP
    Input Text                         xpath=//*[@id="roundval_1_"]                              2
    Sleep                              1s
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                      Auto-EqualAndNotNullUp2Digits(And)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC13.3/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC13.3/Details.png




TC13.3-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC13.3
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsUpA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsUpA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsUpB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsUpB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndNotNullUp2Digits(And)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC11.3/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC13.3/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC13.3/Step5.png




TC13.3-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC13.3
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s




TC13.4-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualAndNotNullDown2Digits(And)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                      Auto-EqualAndNotNullDown2Digits(And)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="AND"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_2"]                               A_Model.Product_A
    Select From List By Label          xpath=//*[@id="express_1_2"]                              Not Null
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_3"]                               B_Model.Product_B
    Select From List By Label          xpath=//*[@id="express_1_3"]                              Not Null
    Sleep                              1s
    Select From List By Label          xpath=//*[@id="round_1_"]                                 ROUND DOWN
    Input Text                         xpath=//*[@id="roundval_1_"]                              2
    Sleep                              1s
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                      Auto-EqualAndNotNullDown2Digits(And)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC13.4/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC13.4/Details.png




TC13.4-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC13.4
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsDownA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsDownA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsDownB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsDownB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                     Auto-EqualAndNotNullDown2Digits(And)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC13.4/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC13.4/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC13.4/Step5.png




TC13.4-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC13.4
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s






TC14-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualAndNotNullNoRound(OR)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                      Auto-EqualAndNotNullNoRound(OR)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="OR"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_2"]                               A_Model.Product_A
    Select From List By Label          xpath=//*[@id="express_1_2"]                              Not Null
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_3"]                               B_Model.Product_B
    Select From List By Label          xpath=//*[@id="express_1_3"]                              Not Null
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                       Auto-EqualAndNotNullNoRound(OR)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC14/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC14/Details.png




TC14-Userule
    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC14
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/1RecordA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_1RecordA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/1RecordB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_1RecordB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndNotNullNoRound(OR)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC12/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC12/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC12/Step5.png


TC14-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC14
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s





TC14.1-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC14.1
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/MRecordA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_MRecordA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/MRecordB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_MRecordB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndNotNullNoRound(OR)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Sleep                              5s
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC12.1/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC14.1/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC14.1/Step5.png



TC14.1-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC14.1
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s







TC14.2-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC14.2
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndNotNullNoRound(OR)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC14.2/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC14.2/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC14.2/Step5.png


TC14.2-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC14.2
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s






TC14.3-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualAndNotNullUp2Digits(OR)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                       Auto-EqualAndNotNullUp2Digits(OR)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="OR"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_2"]                               A_Model.Product_A
    Select From List By Label          xpath=//*[@id="express_1_2"]                              Not Null
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_3"]                               B_Model.Product_B
    Select From List By Label          xpath=//*[@id="express_1_3"]                              Not Null
    Sleep                              1s
    Select From List By Label          xpath=//*[@id="round_1_"]                                 ROUND UP
    Input Text                         xpath=//*[@id="roundval_1_"]                              2
    Sleep                              1s
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                        Auto-EqualAndNotNullUp2Digits(OR)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC14.3/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC14.3/Details.png




TC14.3-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC14.3
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsUpA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsUpA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsUpB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsUpB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                      Auto-EqualAndNotNullUp2Digits(OR)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC14.3/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC14.3/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC14.3/Step5.png




TC14.3-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC14.3
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s




TC14.4-Createrule
    Open Browser and Login Regocile
    Choose Settings
    Choose Rule
    Create Rule
    Input Text                         xpath=//input[@id="Rulesetname"]                          Auto-EqualAndNotNullDown2Digits(OR)
    Select From List By Label          xpath=//select[@id="sl_model_left"]                       A_Model
    Sleep                              2s
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Sleep                              2s
    Select From List By Label          xpath=//select[@id="sl_model_right"]                      B_Model
    Sleep                              2s
    Select From List By Label          xpath=//*[@id="crleft1"]                                  Amount_A
    Select From List By Label          xpath=//*[@id="crright1"]                                 Amount_B
    Click Element                      xpath=//*[@id="check1"]/div[2]/div[2]/div/div/label[1]
    Click Element                      xpath=//button[@id="btnGroupVerticalDrop5"]
    Sleep                              2s
    Click Element                      xpath=//a[@id="type1"]
    Sleep                              2s
    Input Text                         xpath=//input[@id="txt_Rulename1_"]                       Auto-EqualAndNotNullDown2Digits(OR)
    Select From List By Label          xpath=//select[@id="matchingtype1_"]                      Matched
    Click Element                      xpath=//input[@value="OR"]
    Select From List By Label          xpath=//*[@id="model1_1_1"]                               A_Model.Amount_A
    Select From List By Label          xpath=//*[@id="model2_1_1"]                               B_Model.Amount_B
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_2"]                               A_Model.Product_A
    Select From List By Label          xpath=//*[@id="express_1_2"]                              Not Null
    Click Element                      xpath=//*[@id="btn_add_rule1_"]
    Select From List By Label          xpath=//*[@id="model1_1_3"]                               B_Model.Product_B
    Select From List By Label          xpath=//*[@id="express_1_3"]                              Not Null
    Sleep                              1s
    Select From List By Label          xpath=//*[@id="round_1_"]                                 ROUND DOWN
    Input Text                         xpath=//*[@id="roundval_1_"]                              2
    Sleep                              1s
    Click Element                      xpath=//*[@id="btn_saveRule"]
    Wait Until Page Contains           Create Success
    Click Element                      ${BTN_OK}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Rule Name"]                        Auto-EqualAndNotNullDown2Digits(OR)
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC12.4/Success.png
    Sleep                              2s
    Click Element                      xpath=//*[@id="tbl_rule"]/tbody/tr[1]/td[1]/a
    Sleep                              2s
    Mouse Over                         xpath=//*[@id="btn_saveRule"]                             
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC14.4/Details.png




TC14.4-Userule

    Open Browser and Login Regocile
    Choose Reconcile
    Choose New Batch
    Sleep                              2s
    Input Text                         xpath=//*[@id="batchName"]                              AutomateTC14.4
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsDownA.xlsx
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_A
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsDownA.xlsx"]
    Sleep                              2s
    Choose File                        xpath=//input[@type="file"]                             ${CURDIR}/VARIABLES/Data/Equal/DigitsDownB.csv
    Sleep                              5s
    Select From List By Label          xpath=//*[@id="template"]/td[6]/select                  Model_B
    Sleep                              1s
    Click Element                      xpath=//*[@id="template_DigitsDownB.csv"]
    Sleep                              2s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              5s
    Select From List By Label          xpath=//select[@id="cboBatchRule"]                       Auto-EqualAndNotNullDown2Digits(OR)
    Click Element                      xpath=//*[@id="btnClkAddQ"]
    Wait Until Page Contains           Process Success
    Sleep                              2s
    Click Element                      xpath=/html/body/div[4]/div/div[6]/button[1]
    Sleep                              3s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC14.4/Step3.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC14.4/Step4.png
    Sleep                              1s
    Click Element                      xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Sleep                              3s
    Mouse Over                         xpath=//*[@id="smartwizard"]/nav[2]/div[2]/button[2]
    Capture Page Screenshot            ${OUTPUTDIR}/Rule/TC14.4/Step5.png




TC14.4-Delete
    Open Browser and Login Regocile
    Choose Reconcile
    Click Element                      ${BATCHLIST}
    Sleep                              2s
    Input Text                         xpath=//*[@placeholder="Batch Name"]                   AutomateTC14.4
    Click Element                      xpath=//i[@class="icon-trash"]
    Wait Until Page Contains           Do you want to delete?
    Sleep                              1s
    Click Element                      xpath=//button[@class="swal2-confirm swal2-styled"]
    Sleep                              2s


