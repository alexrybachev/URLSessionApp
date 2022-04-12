//
//  NetworkManager.swift
//  URLSessionApp
//
//  Created by Aleksandr Rybachev on 08.04.2022.
//

import Foundation

struct NetworkManager {
    
    static let url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a"
    
    static func fetchData() {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription)
                return
            }
            
            do {
                let drinks = try JSONDecoder().decode(Drink.self, from: data)
            } catch let error {
                print(error.localizedDescription)
            }

        }
    }
//     
//    func fetchData() {
//        guard let url = URL(string: url) else { return }
//        
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data else {
//                print(error?.localizedDescription)
//                return
//            }
//            
//            do {
//                self.drinks = try JSONDecoder().decode(Drink.self, from: data)
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                    print("self.drinks:\n \(self.drinks)\n")
//                }
//            } catch let error {
//                print("error.localizedDescription \(error.localizedDescription)\n")
//            }
//        }.resume()
//    }
    
}
