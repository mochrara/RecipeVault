import SwiftUI



struct TabBarView: View {
    
    var body: some View {
        
        generateTabBar()
        
    }
    
    /// Generates a TabView with multiple tabs, each corresponding to a different view in the application.
    /// - Parameters: None
    /// - Returns: A TabView containing four tabs for Recipes, Categories, Favourite Recipes, and Settings.
    func generateTabBar() -> some View {
            
        return TabView {
            RecipesView()
                .tabItem {
                    Label("Recipes", systemImage: "frying.pan.fill")
                }
            CategoriesView()
                .tabItem {
                    Label("Categories", systemImage: "square.stack.3d.up.fill")
                }
            FavouriteRecipesView()
                .tabItem {
                    Label("Favourites", systemImage: "heart.circle.fill")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear.badge.rtl")
                }
        }
    }

}



#Preview {
    TabBarView()
}
