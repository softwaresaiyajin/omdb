import AppCore
import MovieService
import MovieListFeature
import InternationalizationService
import MovieDetailFeature

extension DI {
    static func registerAssemblies() {
        initialize(assemblies: [
            MovieServiceAssembly(),
            MovieListFeatureAssembly(),
            MovieDetailFeatureAssembly(),
            InternationalizationServiceAssembly()
        ])
    }
}
