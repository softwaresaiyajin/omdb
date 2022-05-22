import SwiftUI
import AppCore

public struct InternalViewFactory {
    public static func makeEntryView(id: String) -> some View {
        MovieDetailView(viewModel: DI.resolve(MovieDetailViewModel.self, argument: id))
    }
}
