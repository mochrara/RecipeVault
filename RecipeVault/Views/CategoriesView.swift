import Foundation
import SwiftUI



struct CategoriesView: View {
    
    let pageTitle = "Recipe Categories"
    
    var body: some View {
        NavigationView {
            Text(pageTitle)
                .navigationTitle(pageTitle)
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
