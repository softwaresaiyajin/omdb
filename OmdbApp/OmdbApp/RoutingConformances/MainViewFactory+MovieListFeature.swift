import MovieListFeature
import MovieDetailFeature
import SwiftUI
import AppCore

extension MainViewFactory {
    func makeLaunchView() -> some View {
        MovieListFeature.InternalViewFactory.makeEntryView(externalViewFactory: self)
    }
}

extension MainViewFactory: ExternalViewFactoryInterface {
    func makeMovieDetailView(id: String) -> some View {
        MovieDetailFeature.InternalViewFactory.makeEntryView(id: id)
    }
}
