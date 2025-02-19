*** Settings ***
Library  SeleniumLibrary
Resource  ../resources/variables.robot
Resource  ../resources/keywords.robot

*** Test Cases ***
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

    Generate Random Vehicle Name
    Fill Vehicle Details And Submit
    Click Created Vehicle  ${random_vehicle_name}

    Select Items Per Page 50  # New Step Added Here
    Click Create New Motor  # Try normal click

    # If normal click fails, try JavaScript click
    Run Keyword And Ignore Error  Click Create New Motor (JS)

    Generate Random Motor Name
    Fill Motor Details And Submit
    Click Created Motor  ${random_motor_name}

    Close Browser