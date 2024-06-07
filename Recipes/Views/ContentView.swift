//
//  ContentView.swift
//  Recipes
//
//  Created by Andrew Shon on 6/6/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var recipesViewModel: RecipesViewModel
    
    init(apiClient: APIClient) {
        _recipesViewModel = StateObject(wrappedValue: RecipesViewModel(apiClient: apiClient))
    }

    var body: some View {
        NavigationStack {
            if recipesViewModel.meals.isEmpty {
                ProgressView()
            } else {
                RecipesListView<RecipesViewModel>()
            }
        }
        .task {
            await recipesViewModel.getMeals()
        }
        .environmentObject(recipesViewModel)
    }
}

#Preview {
    ContentView(
        apiClient: MockAPIClient()
    )
}
