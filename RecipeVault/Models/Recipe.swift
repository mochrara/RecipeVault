import Foundation
import SwiftUI



/// Represents a recipe with all its details.
struct Recipe: Identifiable {
    
    let id = UUID() // Unique identifier for the recipe.
    let name: String // The name of the recipe.
    let img: String // The image URL or name associated with the recipe.
    let description: String // A brief description of the recipe.
    let ingredients: [String] // Ingredients required for the recipe.
    let method: [String] // Steps to prepare the recipe.
    let timeToComplete: Int // The expected time it will take to complete the recipe.
    let category: Category.RawValue // The category of the recipe.
    let tutorialURL: String // URL to a tutorial for the recipe.
    
    /// A static array containing all recipes.
    static let recipes: [Recipe] = [
        Recipe(name: "Chocolate Brownies",
               img: "https://img.taste.com.au/SmWTQ0aD/w643-h428-cfill-q90/taste/2017/07/nutella-brownie_1980x1320-128834-1.jpg",
               description: "Combine choc-hazelnut spread, dark chocolate and hazelnuts to make these irresistible brownies.",
               ingredients: [
                "1/2 cup (70g) hazelnuts",
                "2 cups (660g) Coles Smooth Hazelnut Spread",
                "4 Coles Australian Free Range Eggs, lightly whisked",
                "1 cup (150g) self-raising flour", "200g dark chocolate, coarsely chopped"
               ],
               method: [
                "Preheat oven to 180C. Grease and line the base and sides of a 20cm square cake pan.",
                "Place the hazelnuts on a baking tray. Bake for 10 mins or until just toasted. Place in a clean tea towel and gently rub to remove skins. Coarsely chop.",
                "Combine the choc-hazelnut spread and egg in a large bowl. Add the flour and gently fold to combine. Add the hazelnut and chocolate and stir to combine. Spoon into the prepared pan and smooth the surface.",
                "Bake for 40-45 mins or until firm to touch. Set aside in the pan to cool completely. Cut into pieces."
               ],
               timeToComplete: 20, category: Category.breakfast.rawValue,
               tutorialURL: "http://example.com/pancakes/example.com/pancakes/example.com/pancakes/example.com/pancakes/example.com/pancakes"),
        
        
        // Add more recipes as needed
    ]
    
    /// Initializes a new Recipe instance.
    /// - Parameters:
    ///   - name: The name of the recipe.
    ///   - img: The image URL or name associated with the recipe.
    ///   - description: A brief description of the recipe.
    ///   - ingredients: Ingredients required for the recipe.
    ///   - method: Steps to prepare the recipe.
    ///   - category: The category of the recipe.
    ///   - tutorialURL: URL to a tutorial for the recipe.
    init(name: String, img: String, description: String, ingredients: [String], method: [String], timeToComplete: Int, category: Category.RawValue, tutorialURL: String) {
        self.name = name
        self.img = img
        self.description = description
        self.ingredients = ingredients
        self.method = method
        self.timeToComplete = timeToComplete
        self.category = category
        self.tutorialURL = tutorialURL
    }
    
}
