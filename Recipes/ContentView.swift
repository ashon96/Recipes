//
//  ContentView.swift
//  Recipes
//
//  Created by Andrew Shon on 6/6/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var recipesViewModel = RecipesViewModel()

    var body: some View {
        NavigationStack {
            List {
                ForEach(recipesViewModel.meals) { meal in
                    Text(meal.id)
                }
            }
        }
        .task {
            await recipesViewModel.getMeals()
        }
    }
}

#Preview {
    ContentView()
}
