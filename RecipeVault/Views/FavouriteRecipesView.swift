import Foundation
import SwiftUI



struct FavouriteRecipesView: View {
    
    @ObservedObject var recipeManager = RecipeViewModel.shared
    
    let pageTitle = "Favourite Recipes"
    let emptyFavouritesText = "No favorite recipes available to display."
    
    var body: some View {
        NavigationView {
            Text(emptyFavouritesText)
                .padding()
                .navigationTitle(pageTitle)
                .onAppear {
                    recipeManager.loadRecipes()
                }
        }
        .navigationViewStyle(.stack)
    }
}

struct FavouriteRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteRecipesView()
    }
}
