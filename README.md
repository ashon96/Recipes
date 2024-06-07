# Recipes

This product is a SwiftUI application based on the Model-View-ViewModel architecture. This was chosen in order to enforce separation of concerns. Instead of lumping logic, view and delegation code in one place, to separate out these domains to separate pieces allow for greater testability, more straight-forward debugging, and easier navigation and identification of which domains perform what functions. 

These are the main folders that the codebase is structured into:

## Models
Models describe all of the database object objects that are transformed into application-facing models, that interface seamlessly with our application code. This allows for enforcing contracts between the application side and server side in terms of what data is returned back and we hold the flexibility to shape that data in a way that creates flexibility in our application.

## Network
Implementing async/await, the Network folder promotes modularity in terms of creating protocols for endpoints and APIClient code that would reduce boiler plate and allow flexibility for future clients and endpoints to be implemented with minimal efforts. This also allows for us to perform dependency injection, switching out our production implementations with mock test pieces, which increases testability and allows for easier enhacmenets if a new client or endpoint needs to be switched out in favor of a more efficient one

## ViewModels
The RecipesViewModel is what acts as a delegator, receiving actions from networking and view code and then producing the corresponding results back out into the views. It also allows for data (such as the meals list to persists throughout the lifecycle of the app) and for modularization purposes, creates the separation between itself and the views

## View
This group contains all of the implementations for the user interfaces. It is hooked up with the main view model and under a tree hierarchy, at the top level, the view model is injected and any child subviews can access the data provided by the RecipesViewModel to use what is necessary for its given components