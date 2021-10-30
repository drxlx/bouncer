public final class GoogleTokenExtractor: OAuthTokenExtractor {
    public func extract() throws -> String {
        return try extract(parameter: "code")
    }
}
