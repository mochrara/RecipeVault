import Foundation
import SwiftUI



struct RecipesView: View {
    
    let pageTitle = "My Recipes"
    
    var body: some View {
        NavigationView {
            Text(pageTitle)
                .navigationTitle(pageTitle)
        }
        .navigationViewStyle(.stack)
    }
}

struct RecipesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView()
    }
}
