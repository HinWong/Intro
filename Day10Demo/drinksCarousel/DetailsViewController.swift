//
//  DetailsViewController.swift
//  drinks
//
//  Created by Luat on 1/22/21.
//

import UIKit

class DetailsViewController: UIViewController {

    static var detailLink = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i="
    
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    
    @IBOutlet weak var labelThree: UILabel!
    
    @IBOutlet weak var labelFour: UILabel!
    @IBOutlet weak var topImageView: UIImageView!
    
    var drink: Drink? {
        didSet {
            DispatchQueue.main.async {
                self.updateLabels()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getImageData()
        getIngDetails()
        updateLabels()
    }
    
    func configure(drink: Drink?) {
        self.drink = drink
    }
    
    func getImageData() {
        
        let imageLink = drink?.thumbnail ?? ""
        guard let imageUrl = URL(string: imageLink) else { return }
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: imageUrl) else { return }
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                if self.topImageView != nil {
                    self.topImageView.image = image
                }
            }
        }
    }
    
    func getIngDetails() {
        let idLink = DetailsViewController.detailLink + (drink?.idDrink ?? "")
        guard let detailsURL = URL(string: idLink) else { return }
            let task = URLSession.shared.dataTask(with: detailsURL) { (data, response, error) in
                guard let data = data else {
                    print("Error request not successful")
                    return
                }
                let decoder = JSONDecoder()
                // do - try - catch
                do {
                    let decodedDrinks = try decoder.decode(Drinks.self, from: data)
                    self.drink = decodedDrinks.drinks.first
                } catch let error {
                    print("Decoding unsuccessful", error)
                }
                
            }
            task.resume()
    }
    
    func updateLabels() {
        labelOne?.text = drink?.drinkName
        labelTwo?.text = (drink?.strIngredient1 ?? "") + ": " + (drink?.strMeasure1 ?? "")
        labelThree?.text = (drink?.strIngredient2 ?? "") + ": " + (drink?.strMeasure2 ?? "")
        labelFour?.text = drink?.strInstructions
    }
}

//
//{
//    "drinks": [
//    {
//    "idDrink": "15300",
//    "strDrink": "3-Mile Long Island Iced Tea",
//    "strDrinkAlternate": null,
//    "strDrinkES": null,
//    "strDrinkDE": null,
//    "strDrinkFR": null,
//    "strDrinkZH-HANS": null,
//    "strDrinkZH-HANT": null,
//    "strTags": null,
//    "strVideo": null,
//    "strCategory": "Ordinary Drink",
//    "strIBA": null,
//    "strAlcoholic": "Alcoholic",
//    "strGlass": "Collins Glass",
//    "strInstructions": "Fill 14oz glass with ice and alcohol. Fill 2/3 glass with cola and remainder with sweet & sour. Top with dash of bitters and lemon wedge.",
//    "strInstructionsES": null,
//    "strInstructionsDE": "Füllen Sie ein 12 cl. Glas mit Eis und Alkohol. Füllen Sie 2/3 des Glases mit Cola und den Rest mit Süß-Sauer. Mit einem Schuss Bitter und Zitronenkeil garnieren.",
//    "strInstructionsFR": null,
//    "strInstructionsZH-HANS": null,
//    "strInstructionsZH-HANT": null,
//    "strDrinkThumb": "https://www.thecocktaildb.com/images/media/drink/rrtssw1472668972.jpg",
//    "strIngredient1": "Gin",
//    "strIngredient2": "Light rum",
//    "strIngredient3": "Tequila",
//    "strIngredient4": "Triple sec",
//    "strIngredient5": "Vodka",
//    "strIngredient6": "Coca-Cola",
//    "strIngredient7": "Sweet and sour",
//    "strIngredient8": "Bitters",
//    "strIngredient9": "Lemon",
//    "strIngredient10": null,
//    "strIngredient11": null,
//    "strIngredient12": null,
//    "strIngredient13": null,
//    "strIngredient14": null,
//    "strIngredient15": null,
//    "strMeasure1": "1/2 oz",
//    "strMeasure2": "1/2 oz",
//    "strMeasure3": "1/2 oz",
//    "strMeasure4": "1/2 oz",
//    "strMeasure5": "1/2 oz",
//    "strMeasure6": "1/2 oz",
//    "strMeasure7": "1-2 dash ",
//    "strMeasure8": "1 wedge ",
//    "strMeasure9": "Garnish with",
//    "strMeasure10": null,
//    "strMeasure11": null,
//    "strMeasure12": null,
//    "strMeasure13": null,
//    "strMeasure14": null,
//    "strMeasure15": null,
//    "strImageSource": null,
//    "strImageAttribution": null,
//    "strCreativeCommonsConfirmed": "No",
//    "dateModified": "2016-08-31 19:42:52"
//    }
//    ]
//}
