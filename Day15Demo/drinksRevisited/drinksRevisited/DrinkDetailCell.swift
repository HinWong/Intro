//
//  DrinkDetailCell.swift
//  drinksRevisited
//
//  Created by Luat on 1/29/21.
//

import UIKit

class DrinkDetailCell: UICollectionViewCell {

    static let identifier = String(describing: DrinkDetailCell.self)
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var drinkImageView: UIImageView!
    
    var viewModel: CellViewModel? {
        didSet {
            nameLabel.text = viewModel?.drinkName()
            getImage()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func bind(viewModel: CellViewModel?) {
        self.viewModel = viewModel
    }
    
    func getImage() {
        guard let url = viewModel?.imageURL() else { return }
        ImageSingleton.shared.getImage(with: url) { image in
            self.drinkImageView.image = image
        }
    }
}
