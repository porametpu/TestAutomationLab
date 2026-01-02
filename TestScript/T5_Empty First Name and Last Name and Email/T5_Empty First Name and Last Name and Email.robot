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

Empty First Name and Last Name
	Start Chrome
    Input Text    firstname    ${EMPTY}
	Input Text    lastname    ${EMPTY}
	Input Text    organization    ${OGZ}
	Input Text    email    ${EMAIL}
	Input Text    phone    ${PHONE}
	Click Button    registerButton
	Location Should Be    ${REGPAGE}
	Page Should Contain    Please enter your name!!	
	Close Browser
	
Empty Email
	Start Chrome
    Input Text    firstname    ${FNAME}
	Input Text    lastname    ${LNAME}
	Input Text    organization    ${OGZ}
	Input Text    email    ${EMPTY}
	Input Text    phone    ${PHONE}
	Click Button    registerButton
	Location Should Be    ${REGPAGE}
	Page Should Contain    Please enter your email!!	
	Close Browser