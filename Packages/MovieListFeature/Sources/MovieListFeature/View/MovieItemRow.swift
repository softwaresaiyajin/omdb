import MovieServiceInterface
import SwiftUI
import AppUI

struct MovieItemRow: View {
    let data: MovieItemMetadata
    
    var body: some View {
        HStack(alignment: .center, spacing: .spacingS) {
            if let url = URL(string: data.poster) {
                makePosterView(url: url)
            } else {
                placeholderView
            }
            
            textView
        }
        .padding(.spacingS)
    }
    
    private var textView: some View {
        VStack(alignment: .leading, spacing: .spacingS) {
            Text(data.title)
                .lineLimit(2)
                .font(.headline)
                .foregroundColor(.primary)
            
            Text(data.year)
                .lineLimit(2)
                .font(.body)
                .foregroundColor(.secondary)
        }
    }
    
    private func makePosterView(url: URL) -> some View {
        AsyncImage(
            url: url,
            content: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 50, maxHeight: 100)
            },
            placeholder: {
                Image(systemName: "photo.fill")
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 50, maxHeight: 100)
            }
        )
        .frame(maxWidth: 50, maxHeight: 100)
    }
    
    private var placeholderView: some View {
        Image(systemName: "photo.fill")
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: 50, maxHeight: 100)
    }
}
