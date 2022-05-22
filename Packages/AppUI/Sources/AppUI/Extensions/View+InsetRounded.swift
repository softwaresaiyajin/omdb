import SwiftUI

public extension View {
    func insetRounded() -> some View {
        self
            .cornerRadius(10)
            .padding(.horizontal, .spacingM)
    }
}
