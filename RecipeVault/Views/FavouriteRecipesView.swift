import Foundation
import SwiftUI



struct FavouriteRecipesView: View {
    
    let pageTitle = "Favourite Recipes"
    let emptyFavouritesText = "No favorite recipes available to display."
    
    var body: some View {
        NavigationView {
            Text(emptyFavouritesText)
                .padding()
                .navigationTitle(pageTitle)
        }
        .navigationViewStyle(.stack)
    }
}

struct FavouriteRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteRecipesView()
    }
}
