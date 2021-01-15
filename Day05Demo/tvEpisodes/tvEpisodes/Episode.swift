//
//  Episode.swift
//  tvEpisodes
//
//  Created by RaveBizz on 1/15/21.
//

import Foundation

struct Episode: Decodable {
    let name: String
    let summary: String
    let image: EpisodeImage
}
struct EpisodeImage: Decodable {
    let original: String
}
/**
 "image":{
 "medium":"http://static.tvmaze.com/uploads/images/medium_landscape/1/2669.jpg",
 "original":"http://static.tvmaze.com/uploads/images/original_untouched/1/2669.jpg"
 },
 */
