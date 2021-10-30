/// https://docs.github.com/en/developers/apps/building-oauth-apps/authorizing-oauth-apps
/// https://docs.github.com/en/developers/apps/building-oauth-apps/scopes-for-oauth-apps
public final class GitHubURLBuilder: OAuthURLBuilder {
	public required convenience init(scheme: String, host: String, path: String) {
		self.init()
	}

	public init() {
		super.init(scheme: "https", host: "github.com", path: "/login/oauth/authorize")
	}

	public convenience init(clientId: String) {
		self.init()
		set(clientId: clientId)
		set(redirectURI: "https://example.com")
		setQueryItem(key: "login", value: nil)
		set(scope: "read:user")
		set(state: "state-for-man-in-the-middle")
		setQueryItem(key: "allow_signup", value: "false")
	}
}
