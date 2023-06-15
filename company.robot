*** Settings ***
Library  SeleniumLibrary
Resource         ${CURDIR}/Resource/ResourceRule.robot
Test Setup    Open Browser and Login Regocile
Test Teardown    Close Browser
*** Variables ***
${BROWSER}                   chrome
${URL}                       https://uat-regocile.getinvoice.net/regocile/login.html
${USERNAME}                  nattapon.s@ginkgosoft.co.th  
${PASSWORD}                  db'Fdt:va9N
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
${SEARCH_SHORTNAME}          xpath=//input[@placeholder="SHORT NAME"] 
${SEARCH_FULLNAMETH}          xpath=//input[@placeholder="FULL NAME TH"] 
${SEARCH_FULLNAMEEN}          xpath=//input[@placeholder="FULL NAME EN"] 
${SEARCH_BRANCHTH}          xpath=//input[@placeholder="BRANCH TH"] 
${SEARCH_BRANCHEN}          xpath=//input[@placeholder="BRANCH EN"] 
${SEARCH_ADDRESSTH}          xpath=//input[@placeholder="ADDRESS TH"] 
${SEARCH_ADDRESSEN}          xpath=//input[@placeholder="ADDRESS EN"] 
${SEARCH_TAXID}          xpath=//input[@placeholder="TAX ID"] 
${BTN_RE_Company}                    xpath=//a[@id="refresh_ou"]
${FT_SHORTNAME}                         xpath=//*[@id="tbl_ou"]/thead[1]/tr/th[1]
${FT_FULLNAMETH}                         xpath=//*[@id="tbl_ou"]/thead[1]/tr/th[2]
${FT_FULLNAMEEN}                         xpath=//*[@id="tbl_ou"]/thead[1]/tr/th[3]
${FT_BRANCHTH}                         xpath=//*[@id="tbl_ou"]/thead[1]/tr/th[4]
${FT_BRANCHEN}                         xpath=//*[@id="tbl_ou"]/thead[1]/tr/th[5]
${FT_ADDRESSTH}                         xpath=//*[@id="tbl_ou"]/thead[1]/tr/th[6]
${FT_ADDRESSEN}                         xpath=//*[@id="tbl_ou"]/thead[1]/tr/th[7]
${FT_TAXID}                         xpath=//*[@id="tbl_ou"]/thead[1]/tr/th[8]


*** Test Cases ***
Delete Data
     Click Element    ${ADMIN}
     Sleep         2s
     Click Element    ${COMPANY}
     Sleep         2s
     Input Text                 ${SEARCH_SHORTNAME}                        ZXCV
     Sleep         1s
     Click Element                xpath=//i[@class="icon-trash"]
     Wait Until Page Contains                Do you want to delete?
     Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
     Sleep         2s
     Click Element                ${BTN_RE_Company}
     Sleep         3s
     Input Text                 ${SEARCH_FULLNAMETH}                        ออโตเทส
     Click Element                xpath=//i[@class="icon-trash"]
     Wait Until Page Contains                Do you want to delete?
     Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
     


TS01-TC01-STEP1
     Click Element    ${ADMIN}
     Sleep         2s
     Click Element    ${COMPANY}
     Sleep         2s
     Click Element    ${CREATECOMPANY}
     Sleep         2s
     Input Text      ${SHORTNAME}     ZXCV
     Input Text      ${FULLTH}     เซ็ดแอกซ์ซีวี
     Input Text      ${FULLEN}     zxcv Limited
     Input Text      ${ADDRESSTH}  1234 ม.1
     Input Text      ${ADDRESSEN}  1234 m.1
     Input Text      ${TAXID}      65465741
     Click Element   ${BTN_COMPANY_SAVE}
     Wait Until Page Contains                     Create success
     Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
     Sleep             1s
     Input Text                     ${SEARCH_SHORTNAME}      ZXCV
     Sleep            2s
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC01/STEP1.png
     Sleep            1s
     Click Element                xpath=//*[@id="tbl_ou"]/tbody/tr/td[1]/a
     Sleep            2s
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC01/STEP1-Details.png

