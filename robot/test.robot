*** Settings ***
Library    SeleniumLibrary
Suite Teardown    Close Browser

*** Variables ***
${browser}        Chrome
${url_website}     http://localhost:4000


***Test Cases ***
Test opening google.co.th using Chrome
    Open Browser    http://localhost:4000    chrome
