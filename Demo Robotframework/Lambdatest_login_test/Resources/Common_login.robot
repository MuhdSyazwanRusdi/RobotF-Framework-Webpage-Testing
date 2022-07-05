*** Settings ***
Library           Selenium2Library
Library           LambdaTestStatus.py

*** Variables ***
@{_tmp}           browserName: chrome,    platform: Windows 8.1 ,    version: 92.0 ,    visual: false ,    network: false,    console: false,    name: RobotFramework Lambda Test
${BROWSER}        chrome
${CAPABILITIES}    ${EMPTY.join(${_tmp})}
${REMOTE_URL}     http://muhammadsyazwanrusdi:PIznrE9KhbMLp8xFHe2IXQmTUgLXru7ltWiw2n0Y68EaAT15J1@hub.lambdatest.com/wd/hub


*** Keywords ***
Open test browser
    Open browser    https://opensource-demo.orangehrmlive.com/    browser=${BROWSER}    remote_url=${REMOTE_URL}    desired_capabilities=${CAPABILITIES}

Close test browser
    Run keyword if    '${REMOTE_URL}' != ''    Report Lambdatest Status    ${TEST_NAME}    ${TEST_STATUS}
    Close all browsers