TS01-TC01-STEP2
     Click Element    ${ADMIN}
     Sleep         2s
     Click Element    ${COMPANY}
     Sleep         2s
     Click Element    ${CREATECOMPANY}
     Sleep         2s
     Input Text      ${FULLTH}     ออโตเทส
     Input Text      ${TAXID}      9874321
     Click Element   ${BTN_COMPANY_SAVE}
     Wait Until Page Contains                     Create success
     Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
     Sleep             1s
     Input Text                     ${SEARCH_FULLNAMETH}       ออโตเทส
     Sleep            2s
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC01/STEP2.png
     Sleep            1s
     Click Element                xpath=//*[@id="tbl_ou"]/tbody/tr/td[2]/a
     Sleep            2s
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC01/STEP2-Details.png


TS01-TC01-STEP3.1
     Click Element    ${ADMIN}
     Sleep         2s
     Click Element    ${COMPANY}
     Sleep         2s
     Click Element    ${CREATECOMPANY}
     Sleep         2s
     Input Text      ${SHORTNAME}     ZXCV
     Input Text      ${FULLTH}     เซ็ดแอกซ์ซีวี
     Input Text      ${FULLEN}     zxcv Limited123
     Input Text      ${ADDRESSTH}  1234 ม.1
     Input Text      ${ADDRESSEN}  1234 m.1
     Input Text      ${TAXID}      654657411
     Click Element   ${BTN_COMPANY_SAVE}
     Wait Until Page Contains                     Fullname thai is exist.
     Sleep               3s
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC01/STEP3.1.png
     Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
     Sleep             1s
     

TS01-TC01-STEP3.2
     Sleep         10s
     Click Element    ${ADMIN}
     Sleep         2s
     Click Element    ${COMPANY}
     Sleep         2s
     Click Element    ${CREATECOMPANY}
     Sleep         2s
     Input Text      ${SHORTNAME}     ZXCV
     Input Text      ${FULLTH}     เซ็ดแอกซ์ซีวี11
     Input Text      ${FULLEN}     zxcv Limited
     Input Text      ${ADDRESSTH}  1234 ม.1
     Input Text      ${ADDRESSEN}  1234 m.1
     Input Text      ${TAXID}      654657411
     Click Element   ${BTN_COMPANY_SAVE}
     Wait Until Page Contains                     Fullname english is exist.
     Sleep               3s
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC01/STEP3.2.png
     Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
     Sleep             1s
     


TS01-TC01-STEP3.3
     Click Element    ${ADMIN}
     Sleep         2s
     Click Element    ${COMPANY}
     Sleep         2s
     Click Element    ${CREATECOMPANY}
     Sleep         2s
     Input Text      ${SHORTNAME}     ZXCV
     Input Text      ${FULLTH}     เซ็ดแอกซ์ซีวี11
     Input Text      ${FULLEN}     zxcv Limited12
     Input Text      ${ADDRESSTH}  1234 ม.1
     Input Text      ${ADDRESSEN}  1234 m.1
     Input Text      ${TAXID}      65465741
     Click Element   ${BTN_COMPANY_SAVE}
     Wait Until Page Contains                     TaxId is exist.
     Sleep               3s
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC01/STEP3.3.png
     Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
     Sleep             1s
     


TS01-TC01-STEP3.4
     Click Element    ${ADMIN}
     Sleep         2s
     Click Element    ${COMPANY}
     Sleep         2s
     Click Element    ${CREATECOMPANY}
     Sleep         2s
     Click Element   ${BTN_COMPANY_CANCLE}
     Sleep               3s
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC01/STEP3.4.png
     




TS01-TC01-STEP3.5

     Click Element    ${ADMIN}
     Sleep         2s
     Click Element    ${COMPANY}
     Sleep         2s
     Click Element    ${CREATECOMPANY}
     Sleep         2s
     Click Element   ${BTN_COMPANY_SAVE}
     Sleep               3s
     Page Should Contain                    This field is required.
     Sleep             2s
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC01/STEP3.5.png
     


TS01-TC01-STEP3.6

     Click Element    ${ADMIN}
     Sleep         2s
     Click Element    ${COMPANY}
     Sleep         2s
     Click Element    ${CREATECOMPANY}
     Sleep         2s
     Input Text      ${FULLTH}     ทดสอบออโต
     Click Element   ${BTN_COMPANY_SAVE}
     Sleep               3s
     Page Should Contain                    This field is required.
     Sleep             2s
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC01/STEP3.6.png
     




