public final class VKTokenExtractor: OAuthTokenExtractor {
    public func extract() throws -> String {
        return try extract(parameter: "access_token")
    }
}
