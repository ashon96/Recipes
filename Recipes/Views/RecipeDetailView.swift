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
                VStack(spacing: 20) {
                    RecipeImageView(imageLink: meal.strMealThumb)
                    VStack {
                        Text("Ingredients")
                            .font(.title)
                        ForEach(mealDetail.ingredientsList, id: \.self) { item in
                            Text(item)
                        }
                    }
                    
                    VStack {
                        Text("Instructions")
                            .font(.title)
                        Text(mealDetail.strInstructions)
                            .padding(.horizontal, 10)
                    }
                }
                
            } else {
                ProgressView()
            }
        }
        .navigationTitle(meal.strMeal)
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
