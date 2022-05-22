import Swinject
import SwinjectAutoregistration

public final class MovieDetailFeatureAssembly: Assembly {
    public init() {}
    
    public func assemble(container: Container) {
        container
            .autoregister(
                MovieDetailViewModel.self,
                argument: String.self,
                initializer: MovieDetailViewModel.init
            )
            .inObjectScope(.transient)
    }
}
