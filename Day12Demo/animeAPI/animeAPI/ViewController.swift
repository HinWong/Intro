//
//  ViewController.swift
//  animeAPI
//
//  Created by Luat on 1/25/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var episodesTableView: UITableView!
    @IBOutlet weak var animeCollectionView: UICollectionView!
    
    var helper = Helper()
    var animeTopLevel: AnimeTopLevel? {
        didSet {
            DispatchQueue.main.async {
                self.animeCollectionView.reloadData()
            }
        }
    }
    
    var episodesList: AnimeTopLevel? {
        didSet {
            DispatchQueue.main.async {
                self.episodesTableView.reloadData()
            }
        }
    }
    
    static let linkString = "https://kitsu.io/api/edge/anime?sort=-averageRating"
    
    static let id = String(describing: ViewController.self)
    override func viewDidLoad() {
        super.viewDidLoad()
        animeCollectionView.dataSource = self
        animeCollectionView.delegate = self
        animeCollectionView.register(UINib(nibName: "AnimeCell", bundle: nil), forCellWithReuseIdentifier: "AnimeCell")
        
        if let flowLayout = animeCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
        }
        
        episodesTableView.dataSource = self
        episodesTableView.register(UINib(nibName: EpisodeCell.id, bundle: nil), forCellReuseIdentifier: EpisodeCell.id)
        
        
        getData()

    }
    
    func getData() {
        helper.getData(link: ViewController.linkString) { (resultAnimeTopLevel) in
            self.animeTopLevel = resultAnimeTopLevel
        }
    }


}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return animeTopLevel?.animes.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let aniCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnimeCell", for: indexPath) as? AnimeCell else { return UICollectionViewCell()
            
        }
        aniCell.configure(anime: animeTopLevel?.animes[indexPath.row])
        return aniCell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentAnime = animeTopLevel?.animes[indexPath.row]
        
        let animeDetailsLink = currentAnime?.links.detailLink ?? ""
        let episodesLink = animeDetailsLink + "/episodes"
        print(episodesLink)
        helper.getData(link: episodesLink) { (decodedEpisodeTopArray) in
//            print(decodedEpisodeTopArray.animes[0].attributes?.canonicalTitle)
            self.episodesList = decodedEpisodeTopArray
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 400, height: 400)
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        episodesList?.animes.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let epiCell = tableView.dequeueReusableCell(withIdentifier: EpisodeCell.id, for: indexPath) as? EpisodeCell else { return UITableViewCell()
            
        }
        epiCell.episodeAnime = episodesList?.animes[indexPath.row]
//        print(epiCell.episodeAnime?.attributes?.canonicalTitle)
        return epiCell
    }
    
}
