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
        return VStack(alignment: .leading) {
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
                            RecipesView().createRecipesGrid(
                                recipes: Recipe.recipes.filter{ $0.category == getCategoryName(category)},
                                noRecipesMessage: "No recipes available for the '\(getCategoryName(category))' category."
                            )
                        }
                        .navigationTitle(getCategoryName(category))
                    }
                    label: {
                        Text(getCategoryName(category))
                            .padding([.top, .bottom], 10)
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
