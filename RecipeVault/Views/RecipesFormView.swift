import Foundation
import SwiftUI

struct RecipesFormView: View {
    
    let pageTitle = "Create New Recipe"
    
    @State private var recipeName: String = ""
    @State private var description: String = ""
    @State private var category: Category = Category.lunch
    @State private var timeToComplete: Int = 5
    @State private var ingredients: [String] = []
    @State private var newIngredient: String = ""
    @State private var method: [String] = []
    @State private var newMethodStep: String = ""
    @State private var imageURL: String = ""
    @State private var tutorialURL: String = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            createNewRecipeForm()
        }
        .navigationViewStyle(.stack)
    }
    
    /// Creates a form for a new recipe
    /// - Returns: A View representing the recipe form
    func createNewRecipeForm() -> some View {
        return Form {
            
            Section(header: Text("Recipe Name")) {
                TextField("Name", text: $recipeName)
            }

            Section(header: Text("Description")) {
                ZStack(alignment: .leading) {
                    if description.isEmpty {
                        Text("Enter description here...")
                            .foregroundColor(.gray.opacity(0.7))
                            .padding(.vertical, 8)
                            .padding(.horizontal, 4)
                            .font(.system(size: 15))
                    }
                    TextEditor(text: $description)
                        .padding(4)
                }
            }
            Section(header: Text("Category")) {
                Picker("Select Category", selection: $category) {
                    ForEach(Category.allCases) { category in
                        Text(category.rawValue)
                            .tag(category)
                    }
                }
                .pickerStyle(.navigationLink)
            }
            
            Section(header: Text("Time To Complete")) {
                let minVal = 5
                let maxVal = 1440
                let incrementStep = 5
                Stepper(value: $timeToComplete, in: minVal...maxVal, step: incrementStep) {
                    Text("\(timeToComplete) minutes")
                }
            }

            Section(header: Text("Ingredients")) {
                createList(items: $ingredients, newItem: $newIngredient, placeholder: "Enter Ingredient", numbered: false)
            }
            
            Section(header: Text("Method")) {
                createList(items: $method, newItem: $newMethodStep, placeholder: "Enter Method Step", numbered: true)
            }
            
            Section(header: Text("Image (Optional)")) {
                TextField("Image URL", text: $imageURL)
            }
            
            Section(header: Text("Link (Optional)")) {
                TextField("Enter URL", text: $tutorialURL)
            }

        }
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Label("Cancel", systemImage: "xmark").labelStyle(.iconOnly)
                }
            }
            ToolbarItem {
                Button {
                    // TO DO
                    dismiss()
                } label: {
                    Label("Submit", systemImage: "checkmark").labelStyle(.iconOnly)
                }
                .disabled(isInputValid())
            }
        })
        .navigationTitle(pageTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    /// Creates a list of items with an add and delete functionality
    /// - Parameters:
    ///   - items: A binding to an array of strings representing the list items
    ///   - newItem: A binding to a string representing the new item to be added
    ///   - placeholder: A string for the placeholder text
    ///   - numbered: A boolean indicating if the list should be numbered
    /// - Returns: A View representing the list
    private func createList(items: Binding<[String]>, newItem: Binding<String>, placeholder: String, numbered: Bool) -> some View {
        
        /// Adds a new item to the list
        func addItem() {
            let trimmedNewItem = newItem.wrappedValue.trimmingCharacters(in: .whitespaces)
            if !trimmedNewItem.isEmpty {
                items.wrappedValue.append(trimmedNewItem)
                newItem.wrappedValue = ""
            }
        }
        
        /// Deletes an item from the list
        /// - Parameter offsets: The index set of items to be deleted
        func deleteItem(at offsets: IndexSet) {
            items.wrappedValue.remove(atOffsets: offsets)
        }
        
        return VStack {
            HStack {
                TextField(placeholder, text: newItem)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding(8)
                    .background(Color(.systemGray6).opacity(0.5))
                    .cornerRadius(8)
                Button(action: addItem) {
                    HStack() {
                        Image(systemName: "plus.circle.fill")
                        Text("Add")
                    }
                }
            }
            List {
                ForEach(items.wrappedValue.indices, id: \.self) { index in
                    HStack {
                        if numbered {
                            Text("\(index + 1). \(items.wrappedValue[index])")
                        } else {
                            Text(items.wrappedValue[index])
                        }
                        Spacer()
                        Button(action: {
                            items.wrappedValue.remove(at: index)
                        }) {
                            Image(systemName: "minus.circle.fill")
                                .foregroundColor(.red)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                    .padding([.top, .bottom], 10)
                }
                .onDelete(perform: deleteItem)
                .moveDisabled(true)
            }
        }
    }
    
    /// Validates the input for a recipe.
    /// - Parameters: None. Uses instance properties `recipeName`, `description`, `ingredients`, and `method`.
    /// - Returns: A Boolean value indicating whether the input is valid (true) or not (false).
    func isInputValid() -> Bool {
        return (recipeName.trimmingCharacters(in: .whitespaces)).isEmpty || (description.trimmingCharacters(in: .whitespaces)).isEmpty || ingredients.count <= 0 || method.count <= 0
    }

}

struct RecipesFormView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesFormView()
    }
}
