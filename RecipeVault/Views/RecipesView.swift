import Foundation
import SwiftUI

/// A view that displays a collection of recipes.
struct RecipesView: View {
    
    let pageTitle = "My Recipes"
    
    var body: some View {
        NavigationView {
            ScrollView {
                createRecipeGrid(recipes: Recipe.recipes)
            }
            .navigationTitle(pageTitle)
        }
        .navigationViewStyle(.stack)
    }
    
    /// Creates a visual representation of a recipe card.
    /// - Parameter recipe: The Recipe instance containing details to display.
    /// - Returns: A view representing the recipe card.
    func createRecipeCard(recipe: Recipe) -> some View {
        let cardHeight: CGFloat = 180
        let cardTitleFontSize: CGFloat = 16
        let placeHolderImageSize: CGFloat = 60
        return ZStack(alignment: .bottomLeading) {
            if let imageUrl = URL(string: recipe.img) {
                AsyncImage(url: imageUrl) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: cardHeight)
                        .clipped()
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: placeHolderImageSize, height: placeHolderImageSize, alignment: .center)
                        .foregroundColor(.white.opacity(0.8))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            createCardTitle(recipe.name)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.black.opacity(0.2))
        }
        .frame(height: cardHeight)
        .background(Color.gray.opacity(0.4))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y: 10)
        
        /// Creates a card title strip with an embedded recipe title.
        /// - Parameter title: The title of the recipe.
        /// - Returns: A view (card title strip).
        func createCardTitle(_ title: String) -> some View {
            Text(title)
                .font(.system(size: cardTitleFontSize, weight: .bold, design: .default))
                .foregroundColor(.white)
                .padding(8)
                .padding(.leading, 6)
        }
    }

    /// Creates a grid layout for displaying recipe cards.
    /// - Parameter recipes: An array of Recipe instances to display.
    /// - Returns: A view representing the grid of recipe cards.
    func createRecipeGrid(recipes: [Recipe]) -> some View {
        return VStack {
            HStack {
                if recipes.isEmpty {
                    Text("No recipes available")
                        .font(.headline)
                        .fontWeight(.medium)
                        .opacity(0.7)
                        .foregroundColor(.blue)
                } else {
                    Text("Showing \(recipes.count) \(recipes.count > 1 ? "recipes" : "recipe")")
                        .font(.headline)
                        .fontWeight(.medium)
                        .opacity(0.7)
                        .foregroundColor(.blue)
                }
                Spacer()
            }
            if recipes.isEmpty {
                Text("Add a new recipe by tapping the '+' button in the top right corner.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.top, 20)
            } else {
                LazyVStack(spacing: 15) {
                    ForEach(recipes) { recipe in
                        createRecipeCard(recipe: recipe)
                    }
                }
                .padding(.top)
            }
        }
        .padding(.horizontal)
    }
}


/// A preview provider for the RecipesView.
struct RecipesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView()
    }
}
