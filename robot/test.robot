*** Settings ***
Library    SeleniumLibrary
Suite Teardown    Close Browser

*** Variables ***
${browser}        Chrome
${url_website}     http://localhost:4000


***Test Cases ***
Test  
    Open Browser    ${url_website}/register    ${browser}
