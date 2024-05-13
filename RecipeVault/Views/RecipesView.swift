import Foundation
import SwiftUI



/// A view that displays a collection of recipes.
struct RecipesView: View {
    
    // Title for the navigation bar
    let pageTitle = "My Recipes"
    
    @State private var isShowingFormView = false
    @State private var showDeleteAlert = false
    @ObservedObject var recipeManager = RecipeViewModel.shared
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        createRecipesView()
    }
    
    /// Creates the main view for the recipes, encapsulated in a navigation view.
    /// - Returns: A navigation view containing the recipe grid.
    func createRecipesView() -> some View {
        return NavigationView {
            ScrollView {
                createRecipesGrid(
                    recipes: recipeManager.recipes,
                    noRecipesMessage: "Add a new recipe by tapping the '+' button in the top right corner."
                )
            }
            .navigationTitle(pageTitle)
            .onAppear {
                recipeManager.loadRecipes()
            }
            .toolbar(content: {
                ToolbarItem {
                    Button(action: {
                        isShowingFormView = true
                    }) {
                        Label("Add", systemImage: "plus")
                            .labelStyle(.iconOnly)
                            .frame(width: 50, height: 50) // Adjust frame if needed
                    }
                    .sheet(isPresented: $isShowingFormView) {
                        RecipesFormView()
                    }
                }
            })
        }
        .navigationViewStyle(.stack)
    }
    
    
    /// Creates a visual representation of a recipe card.
    /// - Parameter recipe: The Recipe instance containing details to display.
    /// - Returns: A view representing the recipe card.
    func createRecipeCard(recipe: Recipe) -> some View {
        let cardHeight: CGFloat = 180
        let cardTitleFontSize: CGFloat = 16
        let placeHolderImageSize: CGFloat = 60
        return ZStack(alignment: .bottomLeading) {
            // Display recipe image or a placeholder if the image is not available
            if let imageUrl = URL(string: recipe.img) {
                AsyncImage(url: imageUrl) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: cardHeight)
                        .clipped()
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: placeHolderImageSize, height: placeHolderImageSize, alignment: .center)
                        .foregroundColor(.white.opacity(0.8))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            // Add a title strip on top of the image
            createCardTitle(recipe.name)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.black.opacity(0.2))
        }
        .frame(height: cardHeight)
        .background(Color.gray.opacity(0.4))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y: 10)
        
        /// Creates a card title strip with an embedded recipe title.
        /// - Parameter title: The title of the recipe.
        /// - Returns: A view representing the card title strip.
        func createCardTitle(_ title: String) -> some View {
            Text(title)
                .font(.system(size: cardTitleFontSize, weight: .bold, design: .default))
                .foregroundColor(.white)
                .padding(8)
                .padding(.leading, 6)
        }
    }
    
    
    /// Creates a grid layout for displaying recipe cards.
    /// - Parameter recipes: An array of Recipe instances to display.
    /// - Returns: A view representing the grid of recipe cards.
    func createRecipesGrid(recipes: [Recipe], noRecipesMessage: String) -> some View {
        return VStack {
            HStack {
                // Display count of recipes or a message if none are available
                if recipes.isEmpty {
                    Text("No recipes available")
                        .font(.headline)
                        .fontWeight(.medium)
                        .opacity(0.7)
                        .foregroundColor(.black)
                } else {
                    Text("Showing \(recipes.count) \(recipes.count > 1 ? "recipes" : "recipe")")
                        .font(.headline)
                        .fontWeight(.medium)
                        .opacity(0.7)
                        .foregroundColor(.black)
                }
                Spacer()
            }
            // Show an instruction to add recipes if none exist
            if recipes.isEmpty {
                HStack {
                    Text(noRecipesMessage)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    .padding(.top, 20)
                    Spacer()
                }
            } else {
                // Display a lazy grid of recipe cards
                LazyVStack(spacing: 15) {
                    ForEach(recipes) { recipe in
                        NavigationLink(destination: createRecipeInfoView(recipe: recipe)) {
                            createRecipeCard(recipe: recipe)
                        }
                    }
                }
                .padding(.top)
            }
        }
        .padding(.horizontal)
    }
    
    
    /// Creates a scrollable view displaying recipe details.
    /// - Parameter recipe: The recipe to display.
    /// - Returns: A view with the recipe's image, name, description, ingredients, and steps.
    func createRecipeInfoView(recipe: Recipe) -> some View {
        return ScrollView { 
            VStack {
                // image management
                if let imageUrl = URL(string: recipe.img) {
                    AsyncImage(url: imageUrl) { image in
                        image
                            .resizable()
                            
                            
                            .clipped()
                    } placeholder: {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100, alignment: .center)
                            .foregroundColor(.white.opacity(0.8))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    .frame(height: 300)
                    .background(Color.gray.opacity(0.4))
                }
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        // category label
                        Text(recipe.category.uppercased())
                            .font(.system(size: 12))
                            .foregroundColor(.black.opacity(0.5))
                        Spacer()
                        // time to complete
                        HStack {
                            Image(systemName: "clock")
                                .resizable()
                                .frame(width: 17, height: 17)
                                .foregroundColor(.black.opacity(0.5))
                            Text("\(recipe.timeToComplete) min")
                                .font(.system(size: 12))
                                .foregroundColor(.black.opacity(0.5))
                        }
                    }
                    .padding(.top, 15)
                    // title
                    Text(recipe.name)
                        .font(.system(size: 24))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black.opacity(1))
                        .bold()
                        .padding(.bottom, 15)
                    // recipe body info
                    VStack(alignment: .leading, spacing: 40) {
                        // description
                        Text(recipe.description)
                            .font(.system(size: 16))
                            .foregroundColor(.black.opacity(1))
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                        Divider()
                            
                        // ingredients section
                        VStack(alignment: .leading, spacing: 20) {
                            HStack {
                                Image(systemName: "fork.knife.circle.fill")
                                    .resizable()
                                    .frame(width: 28, height: 28)
                                    .foregroundColor(.black.opacity(0.8))
                                Text("Ingredients Required")
                                    .font(.headline)
                                    .bold()
                            }
                            VStack(alignment: .leading, spacing: 20) {
                                ForEach(recipe.ingredients, id: \.self) { ingredient in
                                    HStack(alignment: .firstTextBaseline, spacing: 5) {
                                        Circle()
                                            .frame(width: 6, height: 6)
                                            .foregroundColor(.black.opacity(0.7))
                                            .padding(.bottom, 2)
                                            .padding(.trailing, 4)
                                        Text(ingredient)
                                            .font(.system(size: 16))
                                            .foregroundColor(.black.opacity(0.7))
                                            .lineLimit(nil)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }
                                    .padding(.leading, 10)
                                }
                            }
                        }
                        Divider()
                        // method section
                        VStack(alignment: .leading, spacing: 20) {
                            HStack {
                                Image(systemName: "list.bullet.circle.fill")
                                    .resizable()
                                    .frame(width: 28, height: 28)
                                    .foregroundColor(.black.opacity(0.8))
                                Text("Method")
                                    .font(.headline)
                                    .bold()
                            }
                            VStack(alignment: .leading, spacing: 20) {
                                ForEach(Array(recipe.method.enumerated()), id: \.element) { index, step in
                                    HStack(alignment: .firstTextBaseline, spacing: 5) {
                                        Text("\(index + 1).")
                                            .font(.system(size: 16))
                                            .foregroundColor(.black.opacity(0.7))
                                            .padding(.bottom, 2)
                                            .padding(.trailing, 4)
                                        Text(step)
                                            .font(.system(size: 16))
                                            .foregroundColor(.black.opacity(0.7))
                                            .lineLimit(nil)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }
                                    .padding(.leading, 10)
                                }
                            }
                        }
                        Divider()
                        // tutorial url (if exists)
                        if !recipe.tutorialURL.isEmpty, let url = URL(string: recipe.tutorialURL) {
                            VStack(alignment: .center, spacing: 10) {
                                HStack {
                                    Image(systemName: "pencil.circle.fill")
                                        .resizable()
                                        .frame(width: 28, height: 28)
                                        .foregroundColor(.black.opacity(0.8))
                                    Text("Tutorial URL")
                                        .font(.headline)
                                        .bold()
                                }
                                HStack {
                                    Spacer()
                                    Link(destination: url) {
                                        Text(recipe.tutorialURL)
                                            .font(.subheadline)
                                            .foregroundColor(.blue)
                                            .underline()
                                            .multilineTextAlignment(.center)
                                    }
                                    Spacer()
                                }
                            }
                            Divider()
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal)
            }
            
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    recipeManager.toggleFavourite(for: recipe)
                }) {
                    Image(systemName: recipe.isFavourite ? "heart.fill" : "heart")
                        .foregroundColor(recipe.isFavourite ? .red : .primary)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    showDeleteAlert = true
                }) {
                    Image(systemName:"trash")
                        .foregroundColor(.primary)
                }
            }
        }
        .alert(isPresented: $showDeleteAlert) {
            Alert(
                title: Text("Delete Recipe"),
                message: Text("Are you sure you want to delete this recipe?"),
                primaryButton: .destructive(Text("Delete")) {
                    recipeManager.deleteRecipe(byID: recipe.id)
                    dismiss()
                },
                secondaryButton: .cancel()
            )
        }
    }
}


/// A preview provider for the RecipesView.
struct RecipesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView()
    }
}
