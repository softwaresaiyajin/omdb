import SwiftUI

public struct CommonHeaderView: View {
    private let title: String
    
    public init(title: String) {
        self.title = title
    }
    
    public var body: some View {
        Text(title)
            .foregroundColor(.primary)
            .font(.headline)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
