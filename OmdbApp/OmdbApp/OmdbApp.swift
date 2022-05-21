import SwiftUI
import AppCore
import MovieListFeature

@main
struct OmdbApp: App {
    init() {
        DI.registerAssemblies()
    }

    var body: some Scene {
        WindowGroup {
            MainViewFactory().makeLaunchView()
        }
    }
}
