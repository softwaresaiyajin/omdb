import SwiftUI
import AppCore

@main
struct OmdbApp: App {
    private let mainViewFactory = MainViewFactory()
    
    init() {
        DI.registerAssemblies()
    }

    var body: some Scene {
        WindowGroup {
            mainViewFactory.makeLaunchView()
        }
    }
}
