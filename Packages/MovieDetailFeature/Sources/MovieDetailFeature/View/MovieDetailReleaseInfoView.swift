import SwiftUI
import AppUI
import InternationalizationServiceInterface

struct MovieDetailReleaseInfoView: View {
    let year: String
    let language: String
    let duration: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: .spacingS) {
            CommonHeaderView(title: ~Slug.details)
            
            makeInfoView(title: ~Slug.yearReleased, value: year)
            
            makeInfoView(title: ~Slug.language, value: language)
            
            makeInfoView(title: ~Slug.duration, value: duration)
        }
        .padding(.spacingM)
        .background(Color.rowBackgroundColor)
        .insetRounded()
    }
    
    private func makeInfoView(title: String, value: String) -> some View {
        HStack(spacing: .spacingS) {
            Text("\(title):")
                .foregroundColor(.primary)
                .font(.subheadline)
            
            Text(value)
                .foregroundColor(.secondary)
                .font(.callout)
            
            Spacer(minLength: 0)
        }
    }
}
