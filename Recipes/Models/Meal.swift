//
//  Meal.swift
//  Recipes
//
//  Created by Andrew Shon on 6/6/24.
//

import Foundation

struct Meal: Codable, Identifiable {
    var id: String {
        idMeal
    }

    var strMeal: String
    var strMealThumb: String
    var idMeal: String
}
