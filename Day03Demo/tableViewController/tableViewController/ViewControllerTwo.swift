//
//  ViewControllerTwo.swift
//  tableViewController
//
//  Created by Luat on 1/13/21.
//

import UIKit

class ViewControllerTwo: UIViewController {

    @IBOutlet weak var professionLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func configure(person: Person) {
        nameLabel.text = person.name
        professionLabel.text = person.profession
        
    }

}
