import MovieListFeature
import SwiftUI
import AppCore

extension MainViewFactory {
    func makeLaunchView() -> some View {
        MovieListFeature.InternalViewFactory.makeEntryView(externalViewFactory: self)
    }
}

extension MainViewFactory: ExternalViewFactoryInterface {
    func makeMovieDetailView(id: String) -> some View {
        EmptyView()
    }
}
