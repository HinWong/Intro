//
//  Anime.swift
//  animeAPI
//
//  Created by Luat on 1/26/21.
//

import Foundation


struct AnimeTopLevel: Decodable {
    enum CodingKeys: String, CodingKey {
        case animes = "data"
    }
    let animes: [Anime]
}

struct AnimeTopLevelWithObject: Decodable {
    enum CodingKeys: String, CodingKey {
        case animes = "data"
    }
    let animes: Anime
}

struct Anime: Decodable {
    let id: String
    let links: Anime.Link
    let attributes: Attribute?
    let relationships: Relationship
    struct Link: Decodable {
        enum CodingKeys: String, CodingKey {
            case detailLink = "self"
        }
        let detailLink: String
    }
}

struct Attribute: Decodable {
    let slug: String?
    let synopsis: String
    let description: String
    let titles: Attribute.Title
    let posterImage: PosterImage?
    let canonicalTitle: String?
    let thumbnail: Thumbnail?
    struct Title: Decodable {
        let en: String?
        let en_jp: String?
    }
    
    struct PosterImage: Decodable {
        let original: String
    }
    
    struct Thumbnail: Decodable {
        let original: String
    }

}

struct Relationship: Decodable {
    let episodes: Episode?
    
    struct Episode: Decodable {
        let links: Link
        
        struct Link: Decodable {
            let related: String
        }
    }
}
