//
//  ViewController.swift
//  tvEpisodes
//
//  Created by RaveBizz on 1/15/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var episodeTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = episodeTable.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath) as! EpisodeCell
        cell.textLabel?.text = episodes[indexPath.row].name
        return cell
    }
    
    
    var episodes: [Episode] = [] {
        didSet {
            episodeTable.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        episodeTable.dataSource = self
        episodeTable.register(EpisodeCell.self, forCellReuseIdentifier: "episodeCell")
        episodeTable.register(UINib(nibName: "EpisodeCell", bundle: nil), forCellReuseIdentifier: "episodeCell")
        getFakeEpisodes()
//        getEpisodes()
    }
    
    func getFakeEpisodes() {
        let fakeImage = EpisodeImage(original: "http://static.tvmaze.com/uploads/images/original_untouched/1/2668.jpg")
        episodes = [
            Episode(name: "1 Pilot", summary: "good", image: fakeImage),
            Episode(name: "2 Good Episdoe", summary: "good", image: fakeImage),
            Episode(name: "3 Bad Episdoe", summary: "good", image: fakeImage),
            Episode(name: "4 Okay Episdoe", summary: "good", image: fakeImage),
            Episode(name: "1 Pilot", summary: "good", image: fakeImage),
            Episode(name: "2 Good Episdoe", summary: "good", image: fakeImage),
            Episode(name: "3 Bad Episdoe", summary: "good", image: fakeImage),
            Episode(name: "4 Okay Episdoe", summary: "good", image: fakeImage),
            Episode(name: "1 Pilot", summary: "good", image: fakeImage),
            Episode(name: "2 Good Episdoe", summary: "good", image: fakeImage),
            Episode(name: "3 Bad Episdoe", summary: "good", image: fakeImage),
            Episode(name: "4 Okay Episdoe", summary: "good", image: fakeImage),
            Episode(name: "1 Pilot", summary: "good", image: fakeImage),
            Episode(name: "2 Good Episdoe", summary: "good", image: fakeImage),
            Episode(name: "3 Bad Episdoe", summary: "good", image: fakeImage),
            Episode(name: "4 Okay Episdoe", summary: "good", image: fakeImage),
            Episode(name: "1 Pilot", summary: "good", image: fakeImage),
            Episode(name: "2 Good Episdoe", summary: "good", image: fakeImage),
            Episode(name: "3 Bad Episdoe", summary: "good", image: fakeImage),
            Episode(name: "4 Okay Episdoe", summary: "good", image: fakeImage),
            
            
        ]
    }

    func getEpisodes() {
        /**
        urlSession.shared.dataTask() {
        get data
         get decoder
        self.episodes =  decode.([Episode].self, from: data)
         
    }*/
        
    }

}




/**
 {
 "id":4953,
 "url":"http://www.tvmaze.com/episodes/4953/game-of-thrones-1x02-the-kingsroad",
 "name":"The Kingsroad",
 "season":1,
 "number":2,
 "type":"regular",
 "airdate":"2011-04-24",
 "airtime":"21:00",
 "airstamp":"2011-04-25T01:00:00+00:00",
 "runtime":60,
 "image":{
 "medium":"http://static.tvmaze.com/uploads/images/medium_landscape/1/2669.jpg",
 "original":"http://static.tvmaze.com/uploads/images/original_untouched/1/2669.jpg"
 },
 "summary":"<p>An incident on the Kingsroad threatens Eddard and Robert's friendship. Jon and Tyrion travel to the Wall, where they discover that the reality of the Night's Watch may not match the heroic image of it.</p>",
 "_links":{
 "self":{
 "href":"http://api.tvmaze.com/episodes/4953"
 }
 }
 },
 */
