public final class FacebookTokenExtractor: OAuthTokenExtractor {
    public func extract() throws -> String {
        return try extract(parameter: "access_token")
    }
}
