//
//  ViewController.swift
//  temperature
//
//  Created by Luat on 1/11/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var degrees: UILabel!
    @IBAction func farenheitPressed(_ sender: Any) {
        if currentScale == .Celcius {
            currentScale = .Farenheit
            let currentTemp = Double(degrees.text!.dropLast(2))!
            let tempInFarenheit = (currentTemp * 9 / 5) + 32
            temperature = roundToNearest(num: tempInFarenheit, nthMag: 1000)
        }
    }
    @IBAction func celciusPressed(_ sender: UIButton) {
        if currentScale == .Farenheit {
            currentScale = .Celcius
            let currentTemp = Double(degrees.text!.dropLast(2))!
            let tempInCelcius = (currentTemp - 32) * 5 / 9
            temperature = roundToNearest(num: tempInCelcius, nthMag: 10)
        }
    }
    @IBAction func plusButtonPressed(_ sender: Any) {
        temperature = addSubtract(string: degrees.text?.dropLast(2), value: 1)
    }
    
    @IBAction func minusButtonPressed(_ sender: Any) {
        temperature = addSubtract(string: degrees.text?.dropLast(2), value: -1)
    }
    
    private func addSubtract(string: Substring?, value: Double) -> Double {
        if let stringUnwrapped = string, let num = Double(stringUnwrapped) {
            return num + value
        } else {
            return 0
        }
    }
    
    /// computed property
    var temperature: Double {
        get {
            Double(degrees.text!)!
        }
        set (newValue) {
            let rounded = roundToNearest(num: newValue, nthMag: 100000)
            degrees.text = String(rounded) + symbol
        }
    }
//    print(temperature)
//    print(Double(degrees.text!)!)
//    temperature += 1
    
    /// property Observer
    var currentScale: TemperatureScale = .Farenheit {
        didSet {
            switch currentScale {
            case .Celcius:
                symbol = "°C"
            case .Farenheit:
                symbol = "°F"
            case .Kelvin:
                symbol = "°K"
            }
            
//            if currentScale == TemperatureScale.Celcius {
//                symbol = "°C"
//            } else if currentScale == TemperatureScale.Farenheit {
//                symbol = "°F"
//            } else if currentScale == TemperatureScale.Kelvin {
//                symbol = "°K"
//            }
        }
    }
    
    var symbol: String = "°F"
    
    private func roundToNearest(num: Double, nthMag: Double) -> Double {
        return round(num * nthMag)/nthMag
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

enum TemperatureScale {
    case Celcius
    case Farenheit
    case Kelvin
}

enum Anime {
    case Naruto
    case Bleach
}
//let newAn = Anime.Bleach
//if newAn == .Naruto {
//
//}
//
//switch newAn {
//case .Bleach:
//    print("asdf")
//case .Naruto:
//    print("qwer")
//}












