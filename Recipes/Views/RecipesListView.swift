//
//  RecipesListView.swift
//  Recipes
//
//  Created by Andrew Shon on 6/6/24.
//

import SwiftUI

struct RecipesListView<VM>: View where VM: RecipesService {
    @EnvironmentObject var recipesViewModel: VM
    
    var body: some View {
        List {
            ForEach(recipesViewModel.meals.sorted()) { meal in
                NavigationLink {
                    RecipeDetailView<VM>(meal: meal)
                } label: {
                    Text(meal.strMeal)
                }
            }
        }
        .navigationTitle("Recipes")
    }
}

#Preview {
    RecipesListView<MockRecipesViewModel>()
        .environmentObject(MockRecipesViewModel())
}
