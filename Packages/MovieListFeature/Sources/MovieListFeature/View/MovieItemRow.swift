import MovieServiceInterface
import SwiftUI
import AppUI

struct MovieItemRow: View {
    let data: MovieItemMetadata
    
    var body: some View {
        VStack(alignment: .leading, spacing: .spacingS) {
            Text(data.title)
                .foregroundColor(.black)
            
            Text(data.year)
                .foregroundColor(.gray)
        }
        .padding(.spacingS)
    }
}