TS01-TC01-STEP3.7

     Click Element    ${ADMIN}
     Sleep         2s
     Click Element    ${COMPANY}
     Sleep         2s
     Click Element    ${CREATECOMPANY}
     Sleep         2s
     Input Text      ${TAXID}     111111
     Click Element   ${BTN_COMPANY_SAVE}
     Sleep               3s
     Page Should Contain                    This field is required.
     Sleep             2s
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC01/STEP3.7.png


TS01-TC01-STEP3.8

     Click Element    ${ADMIN}
     Sleep         2s
     Click Element    ${COMPANY}
     Sleep         2s
     Click Element    ${CREATECOMPANY}
     Sleep         2s
     Input Text      ${SHORTNAME}     Lorem ipsum dolor sit amet, consectetuer adipiscing
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC01/STEP3.8-SN50.png
     Sleep         1s
     Clear Element Text     ${SHORTNAME} 
     Sleep         1s
     Input Text      ${FULLTH}     Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis,.
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC01/STEP3.8-FNTH255.png
     Sleep         1s
     Clear Element Text     ${FULLTH}

     Sleep         1s
     Input Text      ${FULLEN}     Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis,.
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC01/STEP3.8-FNEN255.png
     Sleep         1s
     Clear Element Text     ${FULLEN}

     
     Sleep         1s
     Input Text      ${ADDRESSTH}     Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC01/STEP3.8-ATH500.png
     Sleep         1s
     Clear Element Text     ${ADDRESSTH}  
     

     Sleep         1s
     Input Text      ${ADDRESSEN}     Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC01/STEP3.8-AEN500.png
     Sleep         1s
     Clear Element Text      ${ADDRESSEN}  
     

     Sleep         1s
     Input Text      ${TAXID}     0123456789012345678901
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC01/STEP3.8-TAX20.png
     Sleep         1s
     Clear Element Text      ${TAXID}








TS01-TC02

     Click Element    ${ADMIN}
     Sleep         2s
     Click Element    ${COMPANY}
     Sleep          2s
     Input Text                 ${SEARCH_SHORTNAME}                 ZXCV
     Sleep           2s
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC02/Shortname.png
     Clear Element Text            ${SEARCH_SHORTNAME}  
     Input Text                 ${SEARCH_FULLNAMETH}                 เซ็ดแอกซ์ซีวี
     Sleep           2s
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC02/Fullnameth.png
     Clear Element Text            ${SEARCH_FULLNAMETH}
     Input Text                 ${SEARCH_FULLNAMEEN}                 zxcv Limited
     Sleep           2s
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC02/Fullnameen.png
     Clear Element Text            ${SEARCH_FULLNAMEEN}
     Input Text                 ${SEARCH_ADDRESSTH}                 1234 ม.1
     Sleep           2s
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC02/Addressth.png
     Clear Element Text            ${SEARCH_ADDRESSTH}
     Input Text                 ${SEARCH_ADDRESSEN}                 1234 m.1
     Sleep           2s
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC02/Addressen.png
     Clear Element Text            ${SEARCH_ADDRESSEN}
     Input Text                 ${SEARCH_TAXID}                 1
     Sleep           2s
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC02/Taxid.png
     Clear Element Text            ${SEARCH_TAXID}



TS01-TC03

     Click Element    ${ADMIN}
     Sleep         2s
     Click Element    ${COMPANY}    
     Sleep         2s
     Select From List By Label                        xpath=//*[@id="tbl_ou_length"]/label/select         10
     Mouse Down                    xpath=//*[@id="tbl_ou_info"]            
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC03/R10.png
     Sleep         2s
     Select From List By Label                        xpath=//*[@id="tbl_ou_length"]/label/select         25
     Mouse Down                    xpath=//*[@id="tbl_ou_info"]            
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC03/R25.png
     Sleep         2s
     Select From List By Label                        xpath=//*[@id="tbl_ou_length"]/label/select         50
     Mouse Down                    xpath=//*[@id="tbl_ou_info"]            
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC03/R50.png
     Sleep         2s
     Select From List By Label                        xpath=//*[@id="tbl_ou_length"]/label/select         100
     Mouse Down                    xpath=//*[@id="tbl_ou_info"]            
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC03/R100.png


