public struct MovieCollectionFilter: Encodable {
    private enum CodingKeys: String, CodingKey {
        case text = "s"
        case type
        case yearOfRelease = "y"
        case page
    }

    private let text: String?
    private let type: String?
    private let yearOfRelease: String?
    private let page: Int
    
    public init(
        text: String? = nil,
        type: MovieType? = nil,
        yearOfRelease: String? = nil,
        page: Int = 1
    ) {
        self.text = text
        self.type = type?.rawValue
        self.yearOfRelease = yearOfRelease
        self.page = page
    }
}

