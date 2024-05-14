import SwiftUI



/// TabBarView manages the main navigation within the app via a tab bar interface.
struct TabBarView: View {
    
    /// Constructs the primary view.
    var body: some View {
        generateTabBar()
    }
    
    
    /// Generates a TabView with multiple tabs, each corresponding to a different view in the application.
    /// - Parameters: None
    /// - Returns: A TabView containing four tabs for Recipes, Categories, Favourite Recipes, and Settings.
    func generateTabBar() -> some View {
        // Creates a TabView that includes four main sections of the app, each represented by a tab.
        return TabView {
            RecipesView()
                .tabItem {
                    // Defines the tab for the Recipes view with an icon.
                    Label("Recipes", systemImage: "frying.pan.fill")
                }
            CategoriesView()
                .tabItem {
                    // Defines the tab for the Categories view with an icon.
                    Label("Categories", systemImage: "square.stack.3d.up.fill")
                }
            FavouriteRecipesView()
                .tabItem {
                    // Defines the tab for the Favourites view with an icon.
                    Label("Favourites", systemImage: "heart.circle.fill")
                }
            SettingsView()
                .tabItem {
                    // Defines the tab for the Settings view with an icon.
                    Label("Settings", systemImage: "gear.badge.rtl")
                }
        }
    }

}
