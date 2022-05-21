public struct MovieItemMetadata: Hashable {
    public let id: String
    public let title: String
    public let year: String
    
    public init(
        id: String,
        title: String,
        year: String
    ) {
        self.id = id
        self.title = title
        self.year = year
    }
}
