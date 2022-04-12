//
//  DrinksViewController.swift
//  URLSessionApp
//
//  Created by Aleksandr Rybachev on 12.04.2022.
//

import UIKit

class DrinksViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet var collectionView: UICollectionView!
    
    // MARK: - Private Properties
    private var drinks: Drink?
//    private var spinnerView = UIActivityIndicatorView()
    
    // MARK: - View Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData(from: Link.coctailsAPI.rawValue)

        collectionView.register(UINib(nibName: "CoctailCell", bundle: nil), forCellWithReuseIdentifier: "CoctailCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let coctailVC = segue.destination as? CoctailViewController else { return }
        coctailVC.coctail = sender as? Coctail
    }
    
    // MARK: - Private Methods
    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchData(from: url) { drink in
            self.drinks = drink
            self.collectionView.reloadData()
        }
    }
}

// MARK: - UICollectionViewDataSource
extension DrinksViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        drinks?.drinks.count ?? 0
//        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoctailCell", for: indexPath) as! CoctailCell
        cell.configureCell(with: drinks?.drinks[indexPath.item].strDrinkThumb)
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension DrinksViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = drinks?.drinks[indexPath.item]
        performSegue(withIdentifier: "showCoctail", sender: cell)
    }
    
}

// MARK: - UICollectionViewFlowLayout
extension DrinksViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = UIScreen.main.bounds.width / 2 - 10
        return CGSize(width: cellSize, height: cellSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
}
