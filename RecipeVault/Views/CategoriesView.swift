import Foundation
import SwiftUI



struct CategoriesView: View {
    
    let pageTitle = "Categories"
    
    var body: some View {
        NavigationView {
            Text(pageTitle)
                .navigationTitle(pageTitle)
        }
        .navigationViewStyle(.stack)
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
