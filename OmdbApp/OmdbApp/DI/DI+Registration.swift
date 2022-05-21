import AppCore
import MovieService
import MovieListFeature

extension DI {
    static func registerAssemblies() {
        initialize(assemblies: [
            MovieServiceAssembly(),
            //MovieListFeatureAssembly()
        ])
    }
}
