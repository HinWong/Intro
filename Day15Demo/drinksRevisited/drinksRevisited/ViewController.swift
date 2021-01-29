//
//  ViewController.swift
//  drinksRevisited
//
//  Created by Luat on 1/29/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: DrinkDetailCell.identifier, bundle: nil), forCellWithReuseIdentifier: DrinkDetailCell.identifier)
        getData()
        setupVMClosure()
    }

    func getData() {
        viewModel.downloadDrinks()
    }
    
    func setupVMClosure() {
        viewModel.updateViewClosure = {
            self.collectionView.reloadData()
        }
    }

}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numItems ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DrinkDetailCell.identifier, for: indexPath) as? DrinkDetailCell else { return UICollectionViewCell() }
        let cellViewModel = viewModel.dataVM?[indexPath.row]
        cell.bind(viewModel: cellViewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
    
}
