import ballerina/test;

configurable TwilioConfig smsTestConfig = ?;

public function testSmsNotifications() returns error? {
    string mobileNumber = "0094077123456";
    string message = "hello there!";
    error? sendSmsResult = sendSms(mobileNumber, message, smsTestConfig);
    test:assertFalse(sendSmsResult is error);
}

