//
//  NetworkManager.swift
//  URLSessionApp
//
//  Created by Aleksandr Rybachev on 08.04.2022.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

struct NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(from url: String?, with completion: @escaping(Drink) -> Void) {
        guard let url = URL(string: url ?? "") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let drinks = try JSONDecoder().decode(Drink.self, from: data)
                DispatchQueue.main.async {
                    completion(drinks)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
     
    func fetchImage(from url: String?, with completion: @escaping(Data) -> Void) {
        guard let stringURL = url else { return }
        guard let imageURL = URL(string: stringURL) else { return }
        
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: imageURL) else { return }
            DispatchQueue.main.async {
                completion(data)
            }
        }
    }
}
