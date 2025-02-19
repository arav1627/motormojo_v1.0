*** Variables ***
${EMAIL_FIELD}       id=email_id
${PASSWORD_FIELD}    id=password
${LOGIN_BUTTON}      css=.primarybt
${HOME_SECTION}      xpath=//div[contains(@class, 'Home')]
${EV_BUTTON}         xpath=//div[contains(text(), 'EV')]

# New window elements
${ITEMS_PER_PAGE_DROPDOWN}   xpath=//select[@class='form-select']
${ITEMS_PER_PAGE_OPTION_50}  xpath=//select[@class='form-select']/option[@value='50']

${CREATE_VEHICLE_BTN}    xpath=//button[normalize-space()='Create New Vehicle']

# Modal elements
${VEHICLE_NAME_FIELD}  id=vehicleName
${VEHICLE_DESC_FIELD}  id=vehicleDescription
${SAVE_BUTTON}         xpath=//button[text()='Save']

# New window elements
${ITEMS_PER_PAGE_DROPDOWN}   xpath=//select[@class='form-select']
${ITEMS_PER_PAGE_OPTION_50}  xpath=//select[@class='form-select']/option[@value='50']

${CREATE_MOTOR_BTN}    xpath=//button[normalize-space()='Create New Motor']

# Modal elements
${MOTOR_NAME_FIELD}  id=motorName
${MOTOR_DESC_FIELD}  id=motorDescription
${SAVE_BUTTON}       xpath=//button[text()='Save']

${run_button}  xpath=//button[contains(text(),'Run')]
