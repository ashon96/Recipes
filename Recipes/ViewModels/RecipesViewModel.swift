//
//  RecipesViewModel.swift
//  Recipes
//
//  Created by Andrew Shon on 6/6/24.
//

import Foundation

protocol RecipesService: ObservableObject {
    var meals: [Meal] { get }
    func getMeals() async
    func getMealDetail(by id: String) async throws -> MealDetail?
}

class RecipesViewModel: RecipesService {
    @Published private(set) var meals = [Meal]()
    
    private let apiClient: APIClient
    
    init(apiClient: APIClient = NetworkClient()) {
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

class MockRecipesViewModel: RecipesService {
    
    var meals: [Meal] = [
        Meal(strMeal: "test 1", strMealThumb: "image 1", idMeal: "1"),
        Meal(strMeal: "test 2", strMealThumb: "image 2", idMeal: "2")
    ]
    
    func getMeals() async {
        print("getting meals")
    }
    
    func getMealDetail(by id: String) async throws -> MealDetail? {
        return nil
    }
    
    
}
