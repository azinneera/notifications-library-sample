import ballerinax/twilio;
import notifications.util;

# Twilio configurations for sending the SMS.
#
# + accountSid - Twilio account SID  
# + authToken - Authentication token for the account  
# + messageSenderId - mobile number to send the SMS from
public type TwilioConfig record {|
    string accountSid;
    string authToken;
    string messageSenderId;
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
    twilio:SmsResponse|error sendSmsResult = twilioClient->sendSms(
        twilioConfig.messageSenderId, 
        mobileNumber, 
        util:formatString(message));

    if sendSmsResult is error {
        return error(sendSmsResult.toBalString());
    }
}
