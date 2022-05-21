public struct MovieCollection: Decodable {
    private enum CodingKeys: String, CodingKey {
        case items = "Search"
        case responseString = "Response"
    }
    
    public let items: [MovieItemMetadata]
    private let responseString: String
    
    public var response: Bool {
        responseString == "True"
    }
}
