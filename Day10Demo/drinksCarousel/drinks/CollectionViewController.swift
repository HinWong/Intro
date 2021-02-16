//
//  CollectionViewController.swift
//  drinks
//
//  Created by Luat on 1/22/21.
//

import UIKit

class CollectionViewController: UICollectionViewController {

    var currentRowIndex: Int = 0
    
    @IBAction func minusBarButton(_ sender: Any) {
        if currentRowIndex > 0 {
            currentRowIndex -= 1
            collectionView.scrollToItem(at: IndexPath(item: currentRowIndex, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
    @IBAction func plusBarButton(_ sender: UIBarButtonItem) {
        if currentRowIndex < model?.drinks.count ?? 0 {
            currentRowIndex += 1
            collectionView.scrollToItem(at: IndexPath(item: currentRowIndex, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
    let linkString = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Gin"
    
    var model: Drinks? {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView?.register(UINib(nibName: CollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CollectionViewCell.identifier)
        getData()
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
        }
    }
    
    func getData() {
        print("downloading drinks list")
        guard let url = URL(string: linkString) else { return }
        
        // background queue
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print("Error request not successful")
                return
            }
            let decoder = JSONDecoder()
            // do - try - catch
            do {
                let decodedDrinks = try decoder.decode(Drinks.self, from: data)
                self.model = decodedDrinks
            } catch let error {
                print("Decoding unsuccessful", error)
            }
            
        }
        task.resume()
    }

}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model?.drinks.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        
//        cell.backgroundColor = UIColor(red: randColor(), green: randColor(), blue: randColor(), alpha: 1)
        cell.configure(drink: model?.drinks[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width, height: view.bounds.height * 0.8)
    }
    
    func randColor() -> CGFloat {
        return CGFloat.random(in: 0...1)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let detailsVC = storyboard?.instantiateViewController(identifier: "DetailsViewController") as? DetailsViewController else {
            return
        }
        detailsVC.configure(drink: model?.drinks[indexPath.row])
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        currentRowIndex = collectionView.indexPathsForVisibleItems.last?.row ?? 0
        print(currentRowIndex)
    }
}
