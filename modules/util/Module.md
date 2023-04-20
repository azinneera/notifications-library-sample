## Module Overview
This module provides APIs to send an SMS and email.

### Usage

#### Using the SMS API to send a notification
Here's an example of how you can use the SMS API to send a notification:
```ballerina
configurable notifications:TwilioConfig twilioConfig = ?;
error? sendSmsResult = sendSms("0094077123456", "hello there!", twilioConfig);
```
