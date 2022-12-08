import ballerina/test;
import ballerina/http;

@test:Config {}
function testFunc() returns error? {
    http:Client httpEndpoint = check new("localhost:9090", httpVersion = http:HTTP_1_1);
    string payload = check httpEndpoint->get("/albums");
    test:assertEquals(payload, [{title:"Blue Train",artist:"John Coltrane"},{title:"Jeru",artist:"Gerry Mulligan"}]);
}
