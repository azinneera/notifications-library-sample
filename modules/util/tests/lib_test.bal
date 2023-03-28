import ballerina/test;

@test:Config {}
function testFunction() {
    string message = "Hello  World! ";
    test:assertEquals("Hello World!", formatString(message));
}
