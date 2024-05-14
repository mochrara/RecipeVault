import Foundation
import SwiftUI



/// A view displaying a list of favourite recipes.
struct FavouriteRecipesView: View {
    
    let pageTitle = "Favourite Recipes"
    @ObservedObject var recipeManager = RecipeViewModel.shared
    
    
    /// Constructs the primary view with a navigation view.
    var body: some View {
        NavigationView {
            createFavouritesView()
        }
        .navigationViewStyle(.stack)  // Apply stack navigation style.
    }
    
    
    /// Creates the favourites view for the favourited recipes.
    /// - Returns: A scroll view containing the favourite recipes.
    func createFavouritesView() -> some View {
        return ScrollView {
            // Check if there are any favourite recipes and display appropriate content.
            if recipeManager.recipes.filter({ $0.isFavourite }).isEmpty {
                // Display when no favourite recipes are available.
                HStack {
                    Text("No favourite recipes available")
                        .font(.headline)
                        .fontWeight(.medium)
                        .opacity(0.7)
                        .foregroundColor(.black)
                        .padding()
                    Spacer()
                }
                HStack {
                    Text("To mark a recipe as a favorite, click the heart icon located in the top right corner of the recipe page.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding()
                    Spacer()
                }
            } else {
                // Display when there are favourite recipes.
                HStack {
                    let favouriteCount = recipeManager.recipes.filter { $0.isFavourite }.count
                    Text("Showing \(favouriteCount) \(favouriteCount > 1 ? "favourite recipes" : "favourite recipe")")
                        .font(.headline)
                        .fontWeight(.medium)
                        .opacity(0.7)
                        .foregroundColor(.black)
                    .padding()
                    Spacer()
                }
                // LazyVStack for displaying favourite recipes.
                LazyVStack(spacing: 15) {
                    ForEach(recipeManager.recipes.filter { $0.isFavourite }) { recipe in
                        NavigationLink(destination: RecipesView().createRecipeInfoView(recipe: recipe)) {
                            RecipesView().createRecipeCard(recipe: recipe)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle(pageTitle)  // Set the navigation bar title.
        .onAppear {
            recipeManager.loadRecipes()  // Load recipes when the view appears.
        }
    }

}
