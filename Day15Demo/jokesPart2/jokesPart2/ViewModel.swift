//
//  ViewModel.swift
//  jokesPart2
//
//  Created by Luat on 1/29/21.
//

import Foundation

class ViewModel {
    
    private var model: Joke?
    var updateViewClosure: (() -> Void)?
    
    func getData() {
        let url = URL(string: "https://v2.jokeapi.dev/joke/Any?type=single")!
        let task = URLSession.shared.dataTask(with: url) { (data, res, e) in
            guard let data = data else { return }
            let decodedData = try? JSONDecoder().decode(Joke.self, from: data)
            DispatchQueue.main.async {
                self.model = decodedData
                self.updateViewClosure?()
            }
        }
        task.resume()
    }
    
    func punchLine() -> String {
        return model?.punchLine.uppercased() ?? ""
    }
    
}
