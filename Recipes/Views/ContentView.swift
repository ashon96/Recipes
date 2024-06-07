//
//  ContentView.swift
//  Recipes
//
//  Created by Andrew Shon on 6/6/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var recipesViewModel = RecipesViewModel()

    var body: some View {
        NavigationStack {
            if recipesViewModel.meals.isEmpty {
                ProgressView()
            } else {
                RecipesListView()
                    .environmentObject(recipesViewModel)
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
