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

Register Success
	Start Chrome
    Input Text    firstname    ${FNAME}
	Input Text    lastname    ${LNAME}
	Input Text    organization    ${OGZ}
	Input Text    email    ${EMAIL}
	Input Text    phone    ${PHONE}
	Click Button    registerButton
	Wait Until Page Contains    Thank you    5s
	Title Should Be    Success
	Page Should Contain    Thank you for registering with us.
	Page Should Contain    We will send a confirmation to your email soon.	
	Close Browser