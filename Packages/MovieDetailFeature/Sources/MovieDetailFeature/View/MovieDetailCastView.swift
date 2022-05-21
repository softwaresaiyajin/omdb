import SwiftUI
import AppUI
import InternationalizationServiceInterface

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
            CommonHeaderView(title: ~Slug.cast)
            
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
