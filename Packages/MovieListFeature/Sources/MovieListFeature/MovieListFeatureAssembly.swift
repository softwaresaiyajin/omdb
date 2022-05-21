import Swinject
import SwinjectAutoregistration

public final class MovieListFeatureAssembly: Assembly {
    public func assemble(container: Container) {
        container.register(MovieListView.self) { _ in
            MovieListView(viewModel: MovieListViewModelMock())
        }
    }
}
