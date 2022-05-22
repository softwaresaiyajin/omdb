public struct MovieCollection: Decodable {
    private enum CodingKeys: String, CodingKey {
        case items = "Search"
        case response = "Response"
        case total = "totalResults"
    }
    
    public let items: [MovieItemMetadata]
    @StringCodedBool public var response: Bool
    @StringCodedInt public var total: Int
}
