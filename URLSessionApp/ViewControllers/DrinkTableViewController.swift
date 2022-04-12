//
//  DrinkTableViewController.swift
//  URLSessionApp
//
//  Created by Aleksandr Rybachev on 08.04.2022.
//

import UIKit

class DrinkTableViewController: UITableViewController {
    
    private var drinks = Drink(drinks: [Coctail]())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
        //        fetchImage()
    }
}

// MARK: UITableViewDataSource
extension DrinkTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        drinks.drinks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.text = drinks.drinks[indexPath.row].strDrink
        content.secondaryText = drinks.drinks[indexPath.row].strInstructions
        
//        if let url = URL(string: drinks.drinks[indexPath.row].strDrinkThumb ?? "") {
//            URLSession.shared.dataTask(with: url) { data, _, error in
//                guard let data = data else {
//                    print(error?.localizedDescription)
//                    return
//                }
//
//                DispatchQueue.main.async {
//                    content.image = UIImage(data: data)
//                }
//            }.resume()
//        }
        
        cell.contentConfiguration = content
        
        return cell
    }
}

// MARK: - Network Data
extension DrinkTableViewController {
    
    private func fetchData() {
        guard let url = URL(string: NetworkManager.url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print("error?.localizedDescription:\n \(error?.localizedDescription)\n")
                return
            }
            
            do {
                self.drinks = try JSONDecoder().decode(Drink.self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    print("self.drinks:\n \(self.drinks)\n")
                }
            } catch let error {
                print("error.localizedDescription \(error.localizedDescription)\n")
            }
        }.resume()
    }
}



//extension DrinkTableViewController {
//    private func fetchImage(_ indexPath: IndexPath) {
//        guard let image = URL(string: drinks.drinks[indexPath.row].strDrinkThumb ?? "") else { return }
//
//        URLSession.shared.dataTask(with: image) { data, _, error in
//            guard let data = data else {
//                print(error?.localizedDescription)
//                return
//            }
//
//            DispatchQueue.main.async {
//                content.image = UIImage(data: data)
//            }
//        }.resume()
//    }
//}

