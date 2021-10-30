import Foundation

/// https://datatracker.ietf.org/doc/html/rfc6749
public protocol OAuthBuilder {
    init(scheme: String, host: String, path: String)
    func set(clientId: String) -> Self
    func set(clientSecret: String) -> Self
    func set(responseType: ResponseType) -> Self
    func set(scope: String) -> Self
    func set(state: String) -> Self
    func set(redirectURI: String) -> Self
    func set(error: String) -> Self
    func set(errorDescription: String) -> Self
    func set(errorURI: String) -> Self
    func set(grantType: String) -> Self
    func set(code: String) -> Self
    func setQueryItem(key: String, value: String?) -> Self
    func build() throws -> URL
}
