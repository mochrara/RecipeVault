import Foundation
import SwiftUI



struct CategoriesView: View {
    
    let pageTitle = "Categories"
    
    var body: some View {
        NavigationView {
            createCategoriesView()
            .navigationTitle(pageTitle)
        }
        .navigationViewStyle(.stack)
    }
    
    
    func createCategoriesView() -> some View {
        return VStack {
            Text("Recipes")
            List {
                ForEach(Category.allCases) { category in
                    NavigationLink {
                        ScrollView {
                            RecipesView().createRecipesGrid(
                                recipes: Recipe.recipes.filter{ $0.category == getCategoryName(category)},
                                noRecipesMessage: "No recipes available for the '\(getCategoryName(category))' category."
                            )
                        }
                        .navigationTitle(getCategoryName(category))
                    }
                    label: {
                        Text(getCategoryName(category))
                    }
                    
                }
            }
        }
    }
    
    
    func getCategoryName(_ category: Category) -> String {
        return category.rawValue
    }
    
}



struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
