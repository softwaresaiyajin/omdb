public struct MovieItemDetailedInfo: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id = "imdbID"
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case releasedDate = "Released"
        case runTime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case cast = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case ratings = "Ratings"
        case metascore = "Metascore"
        case imdbRating = "imdbRating"
        case imdbVotes = "imdbVotes"
        case type = "Type"
        case dvdReleaseDate = "DVD"
        case boxOffice = "BoxOffice"
        case production = "Production"
        case website = "Website"
        case response = "Response"
    }
    
    public let id: String
    public let title: String
    public let year: String
    public let rated: String
    public let releasedDate: String
    public let runTime: String
    public let genre: String
    public let director: String
    public let writer: String
    public let cast: String
    public let plot: String
    public let language: String
    public let country: String
    public let awards: String
    public let poster: String
    public let ratings: [MovieRating]
    public let metascore: String
    public let imdbRating: String
    public let imdbVotes: String
    public let type: MovieType
    public let dvdReleaseDate: String
    public let boxOffice: String
    public let production: String
    public let website: String
    @StringCodedBool public var response: Bool
}

public struct MovieRating: Decodable {
    private enum CodingKeys: String, CodingKey {
        case source = "Source"
        case value = "Value"
    }
    
    public let source: String
    public let value: String
}
