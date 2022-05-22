public struct MovieItemDetailedInfo {
    public let id: String
    public let title: String
    public let year: String
    public let poster: String
    public let plot: String
    public let language: String
    public let actors: [String]
    public let duration: String
    
    public init(
        id: String,
        title: String,
        year: String,
        poster: String,
        plot: String,
        language: String,
        actors: [String],
        duration: String
    ) {
        self.id = id
        self.title = title
        self.year = year
        self.poster = poster
        self.plot = plot
        self.language = language
        self.actors = actors
        self.duration = duration
    }
}
