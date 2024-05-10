import Foundation
import SwiftUI



struct RecipesFormView: View {
    
    let pageTitle = "New Recipe"
    
    var body: some View {
        NavigationView {
            Text(pageTitle)
                .navigationTitle(pageTitle)
        }
    }
}

struct RecipesFormView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesFormView()
    }
}
