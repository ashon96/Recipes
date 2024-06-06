//
//  MealContainer.swift
//  Recipes
//
//  Created by Andrew Shon on 6/6/24.
//

import Foundation

struct MealContainer<T: Codable>: Codable {
    let meals: [T]
}
