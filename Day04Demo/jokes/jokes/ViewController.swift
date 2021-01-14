//
//  ViewController.swift
//  jokes
//
//  Created by RaveBizz on 1/14/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var jokeLabel: UILabel!
    var currentJoke: Joke? {
        didSet {
            DispatchQueue.main.async {
                self.jokeLabel.text = self.currentJoke?.joke
            }
        }
    }
    
    @IBAction func refreshJoke(_ sender: Any) {
        getJoke()
    }
    let urlString = "https://v2.jokeapi.dev/joke/Any?type=single"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getJoke() {
        if let url = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    print("data from url:", data)
                    let decoder = JSONDecoder()
                    let joke = try? decoder.decode(Joke.self, from: data)
                    self.currentJoke = joke
                }
            }
            task.resume()
            
        }
    }

}


struct Joke: Decodable {
    let id: Int
    let category: String
    let joke: String?
    let notAnything: String?
    
}

/**
Single part joke
{
    "error": false,
    "category": "Programming",
    "type": "single",
    "joke": "\"Can I tell you a TCP joke?\"\n\"Please tell me a TCP joke.\"\n\"OK, I'll tell you a TCP joke.\"",
    "flags": {
        "nsfw": false,
        "religious": false,
        "political": false,
        "racist": false,
        "sexist": false,
        "explicit": false
    },
    "id": 57,
    "safe": true,
    "lang": "en"
}
 */
/**
 Two part joke
{
    "error": false,
    "category": "Misc",
    "type": "twopart",
    "setup": "I told my wife to shave her pussy.",
    "delivery": "I woke up bald.",
    "flags": {
        "nsfw": true,
        "religious": false,
        "political": false,
        "racist": false,
        "sexist": false,
        "explicit": true
    },
    "id": 187,
    "safe": false,
    "lang": "en"
}
 */
