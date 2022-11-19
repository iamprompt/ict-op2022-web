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
    URL Should Be    /register/policy?type=student
    Select Checkbox         policyAgreement
    Checkbox Should Be Selected    policyAgreement
    Click Button            ต่อไป
    Wait Until Page Contains        ลงทะเบียน

    URL Should Be    /register/info
    Register Info
    Click Button            ต่อไป
    Wait Until Page Contains        ลงทะเบียน

    URL Should Be    /register/additional
    Register Info2
    Click Button            ลงทะเบียน
    Wait Until Element Is Visible    //img
    
    # Complete register
    URL Should Be    /register/success

    # Comback to first page again.
    Wait Until Element Contains     //div[contains(text(),'เลือกสัญชาติสำหรับลงทะเบียน')]    เลือกสัญชาติสำหรับลงทะเบียน
    Log    Test case 1 is done.

Test case 2: user can evaluate the event.
    Open Browser             ${url_website}/evaluation    ${browser}
    Wait Until Element Is Visible    //button[contains(text(),'เริ่มแบบสอบถาม')]
    Click Element    //button[contains(text(),'เริ่มแบบสอบถาม')]
    Wait Until Page Contains    ส่วนที่ 1
	Evaluate General
    Click Button    ต่อไป
    Wait Until Element Is Visible    //div[@id="__next"]

    URL Should Be    /evaluation/satisfaction
    Evaluate Satisfication
    Click Button    ต่อไป
    Wait Until Element Is Visible    //div[@id="__next"]

    URL Should Be    /evaluation/others
    Evaluate Others
    Click Button    ส่งข้อมูล
    Wait Until Element Is Visible    //img
    
    # Complete evaluation
    URL Should Be    /evaluation/success
    # Comeback to main page.
    Wait Until Element Is Visible    //button[contains(text(),'เริ่มแบบสอบถาม')]
    Log    Test case 2 is done.

Test case 3: verify agenda page works properly
    Open Browser    ${url_website}/agenda        ${browser}
    Wait Until Page Contains    Date
    # check whether 2 buttons of agenda date is visible.
    Element Should Be Visible    //*[contains(text(), "29 Oct")]
    Element Should Be Visible    //*[contains(text(), "28 Oct")]
    # event on 28 Oct
    Element Should Be Visible  //div[contains(@class, "max-w-screen-sm")]  
    Click Element    //*[contains(text(), "29 Oct")]
    # event on 29 Oct
    Element Should Be Visible  //div[contains(@class, "max-w-screen-sm")]  
    Log    Test case 3 is done.




*** Keywords ***
URL Should Be
    [Arguments]    ${path}
    ${current_url}=   Get Location
    Should Be Equal As Strings     ${current_url}     ${url_website}${path}

Register Info
    Input Text              //input[@id="firstName"]        นพรัตน์
    Input Text              //input[@id="lastName"]         เพ็งสุข
    Input Text              //input[@id="email"]            nopparat.pen@gmail.com
    Input Text              //input[@id="phone"]            0979244717

Register Info2
    Select From List By Label     province    กระบี่
    List Selection Should Be      province    กระบี่
    Input Text               //input[@id="school"]        โรงเรียนอัสสัมชัญธนบุรี
    Select From List By Label     level        มัธยมศึกษาปีที่ 6
    List Selection Should Be      level        มัธยมศึกษาปีที่ 6

Evaluate General
    Click Element    //*[contains(text(), "นักเรียน")]
	Click Element    //*[contains(text(), "ชาย")]
	Click Element    //*[contains(text(), "เพจ MUICT Open House")]
	Click Element    //*[contains(text(), "แนะแนวการศึกษา")]

Evaluate Satisfication
    #1. ความเหมาะสมของวัน / เวลา ในการจัดกิจกรรม
    click element    //div[contains(@class, "space-y-10")]/section[1]/div/div[1]/div/div[1]/label
    #2. ความเหมาะสมของสถานที่ที่ใช้ในการจัดกิจกรรม
    click element    //div[contains(@class, "space-y-10")]/section[1]/div/div[2]/div/div[1]/label
    #3. การบริการ / การอำนวยความสะดวก ในกิจกรรมต่าง ๆ
    click element    //div[contains(@class, "space-y-10")]/section[1]/div/div[3]/div/div[1]/label
    #4. มีความเข้าใจในหลักสูตรของคณะ ICT
    click element    //div[contains(@class, "space-y-10")]/section[2]/div/div[1]/div/div[1]/label
    #5. ได้รับความรู้และความเพลิดเพลินจากกิจกรรมและการแสดงบนเวที
    click element    //div[contains(@class, "space-y-10")]/section[2]/div/div[2]/div/div[1]/label
    #6. ได้รับความรู้และรู้จักรุ่นพี่จากซุ้มกิจกรรมนักศึกษา
    click element    //div[contains(@class, "space-y-10")]/section[2]/div/div[3]/div/div[1]/label
    #7. ได้รับความรู้และแรงบันดาลใจจากนิทรรศการแสดงผลงานนักศึกษา
    click element    //div[contains(@class, "space-y-10")]/section[2]/div/div[4]/div/div[1]/label
    #8. ได้รับความรู้เกี่ยวกับคณะ ICT จากกิจกรรมแนะแนวการศึกษา
    click element    //div[contains(@class, "space-y-10")]/section[2]/div/div[5]/div/div[1]/label
    #9. ได้รับความรู้ที่เป็นประโยชน์จากกิจกรรมเรียนรู้ประสบการณ์ด้านต่างประเทศ
    click element    //div[contains(@class, "space-y-10")]/section[2]/div/div[6]/div/div[1]/label
    #10. ประโยชน์และความรู้ที่ได้รับจากการเข้าร่วมกิจกรรมทั้งหมด
    click element    //div[contains(@class, "space-y-10")]/section[2]/div/div[7]/div/div[1]/label
    #11. ความพึงพอใจต่อภาพรวมของรูปแบบของการเข้าร่วมกิจกรรมในภาพรวม
    click element    //div[contains(@class, "space-y-10")]/section[2]/div/div[8]/div/div[1]/label
    #12. ได้รับแรงบันดาลใจและมีความสนใจสมัครเข้าศึกษาต่อที่คณะ ICT หรือแนะนำคณะ ICT ให้กับผู้ที่สนใจศึกษาต่อในด้านนี้
    click element    //div[contains(@class, "space-y-10")]/section[2]/div/div[9]/div/div[1]/label

Evaluate Others
    Input Text    //input[@id='interested-programs.0']    ICT,Mahidol
    Input Text    //input[@id='interested-programs.1']    EG,Mahidol
    Input Text    //input[@id='interested-programs.2']    SC,Mahidol
    Input Text    //input[@id='factors.0']    ใกล้บ้าน
    Input Text    //input[@id='factors.1']    ความสนใจ
    Input Text    //input[@id='factors.2']    เพื่อน
    Input Text    //*[@id='impressed']    'การจัดการ กิจกรรม ของรางวัล'
    Input Text    //*[@id='unimpressed']    คนเยอะไป
    Input Text    //*[@id='other-suggestions']    ไม่มี
    