TS01-TC04

     Sleep         10s
     Click Element    ${ADMIN}
     Sleep         2s
     Click Element    ${COMPANY}    
     Sleep         2s
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC04/Sn-Greater.png
     Sleep         1s
     Click Element     ${FT_SHORTNAME}
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC04/Sn-Less.png
     Sleep         1s
     Click Element     ${FT_FULLNAMETH}
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC04/FNTH-Greater.png
     Sleep         1s
     Click Element     ${FT_FULLNAMETH}
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC04/FNTH-Less.png
     Sleep         1s
     Click Element     ${FT_FULLNAMEEN}
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC04/FNEN-Greater.png
     Sleep         1s
     Click Element     ${FT_FULLNAMEEN}
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC04/FNEN-Less.png
     Sleep         1s
     Click Element     ${FT_BRANCHTH}
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC04/BTH-Greater.png
     Sleep         1s
     Click Element     ${FT_BRANCHTH}
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC04/BTH-Less.png
     Sleep         1s
     Click Element     ${FT_BRANCHEN}
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC04/BEN-Greater.png
     Sleep         1s
     Click Element        ${FT_BRANCHEN}
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC04/BEN-Less.png
     Sleep         1s
     Click Element         ${FT_ADDRESSTH}
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC04/ATH-Greater.png
     Sleep         1s
     Click Element     ${FT_ADDRESSTH}
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC04/ATH-Less.png
     Sleep         1s
     Click Element         ${FT_TAXID}
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC04/TAX-Greater.png
     Sleep         1s
     Click Element         ${FT_TAXID}
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC04/TAX-Less.png
     Sleep         1s




TS01-TC05
     Click Element    ${ADMIN}
     Sleep         2s
     Click Element    ${COMPANY}
     Sleep          2s
     Select From List By Label                        xpath=//*[@id="tbl_ou_length"]/label/select         25
     Sleep          1s
     Input Text                 ${SEARCH_SHORTNAME}                 ZXCV
     Sleep           2s
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC05/SN-Greater-Before.png
     Click Element                 ${BTN_RE_Company}        
     Sleep           1s    
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC05/SN-Greater-After.png
     Select From List By Label                        xpath=//*[@id="tbl_ou_length"]/label/select         25
     Click Element               ${FT_SHORTNAME}       
     Sleep            1s
     Input Text                 ${SEARCH_SHORTNAME}                 ZXCV
     Sleep           2s
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC05/SN-Less-Before.png
     Click Element                 ${BTN_RE_Company}        
     Sleep           1s    
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC05/SN-Less-After.png


     Select From List By Label                        xpath=//*[@id="tbl_ou_length"]/label/select         25
     Click Element                     ${FT_FULLNAMETH}
     Input Text                 ${SEARCH_FULLNAMETH}                เซ็ดแอกซ์ซีวี
     Sleep           2s
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC05/FNTH-Greater-Before.png
     Click Element                 ${BTN_RE_Company}        
     Sleep           1s    
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC05/FNTH-Greater-After.png
     Select From List By Label                        xpath=//*[@id="tbl_ou_length"]/label/select         25
     Double Click Element               ${FT_FULLNAMETH}       
     Sleep            1s
     Input Text                 ${SEARCH_FULLNAMETH}                 เซ็ดแอกซ์ซีวี
     Sleep           2s
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC05/FNTH-Less-Before.png
     Click Element                 ${BTN_RE_Company}        
     Sleep           1s    
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC05/FNTH-Less-After.png



     Select From List By Label                        xpath=//*[@id="tbl_ou_length"]/label/select         25
     Click Element                     ${FT_FULLNAMEEN}
     Input Text                 ${SEARCH_FULLNAMEEN}                zxcv Limited
     Sleep           2s
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC05/FNEN-Greater-Before.png
     Click Element                 ${BTN_RE_Company}        
     Sleep           1s    
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC05/FNEN-Greater-After.png
     Select From List By Label                        xpath=//*[@id="tbl_ou_length"]/label/select         25
     Double Click Element                ${FT_FULLNAMEEN}    
     Sleep            1s
     Input Text                  ${SEARCH_FULLNAMEEN}                  zxcv Limited
     Sleep           2s
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC05/FNEN-Less-Before.png
     Click Element                 ${BTN_RE_Company}        
     Sleep           1s    
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC05/FNEN-Less-After.png



     Select From List By Label                        xpath=//*[@id="tbl_ou_length"]/label/select         50
     Click Element                     ${FT_BRANCHTH}
     Input Text                 ${SEARCH_BRANCHTH}                พีกี้ ไบลน์เดอร์ส
     Sleep           2s
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC05/BTH-Greater-Before.png
     Click Element                 ${BTN_RE_Company}        
     Sleep           1s    
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC05/BTH-Greater-After.png
     Select From List By Label                        xpath=//*[@id="tbl_ou_length"]/label/select         50
     Double Click Element                ${FT_BRANCHTH}  
     Sleep            1s
     Input Text                  ${SEARCH_BRANCHTH}                  พีกี้ ไบลน์เดอร์ส
     Sleep           2s
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC05/BTH-Less-Before.png
     Click Element                 ${BTN_RE_Company}        
     Sleep           1s    
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC05/BTH-Less-After.png





     Select From List By Label                        xpath=//*[@id="tbl_ou_length"]/label/select         50
     Click Element                     ${FT_BRANCHEN}
     Input Text                 ${SEARCH_BRANCHEN}              Peaky Blinders
     Sleep           2s
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC05/BEN-Greater-Before.png
     Click Element                 ${BTN_RE_Company}        
     Sleep           1s    
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC05/BEN-Greater-After.png
     Select From List By Label                        xpath=//*[@id="tbl_ou_length"]/label/select         50
     Double Click Element              ${FT_BRANCHEN} 
     Sleep            1s
     Input Text                   ${SEARCH_BRANCHEN}               Peaky Blinders
     Sleep           2s
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC05/BEN-Less-Before.png
     Click Element                 ${BTN_RE_Company}        
     Sleep           1s    
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC05/BEN-Less-After.png



     Select From List By Label                        xpath=//*[@id="tbl_ou_length"]/label/select         50
     Click Element                     ${FT_ADDRESSTH}
     Input Text                 ${SEARCH_ADDRESSTH}                1
     Sleep           2s
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC05/ATH-Greater-Before.png
     Click Element                 ${BTN_RE_Company}        
     Sleep           1s    
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC05/ATH-Greater-After.png
     Select From List By Label                        xpath=//*[@id="tbl_ou_length"]/label/select         50
     Double Click Element               ${FT_ADDRESSTH}
     Sleep            1s
     Input Text                   ${SEARCH_ADDRESSTH}              1
     Sleep           2s
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC05/ATH-Less-Before.png
     Click Element                 ${BTN_RE_Company}        
     Sleep           1s    
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC05/ATH-Less-After.png



     
     Select From List By Label                        xpath=//*[@id="tbl_ou_length"]/label/select         100
     Click Element                     ${FT_TAXID}
     Input Text                 ${SEARCH_TAXID}                1
     Sleep           2s
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC05/TAX-Greater-Before.png
     Click Element                 ${BTN_RE_Company}        
     Sleep           1s    
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC05/TAX-Greater-After.png
     Select From List By Label                        xpath=//*[@id="tbl_ou_length"]/label/select         100
     Double Click Element                 ${FT_TAXID}
     Sleep            1s
     Input Text                   ${SEARCH_TAXID}             1
     Sleep           2s
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC05/TAX-Less-Before.png
     Click Element                 ${BTN_RE_Company}        
     Sleep           1s    
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC05/TAX-Less-After.png


