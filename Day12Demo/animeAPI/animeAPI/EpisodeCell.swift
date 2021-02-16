//
//  EpisodeCell.swift
//  animeAPI
//
//  Created by Luat on 1/26/21.
//

import UIKit

class EpisodeCell: UITableViewCell {
    
    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    static let id = String(describing: EpisodeCell.self)

    var episodeAnime: Anime? {
        didSet {
            updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI() {
        nameLabel.text = episodeAnime?.attributes?.canonicalTitle
        let descript = episodeAnime?.attributes?.description ?? ""
        let firstPeriodIndex = descript.firstIndex(of: ".")
        let array = descript.split(separator: ".")
        let truncatedDescript = array.first ?? ""
        detailsLabel.text = String(truncatedDescript)
        getImage()
    }
    
    func getImage() {
        guard let url = URL(string: episodeAnime?.attributes?.thumbnail?.original ?? "") else { return }
        ImageSingleton.shared.getImage(with: url) { (img) in
            self.episodeImageView.image = img
        }
    }
    
}
