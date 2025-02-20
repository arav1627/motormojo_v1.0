*** Settings ***
Library  SeleniumLibrary
Resource  ../resources/variables.robot
Resource  ../resources/keywords.robot
Resource  ../resources/mongodb.robot

*** Test Cases ***
    Verify MongoDB Connection
    Connect To MongoDB
    ${collections}  List Collections
    Log  "Collections in DB: ${collections}"
    Should Contain  ${collections}  Vehicle  "Vehicle collection not found!"
    Should Contain  ${collections}  Motor  "Motor collection not found!"
    Disconnect From MongoDB

User Can Log In And Click EV Button
    Open Browser To Login Page
    Input Email  ${VALID_EMAIL}
    Input Password  ${VALID_PASSWORD}
    Click Login Button
    Click EV Button
    Switch To New Window
    Select Items Per Page 50  # New Step Added Here
    Click Create New Vehicle  # Try normal click

    # If normal click fails, try JavaScript click
    Run Keyword And Ignore Error  Click Create New Vehicle (JS)

    # Fetch existing vehicle name from MongoDB
    ${vehicle_name}  Fetch Random Vehicle Name
    Click Created Vehicle  ${vehicle_name}

    Select Items Per Page 50  # New Step Added Here
    Click Create New Motor  # Try normal click

    # If normal click fails, try JavaScript click
    Run Keyword And Ignore Error  Click Create New Motor (JS)

    # Fetch existing motor name from MongoDB
    ${motor_name}  Fetch Random Motor Name
    Click Created Motor  ${motor_name}

    Close Browser