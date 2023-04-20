# Formats a string by replacing all tabs and multiple spaces with a single space.
#
# + message - message as a string
# + return - formatted message
public function formatString(string message) returns string {
    string:RegExp regex = re `\\s+`;
    string replacedMessage = regex.replaceAll(message, " ");
    return replacedMessage.trim();
}
