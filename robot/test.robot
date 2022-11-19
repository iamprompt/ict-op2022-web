*** Settings ***
Library    SeleniumLibrary
Suite Teardown    Close Browser

*** Variables ***
${browser}        Chrome
${port}            4000
${url_website}     http://localhost:${port}


***Test Cases ***
Test case 1: Student can register into the system in Thai language.     
    Open Browser             ${url_website}/register    ${browser}
    Wait Until Element Contains     //div[contains(text(),'เลือกสัญชาติสำหรับลงทะเบียน')]    เลือกสัญชาติสำหรับลงทะเบียน
    Click Element            //button[contains(text(), 'สัญชาติไทย')]
    Page Should Contain      คุณคือใคร?
    Click Element            //div[contains(text(), 'นักเรียน')]
    Wait Until Page Contains        การให้สิทธิ์กับเจ้าของข้อมูลส่วนบุคคล
    ${current_url}=   Get Location
    Should Be Equal As Strings     ${current_url}     ${url_website}/register/policy?type=student
    Select Checkbox         policyAgreement
    Checkbox Should Be Selected    policyAgreement
    Click Button            ต่อไป
    Wait Until Page Contains        ลงทะเบียน
    ${current_url}=   Get Location
    Should Be Equal As Strings     ${current_url}     ${url_website}/register/info
    Input Text              //input[@id="firstName"]        นพรัตน์
    Input Text              //input[@id="lastName"]         เพ็งสุข
    Input Text              //input[@id="email"]            nopparat.pen@gmail.com
    Input Text              //input[@id="phone"]            0979244717
    Click Button            ต่อไป
    Wait Until Page Contains        ลงทะเบียน
    ${current_url}=   Get Location
    Should Be Equal As Strings     ${current_url}     ${url_website}/register/additional
    Select From List By Label     province    กระบี่
    List Selection Should Be      province    กระบี่
    Input Text               //input[@id="school"]        โรงเรียนอัสสัมชัญธนบุรี
    Select From List By Label     level        มัธยมศึกษาปีที่ 6
    List Selection Should Be      level        มัธยมศึกษาปีที่ 6
    Click Button            ลงทะเบียน
    Wait Until Element Is Visible    //img
    ${current_url}=   Get Location
    Should Be Equal As Strings     ${current_url}     ${url_website}/register/success
    Wait Until Element Contains     //div[contains(text(),'เลือกสัญชาติสำหรับลงทะเบียน')]    เลือกสัญชาติสำหรับลงทะเบียน
    Log    Test case 1 is done.

# Test case 2: user can evaluate the event.

