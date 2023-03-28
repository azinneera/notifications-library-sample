import ballerina/regex;

# Formats a string by replacing all tabs and multiple spaces with a single space.
#
# + message - message as a string
# + return - sanitized message
public function formatString(string message) returns string {
    string replacedMessage = regex:replaceAll(message, "\\s+", " ");
    return replacedMessage.trim();
}
