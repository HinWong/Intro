//
//  EpisodeCell.swift
//  tvEpisodes
//
//  Created by RaveBizz on 1/15/21.
//

import UIKit

class EpisodeCell: UITableViewCell {

    var episode: Episode?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(episode: Episode) {
        // label.ttext = episode.name
    }
    
}
