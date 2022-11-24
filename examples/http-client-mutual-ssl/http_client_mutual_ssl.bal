import ballerina/http;
import ballerina/io;

public function main() returns error? {
    // An HTTP client can be configured to initiate new connections that are secured via mutual SSL.
    // The `http:ClientSecureSocket` record provides the SSL-related configurations.
    http:Client securedEP = check new("https://localhost:9090",
        secureSocket = {
            key: {
                certFile: "../resource/path/to/public.crt",
                keyFile: "../resource/path/to/private.key"
            },
            cert: "../resource/path/to/public.crt"
        }
    );
    string response = check securedEP->/foo/bar;
    io:println(response);
}
