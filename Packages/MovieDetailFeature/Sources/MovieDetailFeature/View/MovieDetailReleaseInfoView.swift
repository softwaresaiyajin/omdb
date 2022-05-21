import SwiftUI
import AppUI

struct MovieDetailReleaseInfoView: View {
    let year: String
    let language: String
    let duration: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: .spacingS) {
            CommonHeaderView(title: "Details")
            
            makeInfoView(title: "Year Released", value: year)
            
            makeInfoView(title: "Language", value: language)
            
            makeInfoView(title: "Duration", value: duration)
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
