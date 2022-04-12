//
//  CoctailCell.swift
//  URLSessionApp
//
//  Created by Aleksandr Rybachev on 12.04.2022.
//

import UIKit

class CoctailCell: UICollectionViewCell {


    // MARK: - Outlet
    @IBOutlet var drinkImageView: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Configure Cell
    func configureCell(with image: String?) {
        NetworkManager.shared.fetchImage(from: image) { imageData in
            self.drinkImageView.image = UIImage(data: imageData)
            self.activityIndicator.hidesWhenStopped = true
        }
    }
}
