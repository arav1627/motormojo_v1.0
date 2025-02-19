*** Settings ***
Library  SeleniumLibrary
Library  String  # Required for generating random text
Resource  locators.robot

*** Keywords ***
Open Browser To Login Page
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element  ${EMAIL_FIELD}  timeout=15s

Input Email
    [Arguments]  ${email}
    Wait Until Element Is Visible  ${EMAIL_FIELD}  timeout=10s
    Input Text  ${EMAIL_FIELD}  ${email}

Input Password
    [Arguments]  ${password}
    Wait Until Element Is Visible  ${PASSWORD_FIELD}  timeout=10s
    Input Text  ${PASSWORD_FIELD}  ${password}

Click Login Button
    Wait Until Element Is Visible  ${LOGIN_BUTTON}  timeout=10s
    Click Button  ${LOGIN_BUTTON}
    Wait Until Element Is Visible  ${EV_BUTTON}  timeout=15s  # Ensure EV button appears

Click EV Button
    Wait Until Page Contains Element   ${HOME_SECTION}  timeout=15s
    Wait Until Element Is Visible      ${EV_BUTTON}  timeout=15s
    Click Element  ${EV_BUTTON}
    Log  "EV Button Clicked Successfully"

Switch To New Window
    ${old_handles}  Get Window Handles
    Wait Until Keyword Succeeds  15s  1s  Check If New Window Opened  ${old_handles}
    ${new_handles}  Get Window Handles
    Switch Window  ${new_handles}[-1]
    Log  "Switched to new window"

Check If New Window Opened
    [Arguments]  ${old_handles}
    ${new_handles}  Get Window Handles
    ${diff}  Evaluate  len(set(${new_handles}) - set(${old_handles}))
    Run Keyword If  ${diff} > 0  Log  "New window detected"
    RETURN  ${diff} > 0

Select Items Per Page 50
    Wait Until Element Is Visible  ${ITEMS_PER_PAGE_DROPDOWN}  timeout=10s
    Click Element  ${ITEMS_PER_PAGE_DROPDOWN}
    Wait Until Element Is Visible  ${ITEMS_PER_PAGE_OPTION_50}  timeout=10s
    Click Element  ${ITEMS_PER_PAGE_OPTION_50}
    Log  "Set Items per page to 50"
    Sleep  3s

Click Create New Vehicle
    Wait Until Page Contains  Create New Vehicle  timeout=15s
    Wait Until Element Is Visible  ${CREATE_VEHICLE_BTN}  timeout=15s
    Wait Until Element Is Enabled  ${CREATE_VEHICLE_BTN}  timeout=10s
    Scroll Element Into View  ${CREATE_VEHICLE_BTN}
    Click Element  ${CREATE_VEHICLE_BTN}
    Log  "Create New Vehicle button clicked"

Generate Random Vehicle Name
    ${random}  Generate Random String  5  [LETTERS]
    ${random_vehicle_name}  Set Variable  Vehicle_${random}
    ${random_description}  Set Variable  Description_${random}
    Set Suite Variable  ${random_vehicle_name}
    Set Suite Variable  ${random_description}
    Log  "Generated Vehicle Name: ${random_vehicle_name}"
    Log  "Generated Vehicle Description: ${random_description}"

Fill Vehicle Details And Submit
    Wait Until Element Is Visible  ${VEHICLE_NAME_FIELD}  timeout=10s
    Generate Random Vehicle Name
    Input Text  ${VEHICLE_NAME_FIELD}  ${random_vehicle_name}
    Input Text  ${VEHICLE_DESC_FIELD}  ${random_description}
    Click Button  ${SAVE_BUTTON}
    Log  "Vehicle created with name: ${random_vehicle_name}"

Click Created Vehicle
    [Arguments]  ${vehicle_name}
    ${vehicle_xpath}  Set Variable  xpath=//td[contains(text(),'${vehicle_name}')]

    Wait Until Element Is Visible  ${vehicle_xpath}  timeout=15s
    Scroll Element Into View  ${vehicle_xpath}
    Click Element  ${vehicle_xpath}
    Log  "Clicked on the created vehicle: ${vehicle_name}"
    Sleep  5s
    Click Next Buttons And Run

Click Next Buttons And Run
    ${next_button}  Set Variable  xpath=//button[contains(text(),'Next')]
    ${go_to_motor_log_button}  Set Variable  xpath=//button[contains(text(),'Go to Motor Log')]
    
    # Click first 'Next' button
    Wait Until Element Is Visible  ${next_button}  timeout=10s
    Wait Until Element Is Enabled  ${next_button}  timeout=5s
    Scroll Element Into View  ${next_button}
    Click Element  ${next_button}
    Sleep  3s

    # Click second 'Next' button
    Wait Until Element Is Visible  ${next_button}  timeout=10s
    Wait Until Element Is Enabled  ${next_button}  timeout=5s
    Scroll Element Into View  ${next_button}
    Click Element  ${next_button}
    Sleep  3s

    # Click 'Run' button
    ${run_button}  Set Variable  xpath=//button[contains(text(),'Run')]
    Wait Until Element Is Visible  ${run_button}  timeout=15s
    Wait Until Element Is Enabled  ${run_button}  timeout=10s
    Scroll Element Into View  ${run_button}
    Click Element  ${run_button}
    Log  "Clicked the 'Run' button successfully"
    Sleep  10s

    # Click third 'Next' button
    Wait Until Element Is Visible  ${next_button}  timeout=10s
    Wait Until Element Is Enabled  ${next_button}  timeout=5s
    Scroll Element Into View  ${next_button}
    Click Element  ${next_button}
    Sleep  3s

    # Click fourth 'Next' button
    Wait Until Element Is Visible  ${next_button}  timeout=10s
    Wait Until Element Is Enabled  ${next_button}  timeout=5s
    Scroll Element Into View  ${next_button}
    Click Element  ${next_button}
    Sleep  3s

    # Click the 'Go to Motor Log' button
    Wait Until Element Is Visible  ${go_to_motor_log_button}  timeout=15s
    Click Element  ${go_to_motor_log_button}
    Log  "Clicked 'Go to Motor Log' button successfully"
    Sleep  5s

