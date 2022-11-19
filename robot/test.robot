*** Settings ***
Library    SeleniumLibrary

Test Teardown    Close Browser 
Suite Teardown    Close All Browsers

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

Test case 2: user can evaluate the event.
    Open Browser             ${url_website}/evaluation    ${browser}
    Wait Until Element Is Visible    //button[contains(text(),'เริ่มแบบสอบถาม')]
    Click Element    //button[contains(text(),'เริ่มแบบสอบถาม')]
    Wait Until Page Contains    ส่วนที่ 1
	Click Element    //*[contains(text(), "นักเรียน")]
	Click Element    //*[contains(text(), "ชาย")]
	Click Element    //*[contains(text(), "เพจ MUICT Open House")]
	Click Element    //*[contains(text(), "แนะแนวการศึกษา")]
    Click Button    ต่อไป
    Wait Until Element Is Visible    //div[@id="__next"]
    ${current_url}=   Get Location
    Should Be Equal As Strings     ${current_url}     ${url_website}/evaluation/satisfaction
    #1. วันเวลา
    click element    //div[contains(@class, "space-y-10")]/section[1]/div/div[1]/div/div[1]/label
    #2.
    click element    //div[contains(@class, "space-y-10")]/section[1]/div/div[2]/div/div[1]/label
    click element    //div[contains(@class, "space-y-10")]/section[1]/div/div[3]/div/div[1]/label
    click element    //div[contains(@class, "space-y-10")]/section[2]/div/div[1]/div/div[1]/label
    click element    //div[contains(@class, "space-y-10")]/section[2]/div/div[2]/div/div[1]/label
    click element    //div[contains(@class, "space-y-10")]/section[2]/div/div[3]/div/div[1]/label
    click element    //div[contains(@class, "space-y-10")]/section[2]/div/div[4]/div/div[1]/label
    click element    //div[contains(@class, "space-y-10")]/section[2]/div/div[5]/div/div[1]/label
    click element    //div[contains(@class, "space-y-10")]/section[2]/div/div[6]/div/div[1]/label
    click element    //div[contains(@class, "space-y-10")]/section[2]/div/div[7]/div/div[1]/label
    click element    //div[contains(@class, "space-y-10")]/section[2]/div/div[8]/div/div[1]/label
    click element    //div[contains(@class, "space-y-10")]/section[2]/div/div[9]/div/div[1]/label
    Click Button    ต่อไป
    Wait Until Element Is Visible    //div[@id="__next"]
    ${current_url}=   Get Location
    Should Be Equal As Strings     ${current_url}     ${url_website}/evaluation/others
    Input Text    //input[@id='interested-programs.0']    ICT,Mahidol
    Input Text    //input[@id='interested-programs.1']    EG,Mahidol
    Input Text    //input[@id='interested-programs.2']    SC,Mahidol
    Input Text    //input[@id='factors.0']    ใกล้บ้าน
    Input Text    //input[@id='factors.1']    ความสนใจ
    Input Text    //input[@id='factors.2']    เพื่อน
    Input Text    //*[@id='impressed']    'การจัดการ กิจกรรม ของรางวัล'
    Input Text    //*[@id='unimpressed']    คนเยอะไป
    Input Text    //*[@id='other-suggestions']    ไม่มี
    Click Button    ส่งข้อมูล
    Wait Until Element Is Visible    //img
    ${current_url}=   Get Location
    Should Be Equal As Strings     ${current_url}     ${url_website}/evaluation/success
    Wait Until Element Is Visible    //button[contains(text(),'เริ่มแบบสอบถาม')]
    Log    Test case 2 is done.

Test case 3: verify agenda page works properly
    Open Browser    ${url_website}/agenda        ${browser}
    Wait Until Page Contains    Date
    Click Element    //button[contains(text(),"28 Oct")]
    # click Element  //div[contains(@class, "max-w-screen-sm")]/div[1]element should contain  //div[contains(@class, "max-w-screen-sm")]/div[1]  08:30 - 09:00 LIVEพิธีเปิดกิจกรรม เวที ชั้น 1



