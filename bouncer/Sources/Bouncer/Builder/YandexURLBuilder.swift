/// https://yandex.ru/dev/oauth/doc/dg/reference/web-client.html
public final class YandexURLBuilder: OAuthURLBuilder {
	public required convenience init(scheme: String, host: String, path: String) {
		self.init()
	}

	public init() {
		super.init(scheme: "https", host: "oauth.yandex.ru", path: "/authorize")
		set(responseType: .token)
	}

	public convenience init(clientId: String) {
		self.init()
		set(clientId: clientId)
		setQueryItem(key: "device_id", value: nil)
		setQueryItem(key: "device_name", value: nil)
		set(redirectURI: "https://example.com")
		setQueryItem(key: "optional_scope", value: nil)
		setQueryItem(key: "force_confirm", value: nil)
		set(state: "state-for-man-in-the-middle")
		setQueryItem(key: "display", value: nil)
	}
}

