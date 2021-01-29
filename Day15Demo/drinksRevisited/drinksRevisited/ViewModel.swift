//
//  ViewModel.swift
//  drinksRevisited
//
//  Created by Luat on 1/29/21.
//

import Foundation

class ViewModel {
    var numItems: Int? {
        dataVM?.count
    }
    var dataVM: [CellViewModel]? {
        didSet {
            DispatchQueue.main.async {
                self.updateViewClosure?()                
            }
        }
    }
    var linkString = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Gin"
    var updateViewClosure: (() -> Void)?
    
    func downloadDrinks() {
        print("downloading drinks list")
        guard let url = URL(string: linkString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print("Error request not successful")
                return
            }
            let decoder = JSONDecoder()
            do {
                let decodedDrinks = try decoder.decode(Drinks.self, from: data)
                self.updateDataVM(decodedModel: decodedDrinks)
            } catch let error {
                print("Decoding unsuccessful", error)
            }
            
        }
        task.resume()
    }
    
    func updateDataVM(decodedModel: Drinks) {
        dataVM = decodedModel.drinks.map { drink in
            let cellVM = CellViewModel(drink: drink)
            return cellVM
        }
    }
}
