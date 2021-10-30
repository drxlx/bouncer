public protocol TokenExtractor {
    init(url: String, state: String?) throws
    func extract(parameter: String) throws -> String
}
