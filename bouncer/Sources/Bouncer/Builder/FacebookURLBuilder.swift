/// https://developers.facebook.com/docs/facebook-login/manually-build-a-login-flow/
/// https://developers.facebook.com/docs/permissions/reference
public final class FacebookURLBuilder: OAuthURLBuilder {
	public required convenience init(scheme: String, host: String, path: String) {
		self.init()
	}

	public init() {
		super.init(scheme: "https", host: "facebook.com", path: "/v11.0/dialog/oauth")
		set(responseType: .token)
	}

	public convenience init(clientId: String) {
		self.init()
		set(clientId: clientId)
		set(redirectURI: "https://example.com/")
		set(state: "state-for-man-in-the-middle")
		set(scope: "public_profile")
	}
}
