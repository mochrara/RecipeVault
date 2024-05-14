import Foundation
import SwiftUI

/// A view for managing application settings, specifically for resetting all recipes.
struct SettingsView: View {
    
    let pageTitle = "Settings"
    @State private var showResetAlert = false
    @ObservedObject var recipeManager = RecipeViewModel.shared
    
    /// Constructs the primary view with a navigation view.
    var body: some View {
        NavigationView {
            createSettingsView()
        }
        .navigationViewStyle(.stack)  // Applies stack navigation style for consistent navigation behavior.
    }
        
    /// Creates the settings view.
    /// - Returns: A settings form view.
    func createSettingsView() -> some View {
        return Form {
            Section {
                HStack {
                    Text("RecipeVault allows you to create, customise and store your favorite cooking recipes, browse recipes through categories, and favorite them for quick access.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.top, 10)
                    Spacer()
                }
            }
            Section(header: Text("Actions")) {
                // Button to initiate the reset process.
                Button(action: {
                    showResetAlert = true  // Shows an alert to confirm the reset action.
                }) {
                    Text("Delete All Recipes")
                        .foregroundColor(.red)
                }
                .alert(isPresented: $showResetAlert) {  // Alert configuration.
                    Alert(
                        title: Text("Reset All Recipes"),
                        message: Text("Are you sure you want to delete all recipes? This action cannot be undone."),
                        primaryButton: .destructive(Text("Delete")) {
                            recipeManager.clearRecipes()  // Clears all recipes upon confirmation.
                        },
                        secondaryButton: .cancel()
                    )
                }
            }
        }
        .navigationTitle(pageTitle)  // Sets the navigation bar title.
    }
}
