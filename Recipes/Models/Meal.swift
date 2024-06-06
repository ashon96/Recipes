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

    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}

extension Meal: Comparable {
    static func < (lhs: Self, rhs: Self) -> Bool {
        return lhs.strMeal < rhs.strMeal
    }
}
