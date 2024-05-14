import Foundation
import SwiftUI

/// Displays a list of recipe categories in the application.
struct CategoriesView: View {

    let pageTitle = "Categories"
    @ObservedObject var recipeManager = RecipeViewModel.shared
    
    /// Constructs the primary view.
    var body: some View {
        NavigationView {
            createCategoriesView()
                .navigationTitle(pageTitle)
                .onAppear {
                    recipeManager.loadRecipes() // Load recipes on view appearance.
                }
        }
        .navigationViewStyle(.stack)
    }
    
    
    /// Constructs a vertical stack containing category listings.
    /// - Returns: A VStack populated with category links.
    func createCategoriesView() -> some View {
        VStack(alignment: .leading) {
            Text("Explore a selection of categories to find your recipes")
                .font(.system(size: 15))
                .fontWeight(.medium)
                .opacity(0.7)
                .foregroundColor(.black)
                .padding([.leading, .trailing, .bottom])
                .padding(.top, 10)
            List {
                ForEach(Category.allCases) { category in
                    NavigationLink {
                        ScrollView {
                            // Creates a grid view for recipes of the selected category.
                            RecipesView().createRecipesGrid(
                                recipes: recipeManager.recipes.filter { $0.category == getCategoryName(category) },
                                noRecipesMessage: "No recipes available for the '\(getCategoryName(category))' category."
                            )
                        }
                        .navigationTitle(getCategoryName(category))
                    } label: {
                        Text(getCategoryName(category))
                            .padding([.top, .bottom], 10)
                    }
                }
            }
        }
    }
    
    
    /// Fetches the display name for a given category.
    /// - Parameter category: The category to fetch name for.
    /// - Returns: The display name of the category.
    func getCategoryName(_ category: Category) -> String {
        return category.rawValue
    }
    
}
