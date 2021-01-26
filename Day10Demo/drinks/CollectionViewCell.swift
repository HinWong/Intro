//
//  CollectionViewCell.swift
//  drinks
//
//  Created by Luat on 1/22/21.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "CollectionViewCell"

    @IBOutlet weak var drinkName: UILabel!
    
    @IBOutlet weak var drinkImage: UIImageView!
    var drink: Drink? {
        didSet {
            drinkName.text = drink?.strDrink
        }
    }
    
    var image: UIImage? {
        didSet {
            drinkImage.image = image
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(drink: Drink?, withImage: UIImage?) {
        self.drink = drink
        self.image = withImage
    }
//    func getImage() {
//        drinkImage.image = image
//        let imageLink = drink?.strDrinkThumb ?? ""
//        guard let url = URL(string: imageLink) else { return }
//        DispatchQueue.global(qos: .userInitiated).async {
//            guard let data = try? Data(contentsOf: url) else { return }
//            let image = UIImage(data: data)
//            DispatchQueue.main.async {
//                self.drinkImage.image = image
//            }
//
//        }
//    }
}
