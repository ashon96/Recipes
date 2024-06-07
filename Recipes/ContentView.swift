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
            if recipesViewModel.meals.isEmpty {
                ProgressView()
            } else {
                List {
                    ForEach(recipesViewModel.meals.sorted()) { meal in
                        NavigationLink {
                            Text("TODO")
                        } label: {
                            Text(meal.strMeal)
                        }
                    }
                }
                .navigationTitle("Recipes")
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
