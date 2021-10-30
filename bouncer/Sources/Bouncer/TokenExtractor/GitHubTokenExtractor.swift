public final class GithubTokenExtractor: OAuthTokenExtractor {
    public func extract() throws -> String {
        return try extract(parameter: "code")
    }
}
