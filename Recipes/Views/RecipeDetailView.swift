//
//  RecipeDetailView.swift
//  Recipes
//
//  Created by Andrew Shon on 6/6/24.
//

import SwiftUI

struct RecipeDetailView: View {
    @EnvironmentObject var recipesViewModel: RecipesViewModel
    let meal: Meal
    @State private var mealDetail: MealDetail?

    var body: some View {
        ScrollView {
            if let mealDetail = mealDetail {
                AsyncImage(url: URL(string: meal.strMealThumb)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else if phase.error != nil {
                        Text("Failed to load image")
                    } else {
                        ProgressView()
                    }
                }
            } else {
                ProgressView()
            }
        }
        .task {
            do {
                mealDetail = try await recipesViewModel.getMealDetail(by: meal.id)
            } catch {
                print(error)
            }
        }
    }
}

//#Preview {
//    RecipeDetailView()
//}
