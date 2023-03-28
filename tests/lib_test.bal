import ballerina/test;

configurable TwilioConfig smsTestConfig = ?;
configurable SMTPConfig emailTestConfig = ?;

public function testSmsNotifications() returns error? {
    string mobileNumber = "0094077123456";
    string message = "hello there!";
    error? sendSmsResult = sendSms(mobileNumber, message, smsTestConfig);
    test:assertFalse(sendSmsResult is error);
}

public function testEmailNotifications() returns error? {
    string recipient = "john@email.com";
    string subject = "March Newsletter";
    string message = "Click here to view the newsletter.";
    error? sendEmailResult = sendEmail(recipient, subject, message , emailTestConfig);
    test:assertFalse(sendEmailResult is error);
}
