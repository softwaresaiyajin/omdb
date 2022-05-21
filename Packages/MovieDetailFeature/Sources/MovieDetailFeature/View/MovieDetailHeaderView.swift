import SwiftUI
import AppUI

struct MovieDetailHeaderView: View {
    let posterURL: String
    let plot: String
    
    var body: some View {
        HStack(alignment: .top, spacing: .spacingS) {
            AsyncImage(
                url: URL(string: posterURL),
                content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: 150, maxHeight: 223)
                },
                placeholder: {
                    ProgressView()
                }
            )
            
            Text(plot)
                .foregroundColor(.secondary)
                .font(.body)
            
            Spacer(minLength: 0)
        }
        .padding(.spacingM)
        .background(Color.rowBackgroundColor)
        .insetRounded()
    }
}
