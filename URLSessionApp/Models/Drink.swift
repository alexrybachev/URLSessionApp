//
//  Drink.swift
//  URLSessionApp
//
//  Created by Aleksandr Rybachev on 08.04.2022.
//

struct Drink: Decodable {
    let drinks: [Coctail]
}

struct Coctail: Decodable {
    let idDrink: String?
    let strDrink: String?
    let strCategory: String?
    let strAlcoholic: String?
    let strGlass: String?
    let strInstructions: String?
    let strDrinkThumb: String?
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strImageSource: String?
    let strImageAttribution: String?
    let strCreativeCommonsConfirmed: String?
    
    var ingredients: String? {
        """
        Ingredients:
        - \(strMeasure1 ?? "") \(strIngredient1 ?? "")
        - \(strMeasure2 ?? "") \(strIngredient2 ?? "")
        - \(strMeasure3 ?? "") \(strIngredient3 ?? "")
        - \(strMeasure4 ?? "") \(strIngredient4 ?? "")
        - \(strMeasure5 ?? "") \(strIngredient5 ?? "")
        """
    }
}

enum Link: String {
    case coctailsAPI = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a"
}
