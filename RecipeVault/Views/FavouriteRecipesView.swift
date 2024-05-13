import Foundation
import SwiftUI



struct FavouriteRecipesView: View {
    
    @ObservedObject var recipeManager = RecipeViewModel.shared
    
    let pageTitle = "Favourite Recipes"
    
    var body: some View {
        NavigationView {
            ScrollView {
                if recipeManager.recipes.filter({ $0.isFavourite }).isEmpty {
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
