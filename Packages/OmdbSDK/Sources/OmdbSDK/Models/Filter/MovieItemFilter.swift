public struct MovieItemFilter: Encodable {
    private enum CodingKeys: String, CodingKey {
        case id = "i"
        case title = "t"
        case type
        case yearOfRelease = "y"
        case plot
    }

    private let id: String?
    private let title: String?
    private let type: String?
    private let yearOfRelease: String?
    private let plot: String?
    
    public init(
        id: String? = nil,
        title: String? = nil,
        type: MovieType? = nil,
        yearOfRelease: String? = nil,
        plot: MoviePlot? = nil
    ) {
        self.id = id
        self.title = title
        self.type = type?.rawValue
        self.yearOfRelease = yearOfRelease
        self.plot = plot?.rawValue
    }
}

public struct MoviePlot: RawRepresentable, Decodable {
    public static let short: Self = .init(rawValue: "short")
    public static let full: Self = .init(rawValue: "full")

    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public struct MovieType: RawRepresentable, Decodable  {
    public static let film: Self = .init(rawValue: "movie")
    public static let series: Self = .init(rawValue: "series")
    public static let episode: Self = .init(rawValue: "episode")

    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}
