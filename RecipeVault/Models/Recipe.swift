import Foundation



/// Represents a recipe with all its details.
struct Recipe: Identifiable {
    
    let id = UUID() // Unique identifier for the recipe.
    let name: String // The name of the recipe.
    let img: String // The image URL or name associated with the recipe.
    let description: String // A brief description of the recipe.
    let ingredients: String // Ingredients required for the recipe.
    let steps: String // Steps to prepare the recipe.
    let timeToComplete: Int // The expected time it will take to complete the recipe.
    let category: Category.RawValue // The category of the recipe.
    let tutorialURL: String // URL to a tutorial for the recipe.
    
    /// A static array containing all recipes.
    static let recipes: [Recipe] = [
        Recipe(name: "Pancakes", img: "pancakes.jpg", description: "Fluffy pancakes", ingredients: "Flour, Milk, Eggs", steps: "Mix ingredients, cook on skillet", timeToComplete: 20, category: Category.breakfast.rawValue, tutorialURL: "http://example.com/pancakes"),
        Recipe(name: "Caesar Salad", img: "caesarsalad.jpg", description: "Classic Caesar salad", ingredients: "Lettuce, Croutons, Caesar dressing", steps: "Mix ingredients", timeToComplete: 15, category: Category.salads.rawValue, tutorialURL: "http://example.com/caesarsalad")
        // Add more recipes as needed
    ]
    
    /// Initializes a new Recipe instance.
    /// - Parameters:
    ///   - name: The name of the recipe.
    ///   - img: The image URL or name associated with the recipe.
    ///   - description: A brief description of the recipe.
    ///   - ingredients: Ingredients required for the recipe.
    ///   - steps: Steps to prepare the recipe.
    ///   - category: The category of the recipe.
    ///   - tutorialURL: URL to a tutorial for the recipe.
    init(name: String, img: String, description: String, ingredients: String, steps: String, timeToComplete: Int, category: Category.RawValue, tutorialURL: String) {
        self.name = name
        self.img = img
        self.description = description
        self.ingredients = ingredients
        self.steps = steps
        self.timeToComplete = timeToComplete
        self.category = category
        self.tutorialURL = tutorialURL
    }
}
