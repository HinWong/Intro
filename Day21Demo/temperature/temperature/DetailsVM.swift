//
//  DetailsVM.swift
//  temperature
//
//  Created by Luat on 2/8/21.
//

import Foundation

class TempDetailsVM {
    var temp: Double
    var scale: TempScale
    
    init(temp: Double, scale: TempScale) {
        self.temp = temp
        self.scale = scale
    }
    
    func formatText() -> String {
        return String(temp) + " " + scale.rawValue
    }
    
    func convertToCelcius() {
        
    }
}
