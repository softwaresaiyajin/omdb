public protocol CodableByTransform: Codable {
    associatedtype CodingValue: Codable
    static func transformDecodedValue(_ value: CodingValue) throws -> Self?
    static func transformValueForEncoding(_ value: Self) throws -> CodingValue
}

public extension CodableByTransform {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let decoded = try container.decode(CodingValue.self)

        guard let value = try Self.transformDecodedValue(decoded) else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: """
                Decoding transformation failed for '\(decoded)'
                """
            )
        }

        self = value
    }

    func encode(to encoder: Encoder) throws {
        let encodable = try Self.transformValueForEncoding(self)
        var container = encoder.singleValueContainer()
        try container.encode(encodable)
    }
}
