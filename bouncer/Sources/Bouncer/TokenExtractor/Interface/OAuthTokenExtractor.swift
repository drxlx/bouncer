import Foundation

open class OAuthTokenExtractor: TokenExtractor {

	// MARK: - Error

	public enum Error: Swift.Error {
		case wrongURL
		case wrongState
		case cannotExtract(parameter: String)
	}

	// MARK: - Properties

	private let state: String?
	private var urlComponents: URLComponents

	// MARK: - TokenExtractor

	public required init(url: String, state: String? = nil) throws {
		guard let components = URLComponents(string: url) else { throw Error.wrongURL }

		self.urlComponents = components
		self.state = state
	}

	public func extract(parameter: String) throws -> String {
		extractFragmentIfNeeded()
		try checkState()
		return try extract(queryParameter: parameter)
	}

	// MARK: - Private

	private func checkState() throws {
		if let state = state {
			let urlState = try extract(queryParameter: "state")
			guard state == urlState else { throw Error.wrongState }
		}
	}

	private func extract(queryParameter: String) throws -> String {
		guard
			let queryItem = urlComponents.queryItems?.first(where: { $0.name == queryParameter }),
			let value = queryItem.value
		else {
			throw Error.cannotExtract(parameter: queryParameter)
		}

		return value
	}

	private func extractFragmentIfNeeded() {
		guard
			urlComponents.queryItems == nil || urlComponents.queryItems?.isEmpty == true
		else {
			return
		}

		urlComponents.query = urlComponents.fragment
	}
}
