import MovieServiceInterface
import SwiftUI
import AppUI

struct MovieItemRow: View {
    let data: MovieItemMetadata
    
    var body: some View {
        HStack(alignment: .center, spacing: .spacingS) {
            AsyncImage(
                url: URL(string: data.poster),
                content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 50, maxHeight: 100)
                },
                placeholder: {
                    ProgressView()
                }
            )
            .frame(maxWidth: 50, maxHeight: 100)
            
            textView
        }
        .padding(.spacingS)
    }
    
    private var textView: some View {
        VStack(alignment: .leading, spacing: .spacingS) {
            Text(data.title)
                .foregroundColor(.primaryLabelColor)
            
            Text(data.year)
                .foregroundColor(.secondaryLabelColor)
        }
    }
}
