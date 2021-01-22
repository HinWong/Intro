//
//  CollectionViewController.swift
//  drinks
//
//  Created by Luat on 1/22/21.
//

import UIKit

private let reuseIdentifier = "CollectionViewCell"

class CollectionViewController: UICollectionViewController {

    
    let linkString = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Gin"
    
    var model: Drinks? {
        didSet {
            print(model)
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView?.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        getData()

    }
    
    func getData() {
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        
//        cell.backgroundColor = UIColor(red: randColor(), green: randColor(), blue: randColor(), alpha: 1)
        cell.configure(drink: model?.drinks[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 200)
    }
    
    func randColor() -> CGFloat {
        return CGFloat.random(in: 0...255) / 255
    }
}
