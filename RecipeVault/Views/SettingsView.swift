import Foundation
import SwiftUI

struct SettingsView: View {
    
    @State private var showResetAlert = false
    @ObservedObject var recipeManager = RecipeViewModel.shared
    
    let pageTitle = "Settings"
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Actions")) {
                    Button(action: {
                        showResetAlert = true
                    }) {
                        Text("Reset All Recipes")
                            .foregroundColor(.red)
                    }
                    .alert(isPresented: $showResetAlert) {
                        Alert(
                            title: Text("Reset All Recipes"),
                            message: Text("Are you sure you want to delete all recipes? This action cannot be undone."),
                            primaryButton: .destructive(Text("Delete")) {
                                recipeManager.clearRecipes()
                            },
                            secondaryButton: .cancel()
                        )
                    }
                }
            }
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
