import Swinject
import SwinjectAutoregistration
import MovieServiceInterface
import OmdbSDK

public final class MovieServiceAssembly: Assembly {
    public func assemble(container: Container) {
        container
            .register(OmdbAPIClient.self) { _ in
                OmdbAPIClient(apiKey: "c4a8a02e")
            }
            .inObjectScope(.container)
        
        container
            .autoregister(MovieManagerInterface.self, initializer: MovieManager.init)
            .inObjectScope(.container)
    }
}
