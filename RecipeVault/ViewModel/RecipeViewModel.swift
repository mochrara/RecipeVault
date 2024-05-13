import Foundation
import SwiftUI

class RecipeViewModel: ObservableObject {
    
    static let shared = RecipeViewModel()
    private let userDefaultsKey = "savedRecipes"
    private let hasLoadedSampleRecipesKey = "hasLoadedSampleRecipes"
    
    /// A static array containing all sample recipes.
    private let sampleRecipes: [Recipe] = [
        Recipe(
            name: "Basic Pancakes",
            img: "https://img.taste.com.au/EtB4a6kw/w643-h428-cfill-q90/taste/2019/01/basic-pancakes-146204-2.jpg",
            description: "Ditch the packet version and easily make your own fluffy pancakes in just four steps! You're welcome.",
            ingredients: [
                "1 3/4 cups (435ml) milk",
                "1 Coles Australian Free Range Egg",
                "2 cups (300g) self-raising flour",
                "1/4 cup (55g) caster sugar",
                "1/4 tsp Coles Bicarbonate Soda",
                "20g butter, melted",
                "Whipped cream or vanilla ice cream, to serve",
                "Mixed berries, to serve",
                "Maple syrup, to serve"
            ],
            method: [
                "Whisk 1 3/4 cups (435ml) milk and 1 Coles Australian Free Range Egg in a large jug.",
                "Place the 2 cups (300g) self-raising flour, 1/4 cup (55g) caster sugar and 1/4 tsp Coles Bicarbonate Soda in a large bowl and stir until well combined. Make a well in the centre. Add the milk mixture to the flour mixture and use the whisk to stir until a smooth batter forms. Cover with plastic wrap and set aside for 30 mins to rest.",
                "Heat a large non-stick frying pan over medium-low heat. Brush with a little melted 20g butter, melted. Pour 1/4 cup (60ml) of the batter into the pan. Cook for 1-2 mins or until bubbles appear on the surface of the pancake. Turn and cook for a further 1 min or until light golden and cooked through. Transfer to a plate. Cover with foil to keep warm. Repeat with the remaining batter and melted butter to make 14 pancakes.",
                "Divide the pancakes among serving plates. Top with a dollop of Whipped cream or vanilla ice cream, to serve. Top with Mixed berries, to serve. Drizzle with Maple syrup, to serve."
            ],
            timeToComplete: 55,
            category: Category.breakfast.rawValue,
            tutorialURL: "https://www.taste.com.au/recipes/basic-pancakes-recipe/svoehztr",
            isFavourite: false
        ),
        Recipe(
            name: "Garlic and Lemongrass Roasted Chicken",
            img: "https://img.taste.com.au/2nwDN9-J/w643-h428-cfill-q90/taste/2021/03/april21_garlic-lemongrass-roasted-chicken-taste-170174-1.jpg",
            description: "This simple whole roast chicken is stuffed with a garlic, lemongrass and herb butter, then roasted on a bed of potatoes to crispy golden perfection.",
            ingredients: [
                "1 (about 1.5kg) whole chicken",
                "60g butter, softened",
                "1 1/2 tbsp lemongrass paste",
                "1 garlic clove, crushed",
                "2 spring onions, finely chopped",
                "2 tbsp finely chopped flat-leaf parsley",
                "1 1/2 tbsp Vegeta Real Chicken Stock Powder",
                "4 medium Red Royale potatoes, sliced",
                "350g Coles Kitchen Kaleslaw Salad Kit",
                "Lime wedges, to serve"
            ],
            method: [
                "Preheat oven to 200°C. Line a baking tray with baking paper. Carefully slide your fingers between the flesh and skin of the 1 (about 1.5kg) whole chicken breast to loosen.",
                "Place the 60g butter, softened, 1 1/2 tbsp lemongrass paste, 1 garlic clove, crushed, 2 spring onions, finely chopped, 2 tbsp finely chopped flat-leaf parsley and half the 1 1/2 tbsp Vegeta Real Chicken Stock Powder in a medium bowl. Season with pepper and combine. Reserve 1 tbs of butter mixture. Spoon the remaining butter mixture under the skin. Use your hands to spread the mixture evenly over the chicken, brushing the reserved mixture over the top of the skin. Tie the legs together with kitchen string.",
                "Place the chicken on the lined tray. Arrange 4 medium Red Royale potatoes, sliced around chicken. Spray with olive oil spray. Sprinkle potato with remaining stock powder and season with pepper. Bake for 50-60 mins or until the potato is golden and the chicken is cooked through. Rest for 10 mins.",
                "Meanwhile, prepare the 350g Coles Kitchen Kaleslaw Salad Kit in a bowl following packet directions.",
                "Arrange chicken on a serving platter with potato and Lime wedges, to serve. Serve with kaleslaw."
            ],
            timeToComplete: 75,
            category: Category.dinner.rawValue,
            tutorialURL: "https://www.taste.com.au/recipes/garlic-lemongrass-roasted-chicken-recipe/86r9hi2s",
            isFavourite: false
        ),
        Recipe(
            name: "Spinach and Ricotta Pasta Parcels",
            img: "https://img.taste.com.au/jiP56KRO/w643-h428-cfill-q90/taste/2018/12/spinach-and-ricotta-pasta-parcels_1980x1320-145196-1.jpg",
            description: "For a cheese lover's dream you can't go past these golden-baked spinach and ricotta pasta parcels.",
            ingredients: [
                "6 fresh lasagne sheets",
                "60ml (1/4 cup) olive oil, plus extra to drizzle",
                "3 green shallots, chopped",
                "1 bunch English spinach, rinsed, chopped",
                "1 zucchini, grated",
                "250g fresh ricotta",
                "2 tbsp basil pesto, plus extra to serve",
                "40g (1/4 cup) pine nuts, toasted, coarsely chopped",
                "100g cheddar cheese, coarsely grated",
                "30g butter",
                "300g tub creamy pumpkin soup",
                "Fresh basil leaves, torn, to serve"
            ],
            method: [
                "Cook 6 fresh lasagne sheets in a large saucepan of boiling water for 2 minutes or until softened. Remove and place flat on a clean surface.",
                "Meanwhile, heat half the 60ml (1/4 cup) olive oil, plus extra to drizzle in a large frying pan over medium-high heat. Cook 3 green shallots, chopped, stirring, 1 minute. Add 1 bunch English spinach, rinsed, chopped and 1 zucchini, grated. Cook, stirring, 2-3 minutes until just wilted. Cool. Stir through 250g fresh ricotta, 2 tbsp basil pesto, plus extra to serve and half the 40g (1/4 cup) pine nuts, toasted, coarsely chopped and 100g cheddar cheese, coarsely grated. Season. Preheat grill on high.",
                "Spoon mixture onto sheets and roll to make logs. Heat remaining oil and 30g butter in a heavy-based frying pan over medium heat. Add rolls, seam-side down. Cook 1-2 minutes.",
                "Pour over 300g tub creamy pumpkin soup and scatter with remaining cheese. Place under grill for 5-10 minutes until bubbling. Scatter with remaining pine nuts, and top with extra pesto and olive oil. Top with Fresh basil leaves, torn, to serve."
            ],
            timeToComplete: 40,
            category: Category.dinner.rawValue,
            tutorialURL: "https://www.taste.com.au/recipes/spinach-ricotta-pasta-parcels-recipe/hj81tac7",
            isFavourite: false
        ),
        Recipe(
            name: "Lemon Ricotta Dessert Cake",
            img: "https://content.api.news/v3/images/bin/c53307b8ed59a65f339ad8243e0bb52f",
            description: "Made from fresh ricotta, this baked lemon dessert cake has a similar texture to cheesecake and is delicious served with lemon curd and vanilla ice-cream.",
            ingredients: [
                "125g Coles organic butter, unsalted, at room temperature, chopped",
                "155g (3/4 cup) caster sugar",
                "1 lemon, rind finely grated",
                "250g fresh ricotta",
                "3 eggs",
                "150g (1 cup) self-raising flour",
                "60ml (1/4 cup) fresh lemon juice",
                "100g (1/4 cup) lemon curd, plus extra to serve",
                "Pure icing sugar, to dust",
                "Vanilla ice cream, to serve"
            ],
            method: [
                "Preheat oven to 170C/150C fan forced. Grease and line the base of a 20cm springform cake pan with baking paper.",
                "Use electric beaters to beat the 125g Coles organic butter, unsalted, at room temperature, chopped, 155g (3/4 cup) caster sugar and 1 lemon, rind finely grated until pale and creamy. Add the 250g fresh ricotta (see note) and beat until just combined. Add the 3 eggs, one at a time, beating well after each addition.",
                "Use a large metal spoon to fold the 150g (1 cup) self-raising flour into the mixture. Stir in the 60ml (1/4 cup) fresh lemon juice. Transfer mixture to the prepared pan and dollop with 100g (1/4 cup) lemon curd, plus extra to serve. Use a flat bladed knife to swirl the lemon curd into the batter. Gently tap the pan on the bench to settle the batter. Bake for 45 minutes or until the cake springs back when lightly touched (see note).",
                "Cool the cake in the pan for 10 minutes, then release the side of the pan. Cut the cake into wedges and serve warm, dust with Pure icing sugar, to dust, drizzled with extra curd and topped with Vanilla ice cream, to serve."
            ],
            timeToComplete: 65,
            category: Category.desserts.rawValue,
            tutorialURL: "https://www.taste.com.au/recipes/lemon-ricotta-dessert-cake-recipe/3031yp4z",
            isFavourite: false
        ),
        Recipe(
            name: "Creamy Tuscan Pumpkin Soup",
            img: "https://img.taste.com.au/MeKJjP8_/w643-h428-cfill-q90/taste/2023/03/creamy-tuscan-pumpkin-soup-with-air-fryer-focaccia-art-185944-1.jpg",
            description: "Our food director, Michelle has added an explosion of Italian-inspired flavour-packed ingredients to this silky smooth soup, taking it to a whole other level.",
            ingredients: [
                "2 tbsp extra virgin olive oil",
                "1 brown onion, finely chopped",
                "2 tbsp sun-dried tomato pesto, plus extra, to serve",
                "2 garlic cloves, crushed",
                "1 large fresh rosemary sprig",
                "1.5kg butternut pumpkin, peeled, deseeded, coarsely chopped",
                "1L carton (4 cups) Massel Organic Chicken Liquid Stock",
                "40g (1/2 cup) shredded parmesan",
                "Thickened cream, to serve",
                "Fresh basil leaves, to serve",
                "185ml (3/4 cup) lukewarm water",
                "3/4 tsp dry yeast",
                "Pinch of caster sugar",
                "225g (1 1/2 cups) plain flour",
                "1/2 tsp table salt",
                "2 tbsp extra virgin olive oil",
                "Assorted colourful vegetables, to decorate",
                "Fresh herbs, to decorate",
                "Sea salt flakes, to sprinkle"
            ],
            method: [
                "To make focaccia, place 185ml (3/4 cup) lukewarm water, 3/4 tsp dry yeast and Pinch of caster sugar in a jug. Stir until combined. Set aside in a warm place for 5 minutes or until frothy.",
                "Combine the 225g (1 1/2 cups) plain flour and 1/2 tsp table salt in a large bowl. Make a well in the centre. Pour in yeast mixture. Use a wooden spoon to stir for 2 minutes or until a sticky dough forms.",
                "Line base of an air fryer basket with baking paper. Pile dough into centre of prepared basket. Cover top of the basket with a clean tea towel. Set aside in a warm place for 30 minutes to rise.",
                "Meanwhile, heat 2 tbsp extra virgin olive oil in a large saucepan or stockpot over medium-high heat. Cook 1 brown onion, finely chopped, stirring, for 4-5 minutes or until softened. Add 2 tbsp sun-dried tomato pesto, plus extra, to serve, 2 garlic cloves, crushed and 1 large fresh rosemary sprig. Cook, stirring, for 30 seconds or until aromatic. Add 1.5kg butternut pumpkin, peeled, deseeded, coarsely chopped and stock. Cover and bring to the boil. Reduce heat to medium. Cook, partially covered with lid and stirring occasionally, for 15 minutes or until pumpkin is tender. Remove from heat. Set aside to cool slightly. Discard rosemary. Transfer to a blender and blend until smooth.",
                "To finish focaccia, drizzle the 2 tbsp extra virgin olive oil over dough. Use fingertips to spread out dough to fill basket, making sure dough is coated with oil. Cover basket with tea towel. Set aside for a further 30 minutes or until rises slightly.",
                "While the dough rests, preheat oven to 180C/160C fan forced. Line a baking tray with baking paper. Scatter 40g (1/2 cup) shredded parmesan over prepared tray into four 12cm discs, allowing room for spreading. Bake for 4-5 minutes or until golden. Set aside on tray to cool.",
                "Decorate dough with veg and Fresh herbs, to decorate (see notes). Sprinkle with Sea salt flakes, to sprinkle. Cook at 180°C in air fryer for 15 minutes or until golden. Cut into strips.",
                "Return the soup to the pan. Stir over low heat for 2-3 minutes to heat through. Divide among serving bowls. Top with Thickened cream, to serve, extra pesto, Fresh basil leaves, to serve and parmesan crisps. Season with pepper and serve with the focaccia."
            ],
            timeToComplete: 105,
            category: Category.soups.rawValue,
            tutorialURL: "https://www.taste.com.au/recipes/creamy-tuscan-pumpkin-soup-recipe/mdggim6y",
            isFavourite: false
        )
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
