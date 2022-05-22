import Swinject
import SwinjectAutoregistration

final class AppAssembly: Assembly {
    func assemble(container: Container) {
        container
            .autoregister(
                MainViewFactory.self,
                initializer: MainViewFactory.init
            )
            .inObjectScope(.container)
    }
}
