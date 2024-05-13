import Foundation
import SwiftUI



/// Represents a recipe with all its details.
struct Recipe: Identifiable, Codable {
    
    var id = UUID() // Unique identifier for the recipe.
    var name: String // The name of the recipe.
    var img: String // The image URL or name associated with the recipe.
    var description: String // A brief description of the recipe.
    var ingredients: [String] // Ingredients required for the recipe.
    var method: [String] // Steps to prepare the recipe.
    var timeToComplete: Int // The expected time it will take to complete the recipe.
    var category: Category.RawValue // The category of the recipe.
    var tutorialURL: String // URL to a tutorial for the recipe.
    var isFavourite: Bool // If the recipe is a favourite.
    
    /// Initializes a new Recipe instance.
    /// - Parameters:
    ///   - name: The name of the recipe.
    ///   - img: The image URL or name associated with the recipe.
    ///   - description: A brief description of the recipe.
    ///   - ingredients: Ingredients required for the recipe.
    ///   - method: Steps to prepare the recipe.
    ///   - category: The category of the recipe.
    ///   - tutorialURL: URL to a tutorial for the recipe.
    init(name: String, img: String, description: String, ingredients: [String], method: [String], timeToComplete: Int, category: Category.RawValue, tutorialURL: String, isFavourite: Bool) {
        self.name = name
        self.img = img
        self.description = description
        self.ingredients = ingredients
        self.method = method
        self.timeToComplete = timeToComplete
        self.category = category
        self.tutorialURL = tutorialURL
        self.isFavourite = isFavourite
    }
    
}
