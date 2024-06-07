//
//  RecipesListView.swift
//  Recipes
//
//  Created by Andrew Shon on 6/6/24.
//

import SwiftUI

struct RecipesListView: View {
    @EnvironmentObject var recipesViewModel: RecipesViewModel
    
    var body: some View {
        List {
            ForEach(recipesViewModel.meals.sorted()) { meal in
                NavigationLink {
                    RecipeDetailView(meal: meal)
                } label: {
                    Text(meal.strMeal)
                }
            }
        }
        .navigationTitle("Recipes")
    }
}

//#Preview {
//    RecipesListView()
//}
