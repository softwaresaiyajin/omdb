public struct MovieItemMetadata: Hashable {
    public let id: String
    public let title: String
    public let year: String
    public let poster: String
    
    public init(
        id: String,
        title: String,
        year: String,
        poster: String
    ) {
        self.id = id
        self.title = title
        self.year = year
        self.poster = poster
    }
}