Click Create New Motor
    Wait Until Page Contains  Create New Motor  timeout=15s
    Wait Until Element Is Visible  ${CREATE_MOTOR_BTN}  timeout=15s
    Wait Until Element Is Enabled  ${CREATE_MOTOR_BTN}  timeout=10s
    Scroll Element Into View  ${CREATE_MOTOR_BTN}
    Click Element  ${CREATE_MOTOR_BTN}
    Log  "Create New Motor button clicked"

Generate Random Motor Name
    ${random}  Generate Random String  5  [LETTERS]
    ${random_motor_name}  Set Variable  Motor_${random}
    ${random_description}  Set Variable  Description_${random}
    Set Suite Variable  ${random_motor_name}
    Set Suite Variable  ${random_description}
    Log  "Generated Motor Name: ${random_motor_name}"
    Log  "Generated Motor Description: ${random_description}"

Fill Motor Details And Submit
    Wait Until Element Is Visible  ${MOTOR_NAME_FIELD}  timeout=10s
    Generate Random Motor Name
    Input Text  ${MOTOR_NAME_FIELD}  ${random_motor_name}
    Input Text  ${MOTOR_DESC_FIELD}  ${random_description}
    Click Button  ${SAVE_BUTTON}
    Log  "Motor created with name: ${random_motor_name}"

Click Created Motor
    [Arguments]  ${motor_name}
    ${motor_xpath}  Set Variable  xpath=//td[contains(text(),'${motor_name}')]

    Wait Until Element Is Visible  ${motor_xpath}  timeout=15s
    Scroll Element Into View  ${motor_xpath}
    Click Element  ${motor_xpath}
    Log  "Clicked on the created motor: ${motor_name}"
    Sleep  5s
    Click Next Buttons And Second Run

Click Next Buttons And Second Run
    ${next_button}  Set Variable  xpath=//button[contains(text(),'Next')]
    ${go_to_home_button}  Set Variable  xpath=//button[contains(text(),'Go to Home')]

    # Click first 'Next' button
    Wait Until Element Is Visible  ${next_button}  timeout=10s
    Wait Until Element Is Enabled  ${next_button}  timeout=5s
    Scroll Element Into View  ${next_button}
    Click Element  ${next_button}
    Sleep  3s

    # Click second 'Next' button
    Wait Until Element Is Visible  ${next_button}  timeout=10s
    Wait Until Element Is Enabled  ${next_button}  timeout=5s
    Scroll Element Into View  ${next_button}
    Click Element  ${next_button}
    Sleep  3s

    # Click third 'Next' button
    Wait Until Element Is Visible  ${next_button}  timeout=10s
    Wait Until Element Is Enabled  ${next_button}  timeout=5s
    Scroll Element Into View  ${next_button}
    Click Element  ${next_button}
    Sleep  3s

    # Click 'Run' button
    ${run_button}  Set Variable  xpath=//button[contains(text(),'Run')]
    Wait Until Element Is Visible  ${run_button}  timeout=15s
    Wait Until Element Is Enabled  ${run_button}  timeout=10s
    Scroll Element Into View  ${run_button}
    Click Element  ${run_button}
    Log  "Clicked the 'Run' button successfully"
    Sleep  180s

    # Click 1 'Next' button
    Wait Until Element Is Visible  ${next_button}  timeout=10s
    Wait Until Element Is Enabled  ${next_button}  timeout=5s
    Scroll Element Into View  ${next_button}
    Click Element  ${next_button}
    Sleep  3s

    # Click 2 'Next' button
    Wait Until Element Is Visible  ${next_button}  timeout=10s
    Wait Until Element Is Enabled  ${next_button}  timeout=5s
    Scroll Element Into View  ${next_button}
    Click Element  ${next_button}
    Sleep  3s

    # Click 3 'Next' button
    Wait Until Element Is Visible  ${next_button}  timeout=10s
    Wait Until Element Is Enabled  ${next_button}  timeout=5s
    Scroll Element Into View  ${next_button}
    Click Element  ${next_button}
    Sleep  3s

    # Click 4 'Next' button
    Wait Until Element Is Visible  ${next_button}  timeout=10s
    Wait Until Element Is Enabled  ${next_button}  timeout=5s
    Scroll Element Into View  ${next_button}
    Click Element  ${next_button}
    Sleep  3s

    # Click 5 'Next' button
    Wait Until Element Is Visible  ${next_button}  timeout=10s
    Wait Until Element Is Enabled  ${next_button}  timeout=5s
    Scroll Element Into View  ${next_button}
    Click Element  ${next_button}
    Sleep  3s

    # Click the 'Download' button
    ${download_button}  Set Variable  xpath=//button[contains(text(),'Download')]
    Wait Until Element Is Visible  ${download_button}  timeout=15s
    Click Element  ${download_button}
    Log  "Clicked 'Download' button successfully"

    # Click the 'Go to Home' button
    Wait Until Element Is Visible  ${go_to_home_button}  timeout=15s
    Click Element  ${go_to_home_button}
    Log  "Clicked 'Go to Home' button successfully"