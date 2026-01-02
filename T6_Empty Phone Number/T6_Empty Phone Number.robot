*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${REGPAGE}    http://localhost:7272/Lab4/Registration.html
${FNAME}    Somyod
${LNAME}    Sodsai
${OGZ}    CS KKU
${EMAIL}    somyod@kkumail.com
${PHONE}    091-001-1234

*** Keywords ***
Start Chrome
    Open Browser    ${REGPAGE}    chrome
    Maximize Browser Window

*** Test Cases ***
Open Workshop Registration Page
    Start Chrome
	Page Should Contain    Workshop Registration
	Close Browser

Empty Phone Number
	Start Chrome
    Input Text    firstname    ${FNAME}
	Input Text    lastname    ${LNAME}
	Input Text    organization    ${OGZ}
	Input Text    email    ${EMAIL}
	Input Text    phone    ${EMPTY}
	Click Button    registerButton
	Location Should Be    ${REGPAGE}
	Page Should Contain    Please enter your phone number!!	
	Close Browser