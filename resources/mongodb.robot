*** Settings ***
Library  MongoDbLibrary

*** Variables ***
${MONGO_URI}      mongodb://localhost:27017
${MONGO_DB}       MojoMotorDB
${VEHICLE_COLLECTION}  Vehicle
${MOTOR_COLLECTION}    Motor

*** Keywords ***
Connect To MongoDB
    MongoDbLibrary.Connect To MongoDB  ${MONGO_URI}  ${MONGO_DB}
    Log  "Connected to MongoDB successfully"

Disconnect From MongoDB
    MongoDbLibrary.Close Connection
    Log  "Disconnected from MongoDB"

Fetch Random Vehicle Name
    Connect To MongoDB
    ${result}  MongoDbLibrary.Find Document  ${VEHICLE_COLLECTION}  query={}
    ${vehicle_name}  Get From Dictionary  ${result[0]}  vehicle_name
    Disconnect From MongoDB
    RETURN  ${vehicle_name}

Fetch Random Motor Name
    Connect To MongoDB
    ${result}  MongoDbLibrary.Find Document  ${MOTOR_COLLECTION}  query={}
    ${motor_name}  Get From Dictionary  ${result[0]}  motor_name
    Disconnect From MongoDB
    RETURN  ${motor_name}
