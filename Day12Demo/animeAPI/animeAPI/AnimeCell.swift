//
//  AnimeCell.swift
//  animeAPI
//
//  Created by Luat on 1/26/21.
//

import UIKit

class AnimeCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var animeImageView: UIImageView!
    var anime: Anime? {
        didSet {
            guard let url = URL(string: anime?.attributes?.posterImage?.original ?? "") else { return }
            ImageSingleton.shared.getImage(with: url) { (img) in
                self.animeImageView.image = img
                self.titleLabel.text = self.anime?.attributes?.titles.en
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func configure(anime: Anime?) {
        self.anime = anime
    }

}
