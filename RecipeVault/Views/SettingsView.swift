import Foundation
import SwiftUI



struct SettingsView: View {
    
    let pageTitle = "Settings"
    
    var body: some View {
        NavigationView {
            Text(pageTitle)
                .navigationTitle(pageTitle)
        }
        .navigationViewStyle(.stack)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
