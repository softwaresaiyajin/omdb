import SwiftUI

public struct InternalViewFactory {
    public static func makeEntryView<Factory: ExternalViewFactoryInterface>(
        externalViewFactory: Factory
    ) -> some View {
        MovieListView(
            viewModel: MovieListViewModel(),
            externalViewFactory: externalViewFactory
        )
    }
}

public protocol ExternalViewFactoryInterface {
    associatedtype DetailView: View
    func makeMovieDetailView(id: String) -> DetailView
}
