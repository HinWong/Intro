//
//  CollectionViewController.swift
//  drinks
//
//  Created by Luat on 1/22/21.
//

import UIKit

class CollectionViewController: UICollectionViewController {

    @IBOutlet weak var plusButton: UIBarButtonItem!
    
    @IBAction func plusButtonPressed(_ sender: Any) {
        currentRowPosition += 1
        collectionView.scrollToItem(at: IndexPath(row: currentRowPosition, section: 0), at: .centeredHorizontally, animated: true)
    }
    let linkString = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Gin"
    var currentRowPosition = 0
    
    var model: Drinks? {
        didSet {
            DispatchQueue.main.async {
                self.getAllImages()
                self.collectionView.reloadData()
            }
        }
    }
    
    var imageCache = NSCache<NSString, UIImage>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView?.register(UINib(nibName: CollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: CollectionViewCell.reuseIdentifier)
        
        if let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        }
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
    
    func getAllImages() {
        guard let drinks = model?.drinks else {
            return
        }
        for drink in drinks {
            let imageLink = drink.strDrinkThumb
            guard let url = URL(string: imageLink) else { return }
            DispatchQueue.global(qos: .userInitiated).async {
                guard let data = try? Data(contentsOf: url) else { return }
                let image = UIImage(data: data)
                self.imageCache.setObject(image!, forKey: imageLink as NSString)
            }
        }
    }

}















extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model?.drinks.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        //        cell.backgroundColor = UIColor(red: randColor(), green: randColor(), blue: randColor(), alpha: 1)
        let drink = model?.drinks[indexPath.row]
        if let thumb = drink?.strDrinkThumb {
            let cellImage: UIImage? = imageCache.object(forKey: thumb as NSString)
            cell.configure(drink: drink, withImage: cellImage)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width, height: view.bounds.height * 0.8)
    }
    
    func randColor() -> CGFloat {
        return CGFloat.random(in: 0...255) / 255
    }
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        currentRowPosition = collectionView.indexPathsForVisibleItems.last?.row ?? 0
    }
    
}
