import AppCore
import MovieService
import MovieListFeature
import InternationalizationService

extension DI {
    static func registerAssemblies() {
        initialize(assemblies: [
            MovieServiceAssembly(),
            InternationalizationServiceAssembly()
        ])
    }
}
