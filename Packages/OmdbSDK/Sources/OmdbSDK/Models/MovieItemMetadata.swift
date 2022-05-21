public struct MovieItemMetadata: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id = "imdbID"
        case title = "Title"
        case year = "Year"
        case poster = "Poster"
        case type = "Type"
    }
    
    public let id: String
    public let title: String
    public let year: String
    public let poster: String
    public let type: MovieType
}
