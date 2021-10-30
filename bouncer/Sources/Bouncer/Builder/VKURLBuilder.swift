/// https://vk.com/dev/implicit_flow_user
public final class VKURLBuilder: OAuthURLBuilder {
	public required convenience init(scheme: String, host: String, path: String) {
		self.init()
	}

	public init() {
		super.init(scheme: "https", host: "oauth.vk.com", path: "/authorize")
		set(responseType: .token)
	}

	public convenience init(clientId: String) {
		self.init()
		set(clientId: clientId)
		set(redirectURI: "https://oauth.vk.com/blank.html")
		setQueryItem(key: "display", value: "mobile")
		set(scope: "notify")
		setQueryItem(key: "v", value: "5.131")
		set(state: "state-for-man-in-the-middle")
		setQueryItem(key: "revoke", value: nil)
	}
}
