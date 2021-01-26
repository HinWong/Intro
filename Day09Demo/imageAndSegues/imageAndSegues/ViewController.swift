//
//  ViewController.swift
//  imageAndSegues
//
//  Created by Luat on 1/21/21.
//

import UIKit

//struct MyStruct {
//    var delegate: UIViewController?
//    var datasource: UIViewController?
//}
//var myStruct = MyStruct()
//myStruct.delegate = self
//myStruct.datasource = self

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let imgURLDictionary = [
        "first" : "http://static.tvmaze.com/uploads/images/medium_landscape/1/2668.jpg",
        "second" : "http://static.tvmaze.com/uploads/images/medium_landscape/1/2669.jpg",
        "third" : "http://static.tvmaze.com/uploads/images/original_untouched/1/2671.jpg",
        "cellSegue": "http://static.tvmaze.com/uploads/images/original_untouched/1/2671.jpg"
        ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("performing segue", segue.identifier)

        if let sender = sender as? IndexPath {
            print("sender is index path \(sender.row)")
        }
        
        if let imageVC = segue.destination as? ImageViewController {
            let imageLink = imgURLDictionary[segue.identifier ?? ""]
            if let imageLink = imageLink {
                imageVC.imageURL = URL(string: imageLink)
            }
        }
    }

}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Test \(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            if let imageVC = storyboard?.instantiateViewController(identifier: "imageVC") as? ImageViewController {
                navigationController?.pushViewController(imageVC, animated: true)
            }
        case 1:
            performSegue(withIdentifier: "cellSegue", sender: indexPath)
        default:
            print("nothing")
        }
        
       
    }
}

