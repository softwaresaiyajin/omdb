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

