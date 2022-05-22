import AppCore
import MovieService
import MovieListFeature
import InternationalizationService
import MovieDetailFeature

extension DI {
    static func registerAssemblies() {
        initialize(assemblies: [
            AppAssembly(),
            MovieServiceAssembly(),
            MovieListFeatureAssembly(),
            MovieDetailFeatureAssembly(),
            InternationalizationServiceAssembly()
        ])
    }
}
