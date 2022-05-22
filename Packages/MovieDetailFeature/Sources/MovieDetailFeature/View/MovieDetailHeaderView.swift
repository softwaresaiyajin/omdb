import SwiftUI
import AppUI

struct MovieDetailHeaderView: View {
    let posterURL: String
    let plot: String
    
    var body: some View {
        HStack(alignment: .top, spacing: .spacingM) {
            if let url = URL(string: posterURL) {
                makePosterView(url: url)
            } else {
                placeholderView
            }
            
            Text(plot)
                .foregroundColor(.secondary)
                .font(.body)
            
            Spacer(minLength: 0)
        }
        .padding(.spacingM)
        .background(Color.rowBackgroundColor)
        .insetRounded()
    }
    
    private func makePosterView(url: URL) -> some View {
        AsyncImage(
            url: url,
            content: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: 150, maxHeight: 223)
            },
            placeholder: {
                placeholderView
            }
        )
    }
    
    private var placeholderView: some View {
        Image(systemName: "photo.fill")
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: 150, maxHeight: 223)
    }
}
