import AppCore

@propertyWrapper
public struct StringCodedInt: CodableByTransform {
    public let wrappedValue: Int
    
    public init(wrappedValue: Int) {
        self.wrappedValue = wrappedValue
    }
    
    public static func transformDecodedValue(_ value: String) throws -> Self? {
        guard let num = Int(value) else {
            return nil
        }
        return Self.init(wrappedValue: num)
    }

    public static func transformValueForEncoding(_ value: Self) throws -> String {
        "\(value.wrappedValue)"
    }
}
