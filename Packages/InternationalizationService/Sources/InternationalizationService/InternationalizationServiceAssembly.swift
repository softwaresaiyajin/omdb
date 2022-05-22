import Swinject
import SwinjectAutoregistration
import InternationalizationServiceInterface

public final class InternationalizationServiceAssembly: Assembly {
    public init() {}
    
    public func assemble(container: Container) {
        container
            .autoregister(TranslationManagerInterface.self, initializer: TranslationManager.init)
            .inObjectScope(.container)
    }
    
    public func loaded(resolver: Resolver) {
        // For convenience
        InternationalizationServiceInterface.defaultTranslationManager = resolver.resolve(TranslationManagerInterface.self)
    }
}
