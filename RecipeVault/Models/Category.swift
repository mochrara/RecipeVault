import Foundation



/// Represents different categories for recipes in the application.
enum Category: String, CaseIterable, Identifiable {
    
    var id: String { self.rawValue }  // Provides a unique identifier for each category using its raw value.
    case breakfast = "Breakfast" // Breakfast category
    case lunch = "Lunch" // Lunch category
    case dinner = "Dinner" // Dinner category
    case snacks = "Snacks" // Snacks category
    case desserts = "Desserts" // Desserts category
    case beverages = "Beverages" // Beverages category
    case appetizers = "Appetisers" // Appetizers category
    case salads = "Salads" // Salads category
    case soups = "Soups" // Soups category
    
}
