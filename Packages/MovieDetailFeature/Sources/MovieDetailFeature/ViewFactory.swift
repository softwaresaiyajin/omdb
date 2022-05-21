import SwiftUI

public struct InternalViewFactory {
    public static func makeEntryView(id: String) -> some View {
        MovieDetailView(viewModel: MovieDetailViewModel(id: id))
    }
}
