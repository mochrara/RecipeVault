import SwiftUI



/// MainView is the primary view of the application that displays the main content.
/// - Parameters: None
/// - Returns: A View that shows the tab bar with various sections.
struct MainView: View {
    
    /// Constructs the primary view.
    var body: some View {
        showTabBar()
    }
    
    
    /// showTabBar generates and returns the TabBarView to be displayed in the main view.
    /// - Parameters: None
    /// - Returns: A TabBarView containing the application's main tabs.
    func showTabBar() -> some View {
        // Creates and returns an instance of TabBarView, which manages the main tabs of the app.
        return TabBarView()
    }
    
}
