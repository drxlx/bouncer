/// https://developers.google.com/identity/protocols/oauth2/web-server#incrementalAuth
/// https://developers.google.com/identity/protocols/oauth2/scopes
public final class GoogleURLBuilder: OAuthURLBuilder {
	public required convenience init(scheme: String, host: String, path: String) {
		self.init()
	}

	public init() {
		super.init(scheme: "https", host: "accounts.google.com", path: "/o/oauth2/v2/auth")
		set(responseType: .code)
	}

	public convenience init(clientId: String) {
		self.init()
		set(clientId: clientId)
		set(redirectURI: "https://example.com")
		set(scope: "https://www.googleapis.com/auth/userinfo.profile")
		setQueryItem(key: "access_type", value: "online")
		set(state: "state-for-man-in-the-middle")
		setQueryItem(key: "include_granted_scopes", value: nil)
		setQueryItem(key: "login_hint", value: nil)
		setQueryItem(key: "prompt", value: nil)
	}
}
