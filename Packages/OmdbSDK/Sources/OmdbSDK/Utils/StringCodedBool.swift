import AppCore

@propertyWrapper
public struct StringCodedBool: CodableByTransform {
    public let wrappedValue: Bool
    
    public init(wrappedValue: Bool) {
        self.wrappedValue = wrappedValue
    }
    
    public static func transformDecodedValue(_ value: String) throws -> Self? {
        switch value {
        case "True":
            return Self.init(wrappedValue: true)
        case "False":
            return Self.init(wrappedValue: false)
        default:
            return nil
        }
    }

    public static func transformValueForEncoding(_ value: Self) throws -> String {
        value.wrappedValue ? "True" : "False"
    }
}
