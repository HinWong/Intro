//
//  WebService.swift
//  animeAPI
//
//  Created by Luat on 1/26/21.
//

import Foundation

struct Helper {
    
    func getData(link: String, updateDataClosure: @escaping (AnimeTopLevel) -> () ) {
        guard let urlLink = URL(string: link) else { return }
        let task = URLSession.shared.dataTask(with: urlLink) { (data, response, error) in
            guard let data = data, error == nil else {
                print(error)
                return
            }
            
            let decoder = JSONDecoder()
            do {
                
                let decodedAnimeTopLevel = try decoder.decode(AnimeTopLevel.self, from: data)
                updateDataClosure(decodedAnimeTopLevel)
            } catch {
                print(error)
            }
        }
        task.resume()
        
    }
    
    func getDetailsData(link: String, updateDataClosure: @escaping (AnimeTopLevelWithObject) -> () ) {
        guard let urlLink = URL(string: link) else { return }
        let task = URLSession.shared.dataTask(with: urlLink) { (data, response, error) in
            guard let data = data, error == nil else {
                print(error)
                return
            }
            
            let decoder = JSONDecoder()
            do {
                
                let decodedAnimeWithObject = try decoder.decode(AnimeTopLevelWithObject.self, from: data)
                updateDataClosure(decodedAnimeWithObject)
            } catch {
                print(error)
            }
        }
        task.resume()
        
    }
    
}
