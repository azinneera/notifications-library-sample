import ballerina/email;
import notifications.util;
import ballerinax/twilio;

# Twilio configurations for sending the SMS.
#
# + accountSid - Twilio account SID  
# + authToken - Authentication token for the account  
# + senderMobileNo - mobile number to send the SMS from
public type TwilioConfig record {|
    string accountSid;
    string authToken;
    string senderMobileNo;
|};

# SMTP configurations for sending the email.
#
# + host - Host of the SMTP Client
# + username -  Username of the SMTP Client  
# + password -  Password of the SMTP Client
public type SMTPConfig record {|
    string host;
    string username;
    string password;
|};

# Sends an SMS to the given mobile number using the `ballerinax/twilio` module.
#
# + mobileNumber - mobile number with the country code (e.g. 0094XXXXXXXXXX)  
# + message - message to be sent in the SMS 
# + twilioConfig - twillio config in the form of notifications:TwilioConfig
# + return - error if failed to send the SMS
public function sendSms(string mobileNumber, string message, TwilioConfig twilioConfig) returns error? {
    twilio:Client twilioClient = check new (config = {
    twilioAuth: {
        accountSId: twilioConfig.accountSid,
        authToken: twilioConfig.authToken
    }
});
    twilio:SmsResponse|error sendSmsResult = twilioClient->sendSms(twilioConfig.senderMobileNo, mobileNumber, message);
    if sendSmsResult is error {
        return error(sendSmsResult.toBalString());
    }
}

# Sends an email to the given recipient.
#
# + recipient - email of the recipient  
# + subject - subject of the email  
# + message - message to be sent in the email  
# + smtpConfig - SMTP configuration for sending the email
# + return - error if failed to send the email
public function sendEmail(string recipient, string subject, string message, SMTPConfig smtpConfig) returns error? {
    email:SmtpClient smtpClient = check new (smtpConfig.host, smtpConfig.username , smtpConfig.password);

    email:Message email = {
        to: recipient,
        subject: util:formatString(message),
        body: util:formatString(message)
    };
    email:Error? sendEmailResult = smtpClient->sendMessage(email);
    if sendEmailResult is error {
        return error(sendEmailResult.toBalString());
    }
}
