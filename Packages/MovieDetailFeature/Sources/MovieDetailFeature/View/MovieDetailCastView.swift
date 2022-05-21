import SwiftUI
import AppUI

struct MovieDetailCastView: View {
    let actors: [String]
    
    var body: some View {
        if actors.isEmpty {
            EmptyView()
        } else {
            contentView
        }
    }
    
    private var contentView: some View {
        VStack(alignment: .leading, spacing: .spacingS) {
            CommonHeaderView(title: "Cast")
            
            ForEach(actors, id: \.self) { item in
                Text("• \(item)")
                    .foregroundColor(.secondary)
                    .font(.callout)
            }
        }
        .padding(.spacingM)
        .background(Color.rowBackgroundColor)
        .insetRounded()
    }
}
