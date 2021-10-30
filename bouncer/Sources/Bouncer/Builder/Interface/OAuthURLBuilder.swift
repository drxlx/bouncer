import Foundation

open class OAuthURLBuilder: OAuthBuilder {

	// MARK: - Error

	public enum Error: Swift.Error {
		case cannotBuildURL
	}

	// MARK: - Properties

	private var components: URLComponents

	// MARK: - OAuthBuilder

	public required init(scheme: String, host: String, path: String) {
		components = URLComponents()
		components.scheme = scheme
		components.host = host
		components.path = path
	}

	@discardableResult
	public func set(clientId: String) -> Self {
		add(queryItem: .init(name: "client_id", value: clientId))
		return self
	}

	@discardableResult
	public func set(clientSecret: String) -> Self {
		add(queryItem: .init(name: "client_secret", value: clientSecret))
		return self
	}

	@discardableResult
	public func set(responseType: ResponseType) -> Self {
		add(queryItem: .init(name: "response_type", value: responseType.rawValue))
		return self
	}

	@discardableResult
	public func set(scope: String) -> Self {
		add(queryItem: .init(name: "scope", value: scope))
		return self
	}

	@discardableResult
	public func set(state: String) -> Self {
		add(queryItem: .init(name: "state", value: state))
		return self
	}

	@discardableResult
	public func set(redirectURI: String) -> Self {
		add(queryItem: .init(name: "redirect_uri", value: redirectURI))
		return self
	}

	@discardableResult
	public func set(error: String) -> Self {
		add(queryItem: .init(name: "error", value: error))
		return self
	}

	@discardableResult
	public func set(errorDescription: String) -> Self {
		add(queryItem: .init(name: "error_description", value: errorDescription))
		return self
	}

	@discardableResult
	public func set(errorURI: String) -> Self {
		add(queryItem: .init(name: "error_uri", value: errorURI))
		return self
	}

	@discardableResult
	public func set(grantType: String) -> Self {
		add(queryItem: .init(name: "grant_type", value: grantType))
		return self
	}

	@discardableResult
	public func set(code: String) -> Self {
		add(queryItem: .init(name: "code", value: code))
		return self
	}

	@discardableResult
	public func setQueryItem(key: String, value: String?) -> Self {
		add(queryItem: .init(name: key, value: value))
		return self
	}

	public func build() throws -> URL {
		guard let url = components.url else { throw Error.cannotBuildURL }
		return url
	}

	// MARK: - Private

	private func add(queryItem: URLQueryItem) {
		if components.queryItems != nil {
			components.queryItems?.append(queryItem)
		} else {
			components.queryItems = [queryItem]
		}
	}
}
