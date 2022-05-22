import Swinject
import SwinjectAutoregistration

public final class MovieListFeatureAssembly: Assembly {
    public init() {}
    
    public func assemble(container: Container) {
        container
            .autoregister(
                MovieListViewModel.self,
                initializer: MovieListViewModel.init
            )
            .inObjectScope(.transient)
    }
}