TS01-TC06

     Click Element    ${ADMIN}
     Sleep         2s
     Click Element    ${COMPANY}    
     Sleep         2s
     Input Text                  ${SEARCH_SHORTNAME}              ZXCV
     Sleep         1s
     Click Element                    xpath=//*[@id="tbl_ou"]/tbody/tr/td[1]/a
     Sleep         2s
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC06/Before.png
     Input Text                     ${SHORTNAME}              ZXCV-update  
     Input Text      ${FULLTH}     เซ็ดแอกซ์ซีวี11-update
     Input Text      ${FULLEN}     zxcv Limited12-update
     Input Text      ${ADDRESSTH}  1234 ม.1-update
     Input Text      ${ADDRESSEN}  1234 m.1-update
     Input Text      ${TAXID}      654657410000
     Click Element   ${BTN_COMPANY_SAVE}
     Wait Until Page Contains                     Update success
     Click Element                     xpath=//button[@class="swal2-confirm swal2-styled"]
     Sleep             1s
     Input Text                     ${SEARCH_SHORTNAME}              ZXCV-update
     Sleep            2s
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC06/Updatesuccess.png
     Click Element                    xpath=//*[@id="tbl_ou"]/tbody/tr/td[1]/a
     Sleep           1s
     Capture Page Screenshot                    ${OUTPUTDIR}/Company/TC06/After.png