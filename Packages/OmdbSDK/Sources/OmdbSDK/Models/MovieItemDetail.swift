public struct MovieItemDetail: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id = "imdbID"
        case title = "Title"
        case year = "Year"
        case language = "Language"
        case poster = "Poster"
        case cast = "Actors"
        case responseString = "Response"
    }
    
    public let id: String
    public let title: String
    public let year: String
    public let language: String
    public let poster: String
    public let cast: String
    private let responseString: String
    
    public var response: Bool {
        responseString == "True"
    }
}
