import SwiftUI



// Main entry point for the SwiftUI application.
@main
struct RecipeVaultApp: App {
    // Defines the body of the application, specifying its content and behavior.
    var body: some Scene {
        // Creates a window group for managing a collection of windows.
        WindowGroup {
            // The root view that gets displayed when the app launches.
            MainView()
        }
    }
}
