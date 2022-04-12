//
//  CoctailViewController.swift
//  URLSessionApp
//
//  Created by Aleksandr Rybachev on 12.04.2022.
//

import UIKit

class CoctailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet var coctailImageView: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var ingredientLabel: UILabel!
    
    var coctail: Coctail?
    
    // MARK: - View Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = coctail?.strDrink
        descriptionLabel.text = coctail?.strInstructions
        ingredientLabel.text = coctail?.ingredients
        fetchImage(from: coctail?.strDrinkThumb)
    }
    
    // MARK: - Private Methods
    private func fetchImage(from image: String?) {
        NetworkManager.shared.fetchImage(from: image) { imageData in
            self.coctailImageView.image = UIImage(data: imageData)
        }
    }
}
