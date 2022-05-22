import SwiftUI

public extension Color {
    private static func make(_ name: String) -> Color {
        .init(name, bundle: .module)
    }
    
    static let rowBackgroundColor: Color = .make("rowBackgroundColor")
    static let primaryBackgroundColor: Color = .make("primaryBackgroundColor")
}
