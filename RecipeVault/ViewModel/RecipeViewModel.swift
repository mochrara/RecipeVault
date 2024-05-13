import Foundation
import SwiftUI

class RecipeViewModel: ObservableObject {
    
    static let shared = RecipeViewModel()
    private let userDefaultsKey = "savedRecipes"
    private let hasLoadedSampleRecipesKey = "hasLoadedSampleRecipes"
    
    /// A static array containing all sample recipes.
    private let sampleRecipes: [Recipe] = [
        Recipe(
            name: "Chocolate Brownies",
            img: "https://img.taste.com.au/SmWTQ0aD/w643-h428-cfill-q90/taste/2017/07/nutella-brownie_1980x1320-128834-1.jpg",
            description: "Combine choc-hazelnut spread, dark chocolate and hazelnuts to make these irresistible brownies.",
            ingredients: [
                "1/2 cup (70g) hazelnuts",
                "2 cups (660g) Coles Smooth Hazelnut Spread",
                "4 Coles Australian Free Range Eggs, lightly whisked",
                "1 cup (150g) self-raising flour",
                "200g dark chocolate, coarsely chopped"
            ],
            method: [
                "Preheat oven to 180C. Grease and line the base and sides of a 20cm square cake pan.",
                "Place the hazelnuts on a baking tray. Bake for 10 mins or until just toasted. Place in a clean tea towel and gently rub to remove skins. Coarsely chop.",
                "Combine the choc-hazelnut spread and egg in a large bowl. Add the flour and gently fold to combine. Add the hazelnut and chocolate and stir to combine. Spoon into the prepared pan and smooth the surface.",
                "Bake for 40-45 mins or until firm to touch. Set aside in the pan to cool completely. Cut into pieces."
            ],
            timeToComplete: 20,
            category: Category.breakfast.rawValue,
            tutorialURL: "http://example.com/pancakes/example.com/pancakes/example.com/pancakes/example.com/pancakes/example.com/pancakes",
            isFavourite: false
        ),
        // Add more sample recipes as needed
    ]
    
    @Published var recipes: [Recipe] = []
    
    private init() {
        loadRecipes()
    }
    
    func saveRecipe(_ recipe: Recipe) {
        recipes.append(recipe)
        saveRecipesToUserDefaults()
    }
    
    func loadRecipes() {
        if let data = UserDefaults.standard.data(forKey: userDefaultsKey),
           let savedRecipes = try? JSONDecoder().decode([Recipe].self, from: data) {
            recipes = savedRecipes
            print(recipes)
        }
        
        // Check if recipes array is empty after loading
        if recipes.isEmpty {
            loadSampleRecipes()
        }
    }
    
    func deleteRecipe(byID id: UUID) {
        if let index = recipes.firstIndex(where: { $0.id == id }) {
            recipes.remove(at: index)
            saveRecipesToUserDefaults()
        }
    }
    
    private func saveRecipesToUserDefaults() {
        if let data = try? JSONEncoder().encode(recipes) {
            UserDefaults.standard.set(data, forKey: userDefaultsKey)
        }
    }
    
    private func loadSampleRecipes() {
        let hasLoadedSampleRecipes = UserDefaults.standard.bool(forKey: hasLoadedSampleRecipesKey)
        if !hasLoadedSampleRecipes {
            recipes = sampleRecipes
            saveRecipesToUserDefaults()
            UserDefaults.standard.set(true, forKey: hasLoadedSampleRecipesKey)
        }
    }
    
    func clearRecipes() {
        recipes.removeAll()
        UserDefaults.standard.removeObject(forKey: userDefaultsKey)
        // Note: We don't reset the hasLoadedSampleRecipesKey here to avoid reloading samples on next launch
    }
    
    func toggleFavourite(for recipe: Recipe) {
        if let index = recipes.firstIndex(where: { $0.id == recipe.id }) {
            recipes[index].isFavourite.toggle()
            saveRecipesToUserDefaults()
        }
    }

}
