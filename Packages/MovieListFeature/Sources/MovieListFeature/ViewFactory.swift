import SwiftUI
import AppCore

public struct InternalViewFactory {
    public static func makeEntryView<Factory: ExternalViewFactoryInterface>(
        externalViewFactory: Factory
    ) -> some View {
        MovieListView(
            viewModel: DI.resolve(MovieListViewModel.self),
            externalViewFactory: externalViewFactory
        )
    }
}

public protocol ExternalViewFactoryInterface {
    associatedtype DetailView: View
    func makeMovieDetailView(id: String) -> DetailView
}
