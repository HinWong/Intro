//
//  ViewController.swift
//  tableViewController
//
//  Created by Luat on 1/13/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var myTableView: UITableView!
    
    var people = [
        Person(name: "luke", profession: "dev"),
        Person(name: "luke2", profession: "dev2"),
        Person(name: "luke3", profession: "dev3"),
        Person(name: "luke4", profession: "dev4"),
        Person(name: "luke5", profession: "dev5"),
        Person(name: "luke6", profession: "dev6"),
        Person(name: "luke", profession: "dev"),
        Person(name: "luke2", profession: "dev2"),
        Person(name: "luke3", profession: "dev3"),
        Person(name: "luke4", profession: "dev4"),
        Person(name: "luke5", profession: "dev5"),
        Person(name: "luke6", profession: "dev6"),
        Person(name: "luke", profession: "dev"),
        Person(name: "luke2", profession: "dev2"),
        Person(name: "luke3", profession: "dev3"),
        Person(name: "luke4", profession: "dev4"),
        Person(name: "luke5", profession: "dev5"),
        Person(name: "luke6", profession: "dev6"),
        Person(name: "luke", profession: "dev"),
        Person(name: "luke2", profession: "dev2"),
        Person(name: "luke3", profession: "dev3"),
        Person(name: "luke4", profession: "dev4"),
        Person(name: "luke5", profession: "dev5"),
        Person(name: "luke6", profession: "dev6"),
        Person(name: "luke", profession: "dev"),
        Person(name: "luke2", profession: "dev2"),
        Person(name: "luke3", profession: "dev3"),
        Person(name: "luke4", profession: "dev4"),
        Person(name: "luke5", profession: "dev5"),
        Person(name: "luke6", profession: "dev6"),
        Person(name: "luke", profession: "dev"),
        Person(name: "luke2", profession: "dev2"),
        Person(name: "luke3", profession: "dev3"),
        Person(name: "luke4", profession: "dev4"),
        Person(name: "luke5", profession: "dev5"),
        Person(name: "luke6", profession: "dev6"),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.backgroundColor = .cyan
        myTableView.dataSource = self
        myTableView.delegate = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let person = people[indexPath.row]
        cell.textLabel?.text = "Name: \(person.name), Pro: \(person.profession)"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(people[indexPath.row].profession)
        let vcTwo = storyboard?.instantiateViewController(identifier: "two") as! ViewControllerTwo
        vcTwo.view.backgroundColor = .white
        vcTwo.configure(person: people[indexPath.row])
        navigationController?.pushViewController(vcTwo, animated: true)
        
    }
    
}

struct Person {
    let name: String
    let profession: String
}
