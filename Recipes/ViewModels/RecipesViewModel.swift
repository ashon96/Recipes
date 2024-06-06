//
//  RecipesViewModel.swift
//  Recipes
//
//  Created by Andrew Shon on 6/6/24.
//

import Foundation

class RecipesViewModel: ObservableObject {
    @Published var meals = [Meal]()
    
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    @MainActor
    func getMeals() async {
        do {
            let fetchedMeals = try await apiClient.sendRequest(
                endpoint: RecipesEndpoint.meals,
                responseModel: MealContainer<Meal>.self
            )
            meals = fetchedMeals.meals
        } catch {
            print(error)
        }
    }
    
    @MainActor
    func getMealDetail(by id: String) async throws -> MealDetail? {
        do {
            let fetchedMealDetail = try await apiClient.sendRequest(endpoint: RecipesEndpoint.mealDetail(id: id), responseModel: MealContainer<MealDetail>.self).meals.first
            return fetchedMealDetail
        } catch {
            print(error)
            return nil
        }
    }
}
