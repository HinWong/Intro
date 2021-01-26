//
//  CollectionViewCell.swift
//  drinks
//
//  Created by Luat on 1/22/21.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let identifier = "CollectionViewCell"
    
    @IBOutlet weak var drinkName: UILabel!
    @IBOutlet weak var drinksStackView: UIStackView!
    @IBAction func expandButton(_ sender: UIButton) {
        drinksStackView.isHidden = !drinksStackView.isHidden
    }
    
    @IBOutlet weak var drinkImage: UIImageView!
    var drink: Drink? {
        didSet {
            drinkName.text = drink?.drinkName
            getImage()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(drink: Drink?) {
        self.drink = drink
    }
    func getImage() {
        let imageLink = drink?.thumbnail ?? ""
        guard let url = URL(string: imageLink) else { return }
        ImageSingleton.shared.getImage(with: url, updateImageClosure: { image in
            self.drinkImage.image = image
        })
    
    }
}
