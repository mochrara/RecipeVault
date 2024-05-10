//
//  RecipeInfoView.swift
//  RecipeVault
//
//  Created by SR71 on 10/5/2024.
//

import SwiftUI

struct RecipeInfoView: View {
    var recipe: Recipe
    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: recipe.img)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
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
            
            VStack(spacing: 30) {
                Text(recipe.name)
                    .padding(.top, 12)
                    .font(.system(size: 24))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black.opacity(0.9))
                
                VStack(alignment: .leading, spacing: 30) {
                    Text(recipe.description)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Ingredients Required")
                            .font(.headline)
                        Text(recipe.ingredients)
                    }
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Steps Required")
                            .font(.headline)
                        Text(recipe.steps)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            
        }
        .ignoresSafeArea(.container, edges: .top)
    }
}

#Preview {
    RecipeInfoView(recipe: Recipe.recipes[0])
}
